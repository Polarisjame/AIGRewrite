#include <string>

#include "src/abc_patch_gpu_test.h"

int main(int argc, char ** argv){
    std::string fpath = "../double_data/double_aig_arithmetic/double_sin.aig";
    testFlow(fpath);
    return 0;
}