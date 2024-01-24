# RethinkingAIG
a GPU-based logic synthesis tool developed by [CULS](https://github.com/cuhk-eda/CULS) 

---
>update:
2024/1/19: 整合了ABC的compress2，compress2rs综合流注册到PATCH_ABC模式中

## Dependencies
* CMake >= 3.8
* GCC >= 7.5.0
* CUDA >= 11.4

## build ABC mode with Docker
You can build ABC mode with AIG-GPU container
```bash
docker run -it -w /usr/Project/AIGRewrite polarisjame/ubuntu-cuda:AIG-GPU
```
or build the Project by following steps

## Building
* clone ABC project
    ```bash
    git clone [abc address]
    ```
* Build as a standalone tool:
    ```bash
    mkdir build && cd build
    cmake ..
    make
    ```
    The built binary executable will be named `gpuls`. 

* Build as a patch of ABC:
    ```bash
    mkdir build && cd build
    cmake .. -DPATCH_ABC=1
    make
    ```
    The built binary executable will be named `abcg`. 

    If the readline library is installed in a custom path on your machine,
    add the option `-DREADLINE_ROOT_DIR=<readline_path>` when invoking cmake.
    CULS can still be successfully built even if the readline library 
    is not found.

## Getting started

* Standalone mode

    To interact with the command prompt, run
    ```bash
    ./gpuls
    ```
    
    You can also directly execute a script, e.g., 
    ```bash
    ./gpuls -c "read ../abc/i10.aig; resyn2; write i10_resyn2.aig"
    ```
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

## byShell
to deal with multiple AIGs, run
```bash
cd pyCommand
sh runNovel.sh
```
original data are stored under ../data and use func doubleAig in autoCmd.py to double it.
more info run
```bash
python autoCmd.py -h
```

