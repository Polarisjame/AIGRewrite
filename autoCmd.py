import os
import shutil

os.chdir('/home/zhoulingfeng/pythonProgram/AIGRewrite')

novelPath = os.path.join('./','build',)
abcPath = os.path.join('./','abc')
mode = 'novel'

# # NovelRewrite or ABCRewrite
# if mode == 'novel':
#     os.chdir(novelPath)
# else:
#     os.chdir(abcPath)
# dataPath = os.path.join('../','data')
# # traverse each aig file
# for dirs in os.listdir(dataPath):
#     targetPath = os.path.join('../',mode+'_rw_data','rw_'+dirs)
#     if not os.path.exists(targetPath):
#         os.makedirs(targetPath)
#     for file in os.listdir(os.path.join(dataPath,dirs)):
#         # print(file)
#         # ./gpuls -c "read ../abc/i10.aig; resyn2; write i10_resyn2.aig"
#         filePath = os.path.join(dataPath,dirs,file)
#         targetFilePath = os.path.join(targetPath,"rw_"+file)
#         if mode == 'novel':
#             os.system("./abcg -c \"read "+filePath+"; gget; grw; gput; ps; write "+targetFilePath+"\"")
#         else:
#             os.system("./abc -c \"r "+filePath+"; rw -lz; ps; w "+targetFilePath+"\"")


# cec
os.chdir('/home/zhoulingfeng/pythonProgram/AIGRewrite/abc')
novelRwPath = '../novel_rw_data'
abcRwPath = '../abc_rw_data'
for dirs in os.listdir(novelRwPath):
    for files in os.listdir(os.path.join(novelRwPath,dirs)):
        abcFile = os.path.join(abcRwPath,dirs,files)
        novelFile = os.path.join(novelRwPath,dirs,files)
        os.system("./abc -c \"&cec "+abcFile+" " + novelFile + "\"")
