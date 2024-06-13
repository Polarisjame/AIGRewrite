#include "src/abc_patch_gpu_test.h"

extern "C" int Abc_CommandBalance( Abc_Frame_t * pAbc, int argc, char ** argv );
extern "C" int Abc_CommandRewrite( Abc_Frame_t * pAbc, int argc, char ** argv );
extern "C" int Abc_CommandRefactor( Abc_Frame_t * pAbc, int argc, char ** argv );

__global__ void printNodesKernel(const int * pnNodes) {
    std::printf("AIG stats: nNodes = %d", *pnNodes);
}

int printNodes(AIGMan* gpuMan) {
    if(gpuMan->deviceAllocated){
        printNodesKernel<<<1,1>>>(gpuMan->d_pnNodes);
    }
    else{
        std::printf("%d\n",gpuMan->nNodes);
    }
    return 1;
}

int getNodesGpu(AIGMan* gpuMan){
    int nNodes;

    if(gpuMan->deviceAllocated){
        cudaMemcpy(&nNodes, gpuMan->d_pnNodes, sizeof(int), cudaMemcpyDeviceToHost);
    }
    else{
        nNodes = gpuMan->nNodes;
    }

    return nNodes;
}

int getNodesAbc(Abc_Frame_t* pAbc){
    Abc_Ntk_t* pNtk = pAbc->pNtkCur;
    return pNtk->vObjs->nSize - pNtk->vCis->nSize - pNtk->vCos->nSize - 1;
}

bool isStable(int currNodes, int prevNodes){
    int delta = prevNodes-currNodes;
    if(delta<0) return false;
    if((float)delta < 200) return true;
    // if (currNodes==prevNodes) return true;
    return false;
} 

int AIGRefresh(AIGMan* gpuMan){
    gpuMan->toHost();
    gpuMan->clearDevice();
    cudaDeviceSynchronize();
    return 1;
}


void Raina_balance(Abc_Frame_t * pAbc)
{
    char * balance_argv[1];
    balance_argv[0] = strdup("balance");
    int ret_balance = Abc_CommandBalance( pAbc, 1, balance_argv );
    free(balance_argv[0]);
    if(ret_balance != 0){
        Abc_Print(-1, "balance failed with code %d.\n",ret_balance);
        return;
    }
}

//rewrite (rw)
void Raina_rewirte(Abc_Frame_t * pAbc)
{
    char * rewrite_argv[1];
    rewrite_argv[0] = strdup("rewrite");
    int ret_rewrite = Abc_CommandRewrite( pAbc, 1, rewrite_argv);
    free(rewrite_argv[0]);
    if(ret_rewrite != 0){
        Abc_Print(-1, "rw failed with code %d.\n", ret_rewrite);
        return;
    }
}

//rewrite (rwz)
void Raina_rewritez(Abc_Frame_t * pAbc)
{
    char * rewritez_argv[2];
    rewritez_argv[0] = strdup("rewrite");
    rewritez_argv[1] = strdup("-z");
    int ret_rewritez = Abc_CommandRewrite( pAbc, 2, rewritez_argv);
    free(rewritez_argv[0]);
    free(rewritez_argv[1]);
    if(ret_rewritez != 0){
        Abc_Print(-1, "rwz failed with code %d.\n", ret_rewritez);
        return;
    }
}

//refactor (rf)
void Raina_refactor(Abc_Frame_t * pAbc)
{
    char * refactor_argv[1];
    refactor_argv[0] = strdup("refactor");
    int ret_refactor = Abc_CommandRefactor( pAbc, 1, refactor_argv);
    free(refactor_argv[0]);
    if(ret_refactor != 0){
        Abc_Print(-1, "refactor failed with code %d.\n", ret_refactor);
        return;
    }
}

//refactor (rfz)
void Raina_refactorz(Abc_Frame_t * pAbc)
{
    char * refactorz_argv[2];
    refactorz_argv[0] = strdup("refactor");
    refactorz_argv[1] = strdup("-z");
    int ret_refactorz = Abc_CommandRefactor( pAbc, 2, refactorz_argv);
    free(refactorz_argv[0]);
    free(refactorz_argv[1]);
    if(ret_refactorz != 0){
        Abc_Print(-1, "refactor failed with code %d.\n", ret_refactorz);
        return;
    }
}


/*
alias resyn2      "b; rw; rf; b; rw; rwz; b; rfz; rwz; b"
*/
void Raina_resyn2(Abc_Frame_t * pAbc)
{
    //b
    Raina_balance(pAbc);
    //rw
    Raina_rewirte(pAbc);
    //rf
    Raina_refactor(pAbc);
    //b
    Raina_balance(pAbc);
    //rw
    Raina_rewirte(pAbc);
    //rwz
    Raina_rewritez(pAbc);
    //b
    Raina_balance(pAbc);
    //rfz
    Raina_refactorz(pAbc);
    //rwz
    Raina_rewritez(pAbc);
    //b
    Raina_balance(pAbc);
}

int testFlow(std::string fpath){
    Abc_Frame_t * pAbc = Abc_FrameGetGlobalFrame();
    // cudaMalloc(&d_pnNodes, sizeof(int));
    Raina_CommandGpuRead(pAbc, fpath);
    // Raina_CommandGpuPrintStats(pAbc);

    AIGMan* gpuMan = getGpuMan();

    Abc_Ntk_t * pNtkNew = GpuManToAbcNtk(gpuMan);
    Abc_FrameReplaceCurrentNetwork(pAbc, pNtkNew);

    bool fUpdateLevel = true;
    int rfCutSize = 8;

    int iterCount = 0;
    // int prevNodes = getNodesGpu(gpuMan);
    int prevNodes = getNodesAbc(pAbc);
    int stableRounds = 0;
    std::printf("oriNodes:%d\n",prevNodes);
    
    while(1){
        iterCount++;
        // ***** GPUResyn2
        // Raina_CommandGpuResyn2(pAbc, rfCutSize, fUpdateLevel);
        // cudaDeviceSynchronize();
        // int currNodes = getNodes(gpuMan);
        
        // ***** AbcResyn2
        Raina_resyn2(pAbc);
        int currNodes = getNodesAbc(pAbc);
        std::printf("Iter:%d currNodes:%d\n",iterCount, currNodes);
        if(isStable(currNodes, prevNodes)){
            stableRounds++;
            while(stableRounds < 3){
                iterCount++;
                // Raina_CommandGpuResyn2(pAbc, rfCutSize, fUpdateLevel);
                // cudaDeviceSynchronize();
                // int currNodes = getNodesGpu(gpuMan);
                Raina_resyn2(pAbc);
                int currNodes = getNodesAbc(pAbc);
                std::printf("Iter:%d currNodes:%d\n",iterCount, currNodes);
                if(!isStable(currNodes, prevNodes)){
                    stableRounds=0;
                    break;
                }
                stableRounds++;
            }
        }
        if (stableRounds==3) break;
        prevNodes = currNodes;
    }

    return 1;
}