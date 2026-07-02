# AIG-GPU CMD

>tips: need to delete static definition of refactor/rewrite/balance in abc/src/abci/abc.c since they're externed in abc_patch_gpu_test.cu
## Dependencies
* CMake >= 3.8
* GCC >= 7.5.0
* CUDA >= 11.4

## build ABC mode with Docker
* Requirement
  * docker
  * nvidia-docker

You can build ABC mode with AIG-GPU container
```bash
docker run -it --gpus [num of GPUs wanna use] -w /usr/Project/AIGRewrite polarisjame/ubuntu-cuda:AIG-GPU
```
or build the Project by following steps

## Building
* clone ABC project
    ```bash
    git clone [abc address]
    ```
* Build as a patch of ABC:
    ```bash
    mkdir build && cd build
    cmake .. 
    make
    ```
    The built binary executable will be named `abcg`. 

## Getting started
* ABC patch mode

    The usage is the same as ABC. For instance, 
    ```bash
    ./abcg -c "read ../abc/i10.aig; gget; gresyn2; gput; print_stats; cec -n"
    ```

## Commands

* Standalone mode
    * `read`: read an AIG from a file
    * `write`: dump the internal AIG to a file
    * `b`: AIG balancing
    * `rw`: AIG rewriting
    * `rf`: AIG refactoring
    * `st`: strashing and dangling-node removal
    * `resyn2`: perform the resyn2 optimization script
    * `ps`: print AIG statistics
    * `time`: print time statistics

* ABC patch mode

    The above commands will be prefixed by `g`, e.g., `grf`
    for AIG refactoring. 

    Additionally, there are two commands `gget` and `gput` for converting the
    AIG data structure from ABC to GPU, and from GPU to ABC, respectively,
    similar to the ABC9 package. 
