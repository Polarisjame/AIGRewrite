#include "base/main/main.h"
#include "base/main/mainInt.h"
#include "base/main/abcapis.h"
#include "base/abc/abc.h"

#include "aig_manager.h"

namespace abcPatch {

struct GpuFrame {
    AIGMan * pMan;
    bool active;
};

// declarations
AIGMan * getGpuMan();
bool gpuManIsActive();
void gpuManSetActive();
void gpuManSetInactive();

bool AbcNtkToGpuMan(Abc_Ntk_t * pNtk, AIGMan * pMan);
Abc_Ntk_t * GpuManToAbcNtk(AIGMan * pMan);

void registerAllAbcCommands(Abc_Frame_t * pAbc);

// dedicated helpers
const int AigConst1 = 0;
inline int AigNodeID(int lit) { return lit >> 1; }
inline int AigNodeIsComplement(int lit) { return lit & 1; }
inline int AigNodeLitCond(int nodeId, int complement) {
    return (int)(((unsigned)nodeId << 1) | (unsigned)(complement != 0));
}

// gpu cmds
int Abc_CommandGpuRead(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuWrite(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuTime(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuPrintStats(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuBalance(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuRewrite(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuRefactor(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuStrash(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuResyn2(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuGet(Abc_Frame_t * pAbc, int argc, char ** argv);
int Abc_CommandGpuPut(Abc_Frame_t * pAbc, int argc, char ** argv);

} // namespace abcPatch

// raina gpu cmds
int Raina_CommandGpuWrite(Abc_Frame_t * pAbc, std::string path);
int Raina_CommandGpuRead(Abc_Frame_t * pAbc, std::string path);
int Raina_CommandGpuTime(Abc_Frame_t * pAbc);
int Raina_CommandGpuPrintStats(Abc_Frame_t * pAbc);
int Raina_CommandGpuBalance(Abc_Frame_t * pAbc);
int Raina_CommandGpuRewrite(Abc_Frame_t * pAbc, bool fUseZeros, bool fUpdateLevel = false);
int Raina_CommandGpuRefactor(Abc_Frame_t * pAbc, bool fUseZeros, bool fAlgMFFC, int cutSize);
int Raina_CommandGpuStrash(Abc_Frame_t * pAbc);
int Raina_CommandGpuResyn2(Abc_Frame_t * pAbc, int cutSize, bool fUpdateLevel = false);
int Raina_CommandGpuGet(Abc_Frame_t * pAbc);
int Raina_CommandGpuPut(Abc_Frame_t * pAbc);