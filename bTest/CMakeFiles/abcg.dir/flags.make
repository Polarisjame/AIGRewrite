# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# compile C with /usr/bin/gcc
# compile CUDA with /usr/local/cuda/bin/nvcc
# compile CXX with /usr/bin/g++
C_DEFINES = -DPATCH_ABC

C_INCLUDES = -I/home/zhoulingfeng/EDAProject/AIGRewrite/src -I/home/zhoulingfeng/EDAProject/AIGRewrite/src/hash_table -I/home/zhoulingfeng/EDAProject/AIGRewrite/abc/src

C_FLAGS = -Wall -Wno-unused-function -Wno-write-strings -Wno-sign-compare -DLIN64 -DSIZEOF_VOID_P=8 -DSIZEOF_LONG=8 -DSIZEOF_INT=4 -DABC_USE_CUDD=1 -DABC_USE_READLINE -I/usr/include -DABC_USE_PTHREADS -Wno-unused-but-set-variable

CUDA_DEFINES = -DPATCH_ABC

CUDA_INCLUDES = --options-file CMakeFiles/abcg.dir/includes_CUDA.rsp

CUDA_FLAGS = -std=c++17 -DLIN64 -DSIZEOF_VOID_P=8 -DSIZEOF_LONG=8 -DSIZEOF_INT=4 -DABC_USE_CUDD=1 -DABC_USE_READLINE -DABC_USE_PTHREADS -arch=compute_60 -code=compute_60,sm_60,sm_86 -std=c++17 -O3 --extended-lambda

CXX_DEFINES = -DPATCH_ABC

CXX_INCLUDES = -I/home/zhoulingfeng/EDAProject/AIGRewrite/src -I/home/zhoulingfeng/EDAProject/AIGRewrite/src/hash_table -I/home/zhoulingfeng/EDAProject/AIGRewrite/abc/src

CXX_FLAGS = -std=gnu++17 -Wall -Wno-unused-function -Wno-write-strings -Wno-sign-compare -DLIN64 -DSIZEOF_VOID_P=8 -DSIZEOF_LONG=8 -DSIZEOF_INT=4 -DABC_USE_CUDD=1 -DABC_USE_READLINE -I/usr/include -DABC_USE_PTHREADS -Wno-unused-but-set-variable

