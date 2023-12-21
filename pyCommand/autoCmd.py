import json
import os
import shutil
import subprocess
from config import *

def IsLarge(fileName):
    return 'div.aig' in fileName or 'hyp.aig' in fileName or 'mem_ctrl.aig' in fileName

def doubleAig(dataPath):
    # double AIG size
    os.chdir('./build')
    for dirs in os.listdir(dataPath):
        if opt.mtm and dirs != 'MtM':
            continue
        if not opt.mtm and dirs == 'MtM':
            break
        targetPath = os.path.join('../','double_data_s','double_'+dirs)
        if not os.path.exists(targetPath):
            os.makedirs(targetPath)
        for file in os.listdir(os.path.join(dataPath,dirs)):
            doubleRound = 10
            if file == 'hyp.aig':
                doubleRound = 7
            elif file == 'div.aig':
                doubleRound = 9
            elif file == 'mem_ctrl.aig':
                doubleRound = 9
            else:
                continue
            doublecmd = "double; " * doubleRound
            filePath = os.path.join(dataPath,dirs,file)
            targetFilePath = os.path.join(targetPath,"double_"+file)
            os.system("./abcg -c \"read "+filePath+"; logic; "+doublecmd+"strash; ps; write "+targetFilePath+"\"")
    os.chdir('../')

class Command():
    def __init__(self,path:str, opt):
        self.mode = opt.mode
        self.path = path
        self.mtm = opt.mtm
        self.src = opt.src
        self.cmd = opt.cmd
        self.double = opt.double
        self.trf = opt.trf
        self.trw = opt.trw
        os.chdir(self.path)

    def getDataPath(self):
        self.dataPath = ''
        if self.mtm:
            self.dataPath = os.path.join('../','MtM')
        else:
            if self.src == 'epfl':
                if self.double:
                    self.dataPath = os.path.join('../','double_data')
                else:
                    self.dataPath = os.path.join('../','data')
            else:
                self.dataPath = os.path.join('../','case')
        print('read from: ' + self.dataPath)
    
    def getCmd(self, mode, cmd, filePath):
        gpuRf = 'grf; '
        gpuRw = 'grw; '
        if self.trw:
            gpuRw = gpuRw + gpuRw
        if self.trf:
            gpuRf = gpuRf + gpuRf
        if mode == 'novel':
            if cmd == 'rewrite':
                return f"./abcg -c \"read {filePath}; gget; time; {gpuRw} time; gput; ps; \""
            elif cmd == 'balance':
                return f"./abcg -c \"read {filePath}; gget; time; gb; time; gput; ps; \""
            elif cmd == 'refactor':
                return f"./abcg -c \"read {filePath}; gget; time; {gpuRf} time; gput; ps; \""
            elif cmd == 'rf_resyn':
                return f"./abcg -c \"read {filePath}; gget; time; gb; grf; grf -z; gb; grf -z; gb; time; gput; ps; \""
            elif cmd == 'resyn2':
                return f"./abcg -c \"read {filePath}; gget; time; gresyn2; time; gput; ps; \""
                    # b; rw -d; rf -m; st; b; rw -d; rw -z -d; rw -z -d; b -s; rf -m -z; st; 
                    # rw -z -d; rw -z -d; b -s
                    # "read ../double_data/double_aig_arithmetic/double_log2.aig; gget; time; gb; grw -d; grf -z; st; gb; grw -d; grw -z -d; grw -z -d; gb -s; grf -z; st; grw -z -d; grw -z -d; gb -s; time; gput; ps; "
        else:
            if cmd == 'rewrite':
                return "./abc -c \"r "+filePath+"; time; drw ; time; ps; \""
            elif cmd == 'balance':
                return "./abc -c \"r "+filePath+"; time; balance ; time; ps; \""
            elif cmd == 'refactor':
                return "./abc -c \"r "+filePath+"; time; drf ; time; ps; \""
            elif cmd == 'rf_resyn':
                return "./abc -c \"r "+filePath+"; time; b; rf; rfz; b; rfz; b; time; ps; \""
            elif cmd == 'resyn2':
                return "./abc -c \"r "+filePath+"; time; resyn2; time; ps; \""

    def run(self):
        for dirs in os.listdir(self.dataPath):
            if self.src == 'mtm' or self.src == 'case':
                targetPath = os.path.join('../',self.mode+'_'+self.cmd+'_data')
            else:
                targetPath = os.path.join('../',self.mode+'_'+self.cmd+'_data',self.cmd+'_'+dirs)
            if not os.path.exists(targetPath):
                os.makedirs(targetPath)
            if self.mtm or self.src == 'case':
                filePath = os.path.join(self.dataPath,dirs)
                targetFilePath = os.path.join(targetPath,self.cmd+"_"+dirs)
                cmdLine = self.getCmd(self.mode, self.cmd, filePath)
                p=subprocess.Popen(cmdLine,shell=True)
                p.wait()
                continue
            for file in os.listdir(os.path.join(self.dataPath,dirs)):
                filePath = os.path.join(self.dataPath,dirs,file)
                if not('div.aig' in file or 'hyp.aig' in file or 'mem_ctrl' in file):
                    continue
                if (self.cmd == 'refactor' or self.cmd == 'rf_resyn' or self.cmd == 'resyn2') and IsLarge(file):
                    filePath = os.path.join(self.dataPath+'_s',dirs,file)
                targetFilePath = os.path.join(targetPath,self.cmd+"_"+file)
                cmdLine = self.getCmd(self.mode, self.cmd, filePath)
                p=subprocess.Popen(cmdLine,shell=True)
                p.wait()
        os.chdir('../')
        print("Finish")


# cec
# os.chdir('/home/zhoulingfeng/pythonProgram/AIGRewrite/abc')
# novelRwPath = '../novel_rw_data'
# abcRwPath = '../abc_rw_data'
# for dirs in os.listdir(novelRwPath):
#     for files in os.listdir(os.path.join(novelRwPath,dirs)):
#         abcFile = os.path.join(abcRwPath,dirs,files)
#         novelFile = os.path.join(novelRwPath,dirs,files)
#         os.system("./abc -c \"&cec "+abcFile+" " + novelFile + "\"")

def main(opt):
    os.chdir('/home/zhoulingfeng/EDAProject/AIGRewrite')
    # doubleAig('../data')
    if opt.mode == 'novel':
        path = os.path.join('./','build',)
    else:
        path = os.path.join('./','abc')
    autoCmd = Command(path, opt)
    autoCmd.getDataPath()
    autoCmd.run()
    

if __name__ == "__main__":
    print('processId:', os.getpid())
    print('prarent processId:', os.getppid())
    opt = get_opt()
    print(json.dumps(opt.__dict__, indent=4))
    main(opt)