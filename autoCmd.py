import os
import shutil

def doubleAig(dataPath):
    # double AIG size
    os.chdir('./build')
    for dirs in os.listdir(dataPath):
        if dirs == 'MtM':
            break
        targetPath = os.path.join('../','double_data','double_'+dirs)
        if not os.path.exists(targetPath):
            os.makedirs(targetPath)
        for file in os.listdir(os.path.join(dataPath,dirs)):
            doubleRound = 10
            if file == 'hyp.aig':
                doubleRound = 8
            doublecmd = "double; " * doubleRound
            filePath = os.path.join(dataPath,dirs,file)
            targetFilePath = os.path.join(targetPath,"double_"+file)
            os.system("./abcg -c \"read "+filePath+"; logic; "+doublecmd+"strash; ps; write "+targetFilePath+"\"")
    os.chdir('../')

def ReWrite(mode:str, path:str):
    # NovelRewrite or ABCRewrite
    os.chdir(path)
    dataPath = os.path.join('../','data')
    # traverse each aig file
    for dirs in os.listdir(dataPath):
        if dirs != 'MtM':
            continue
        targetPath = os.path.join('../',mode+'_MtM_rw_data','rw_'+dirs)
        if not os.path.exists(targetPath):
            os.makedirs(targetPath)
        for file in os.listdir(os.path.join(dataPath,dirs)):
            # print(file)
            # ./gpuls -c "read ../abc/i10.aig; resyn2; write i10_resyn2.aig"
            filePath = os.path.join(dataPath,dirs,file)
            targetFilePath = os.path.join(targetPath,"rw_"+file)
            if mode == 'novel':
                os.system("./abcg -c \"read "+filePath+"; gget; time; grw; time; gput; ps; write "+targetFilePath+"\"")
            else:
                os.system("./abc -c \"r "+filePath+"; time; rw -lz; time; ps; w "+targetFilePath+"\"")
    os.chdir('../')



# cec
# os.chdir('/home/zhoulingfeng/pythonProgram/AIGRewrite/abc')
# novelRwPath = '../novel_rw_data'
# abcRwPath = '../abc_rw_data'
# for dirs in os.listdir(novelRwPath):
#     for files in os.listdir(os.path.join(novelRwPath,dirs)):
#         abcFile = os.path.join(abcRwPath,dirs,files)
#         novelFile = os.path.join(novelRwPath,dirs,files)
#         os.system("./abc -c \"&cec "+abcFile+" " + novelFile + "\"")

def main():
    print('processId:', os.getpid())
    os.chdir('/home/zhoulingfeng/pythonProgram/AIGRewrite')
    # doubleAig('../data')
    novelPath = os.path.join('./','build',)
    abcPath = os.path.join('./','abc')
    # ReWrite('novel', novelPath)
    ReWrite('abc', abcPath)

if __name__ == "__main__":
    main()