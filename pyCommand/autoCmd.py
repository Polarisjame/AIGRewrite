import json
import os
import shutil
import time
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
                self.dataPath = os.path.join('../','caseV2aiger')
        logging('read from: ' + self.dataPath)
    
    def getCmd(self, mode, cmd, filePath, targetFilePath):
        gpuRf = 'grf; '
        gpuRw = 'grw; '
        writeCmd = ""
        if self.trw:
            gpuRw = gpuRw + gpuRw
        if self.trf:
            gpuRf = gpuRf + gpuRf
        if targetFilePath != "":
            writeCmd = f"write {targetFilePath}"
        if mode == 'novel':
            if cmd == 'rewrite':
                return f"./abcg -c \"gread {filePath}; gtime; {gpuRw} gtime; gps; {writeCmd}\""
            elif cmd == 'balance':
                return f"./abcg -c \"gread {filePath}; gtime; gb; gtime; gps; {writeCmd}\""
            elif cmd == 'refactor':
                return f"./abcg -c \"gread {filePath}; gtime; {gpuRf} gtime; gps; {writeCmd}\""
            elif cmd == 'rf_resyn':
                return f"./abcg -c \"gread {filePath}; gtime; gb; grf; grf -z; gb; grf -z; gb; gtime; gps; {writeCmd}\""
            elif cmd == 'resyn2':
                return f"./abcg -c \"gread {filePath}; gtime; gresyn2 -K 11; gtime; gput; gps; {writeCmd}\""
                    # b; rw -d; rf -m; st; b; rw -d; rw -z -d; rw -z -d; b -s; rf -m -z; st; 
                    # rw -z -d; rw -z -d; b -s
                    # "read ../double_data/double_aig_arithmetic/double_log2.aig; gget; time; gb; grw -d; grf -z; st; gb; grw -d; grw -z -d; grw -z -d; gb -s; grf -z; st; grw -z -d; grw -z -d; gb -s; time; gput; ps; "
        else:
            if cmd == 'rewrite':
                return f"./abc -c \"r {filePath}; time; drw ; time; ps; {writeCmd}\""
            elif cmd == 'balance':
                return f"./abc -c \"r {filePath}; time; balance ; time; ps; {writeCmd}\""
            elif cmd == 'refactor':
                return f"./abc -c \"r {filePath}; time; drf ; time; ps; {writeCmd}\""
            elif cmd == 'rf_resyn':
                return f"./abc -c \"r {filePath}; time; b; rf; rfz; b; rfz; b; time; ps; {writeCmd}\""
            elif cmd == 'resyn2':
                return f"./abc -c \"r {filePath}; time; resyn2; time; ps; {writeCmd}\""

    def run(self):
        dirList = os.listdir(self.dataPath)
        dirList.sort()
        for dirs in dirList:
            if self.src == 'mtm' or self.src == 'case':
                targetPath = os.path.join('../',self.src+'_'+self.mode+'_'+self.cmd+'_data')
            else:
                targetPath = os.path.join('../',self.mode+'_'+self.cmd+'_data',self.cmd+'_'+dirs)
            if not os.path.exists(targetPath):
                os.makedirs(targetPath)
            if self.mtm or self.src == 'case':
                filePath = os.path.join(self.dataPath,dirs)
                targetFilePath = os.path.join(targetPath,dirs)
                cmdLine = self.getCmd(self.mode, self.cmd, filePath, targetFilePath)
                logging(f'Read From {filePath}')
                p=subprocess.Popen(cmdLine,shell=True)
                # p.wait()
                time.sleep(3)
                continue
            for file in os.listdir(os.path.join(self.dataPath,dirs)):
                filePath = os.path.join(self.dataPath,dirs,file)
                if not('div.aig' in file or 'hyp.aig' in file or 'mem_ctrl' in file):
                    continue
                if (self.cmd == 'refactor' or self.cmd == 'rf_resyn' or self.cmd == 'resyn2') and IsLarge(file):
                    filePath = os.path.join(self.dataPath+'_s',dirs,file)
                targetFilePath = os.path.join(targetPath,self.cmd+"_"+file)
                logging(f'Read From {filePath}')
                cmdLine = self.getCmd(self.mode, self.cmd, filePath, "")
                p=subprocess.Popen(cmdLine,shell=True)
                p.wait()
                time.sleep(3)
        os.chdir('../')
        logging("Finish")

    def CEC(self, abcPath,novelPath):
        os.chdir('/home/zhoulingfeng/EDAProject/AIGRewrite/abc')
        dirList = os.listdir(novelPath)
        dirList.sort()
        for dirs in dirList:
            abcFile = os.path.join(abcPath,dirs)
            novelFile = os.path.join(novelPath,dirs)
            p=subprocess.Popen("./abc -c \"&cec "+abcFile+" " + novelFile + "\"",shell=True)
            p.wait()

    def verilog2AIG(self, vPath):
        os.chdir(r'/home/zhoulingfeng/EDAProject/AIGRewrite')
        logging(f"read from {vPath}")
        for file in os.listdir(vPath):
            readPath = os.path.join(os.getcwd(),vPath,file)
            writePath = os.path.join(os.getcwd(),'caseV2aiger',file.split('.v')[0]+'.aig')
            # file.split('.')[0]
            cmdLine = f"../yosys/yosys -p \"read_verilog {readPath}; synth -flatten -top {file.split('.')[0]}; abc -dff; abc -g AND; write_aiger {writePath}\""
            # ../yosys/yosys -p "read_verilog /home/zhoulingfeng/EDAProject/AIGRewrite/caseV/sklansky_add.v; synth -top sklansky; abc -dff; abc -g AND; write_aiger /home/zhoulingfeng/EDAProject/AIGRewrite/caseV2aiger/sklansky_add.aig"
            logging(f"Running CMD {cmdLine}")
            p=subprocess.Popen(cmdLine,shell=True)
            p.wait()

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
        path = os.path.join('./','bTest',)
    else:
        path = os.path.join('./','abc')
    vPath = 'caseV'
    novelPath = '../case_novel_refactor_data'
    abcPath = '../caseV2aiger' 
    autoCmd = Command(path, opt)
    if opt.act == 'cec':
        autoCmd.CEC(abcPath, novelPath)
    if opt.act == 'verilog':
        autoCmd.verilog2AIG(vPath)
    if opt.act == 'syn':
        autoCmd.getDataPath()
        autoCmd.run()
    

if __name__ == "__main__":
    logging(f'processId: {os.getpid()}')
    logging(f'prarent processId: {os.getppid()}')
    opt = get_opt()
    logging(json.dumps(opt.__dict__, indent=4))
    main(opt)