# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhoulingfeng/EDAProject/AIGRewrite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhoulingfeng/EDAProject/AIGRewrite/bTest

# Include any dependencies generated for this target.
include CMakeFiles/gpuls.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/gpuls.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gpuls.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gpuls.dir/flags.make

CMakeFiles/gpuls.dir/src/command_manager.cpp.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/command_manager.cpp.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/command_manager.cpp
CMakeFiles/gpuls.dir/src/command_manager.cpp.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gpuls.dir/src/command_manager.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/command_manager.cpp.o -MF CMakeFiles/gpuls.dir/src/command_manager.cpp.o.d -o CMakeFiles/gpuls.dir/src/command_manager.cpp.o -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/command_manager.cpp

CMakeFiles/gpuls.dir/src/command_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/gpuls.dir/src/command_manager.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhoulingfeng/EDAProject/AIGRewrite/src/command_manager.cpp > CMakeFiles/gpuls.dir/src/command_manager.cpp.i

CMakeFiles/gpuls.dir/src/command_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/gpuls.dir/src/command_manager.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhoulingfeng/EDAProject/AIGRewrite/src/command_manager.cpp -o CMakeFiles/gpuls.dir/src/command_manager.cpp.s

CMakeFiles/gpuls.dir/src/main.cpp.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/main.cpp.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/main.cpp
CMakeFiles/gpuls.dir/src/main.cpp.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/gpuls.dir/src/main.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/main.cpp.o -MF CMakeFiles/gpuls.dir/src/main.cpp.o.d -o CMakeFiles/gpuls.dir/src/main.cpp.o -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/main.cpp

CMakeFiles/gpuls.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/gpuls.dir/src/main.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhoulingfeng/EDAProject/AIGRewrite/src/main.cpp > CMakeFiles/gpuls.dir/src/main.cpp.i

CMakeFiles/gpuls.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/gpuls.dir/src/main.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhoulingfeng/EDAProject/AIGRewrite/src/main.cpp -o CMakeFiles/gpuls.dir/src/main.cpp.s

CMakeFiles/gpuls.dir/src/aig/strash.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/aig/strash.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/aig/strash.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig/strash.cu
CMakeFiles/gpuls.dir/src/aig/strash.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CUDA object CMakeFiles/gpuls.dir/src/aig/strash.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/aig/strash.cu.o -MF CMakeFiles/gpuls.dir/src/aig/strash.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig/strash.cu -o CMakeFiles/gpuls.dir/src/aig/strash.cu.o

CMakeFiles/gpuls.dir/src/aig/strash.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/aig/strash.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/aig/strash.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/aig/strash.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/aig/truth.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/aig/truth.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/aig/truth.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig/truth.cu
CMakeFiles/gpuls.dir/src/aig/truth.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CUDA object CMakeFiles/gpuls.dir/src/aig/truth.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/aig/truth.cu.o -MF CMakeFiles/gpuls.dir/src/aig/truth.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig/truth.cu -o CMakeFiles/gpuls.dir/src/aig/truth.cu.o

CMakeFiles/gpuls.dir/src/aig/truth.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/aig/truth.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/aig/truth.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/aig/truth.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/aig_manager.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/aig_manager.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/aig_manager.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig_manager.cu
CMakeFiles/gpuls.dir/src/aig_manager.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CUDA object CMakeFiles/gpuls.dir/src/aig_manager.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/aig_manager.cu.o -MF CMakeFiles/gpuls.dir/src/aig_manager.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/aig_manager.cu -o CMakeFiles/gpuls.dir/src/aig_manager.cu.o

CMakeFiles/gpuls.dir/src/aig_manager.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/aig_manager.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/aig_manager.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/aig_manager.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/balance.cu
CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CUDA object CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o -MF CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/balance.cu -o CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o

CMakeFiles/gpuls.dir/src/algorithms/balance.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/algorithms/balance.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/balance.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/algorithms/balance.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor.cu
CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CUDA object CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o -MF CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor.cu -o CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o

CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor_core.cu
CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CUDA object CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o -MF CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor_core.cu -o CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o

CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor_mffc.cu
CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CUDA object CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o -MF CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/refactor_mffc.cu -o CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o

CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/rewrite.cu
CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CUDA object CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o -MF CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/algorithms/rewrite.cu -o CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o

CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/gpuls.dir/src/misc/print.cu.o: CMakeFiles/gpuls.dir/flags.make
CMakeFiles/gpuls.dir/src/misc/print.cu.o: CMakeFiles/gpuls.dir/includes_CUDA.rsp
CMakeFiles/gpuls.dir/src/misc/print.cu.o: /home/zhoulingfeng/EDAProject/AIGRewrite/src/misc/print.cu
CMakeFiles/gpuls.dir/src/misc/print.cu.o: CMakeFiles/gpuls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CUDA object CMakeFiles/gpuls.dir/src/misc/print.cu.o"
	/usr/local/cuda/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/gpuls.dir/src/misc/print.cu.o -MF CMakeFiles/gpuls.dir/src/misc/print.cu.o.d -x cu -c /home/zhoulingfeng/EDAProject/AIGRewrite/src/misc/print.cu -o CMakeFiles/gpuls.dir/src/misc/print.cu.o

CMakeFiles/gpuls.dir/src/misc/print.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/gpuls.dir/src/misc/print.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/gpuls.dir/src/misc/print.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/gpuls.dir/src/misc/print.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target gpuls
gpuls_OBJECTS = \
"CMakeFiles/gpuls.dir/src/command_manager.cpp.o" \
"CMakeFiles/gpuls.dir/src/main.cpp.o" \
"CMakeFiles/gpuls.dir/src/aig/strash.cu.o" \
"CMakeFiles/gpuls.dir/src/aig/truth.cu.o" \
"CMakeFiles/gpuls.dir/src/aig_manager.cu.o" \
"CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o" \
"CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o" \
"CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o" \
"CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o" \
"CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o" \
"CMakeFiles/gpuls.dir/src/misc/print.cu.o"

# External object files for target gpuls
gpuls_EXTERNAL_OBJECTS =

gpuls: CMakeFiles/gpuls.dir/src/command_manager.cpp.o
gpuls: CMakeFiles/gpuls.dir/src/main.cpp.o
gpuls: CMakeFiles/gpuls.dir/src/aig/strash.cu.o
gpuls: CMakeFiles/gpuls.dir/src/aig/truth.cu.o
gpuls: CMakeFiles/gpuls.dir/src/aig_manager.cu.o
gpuls: CMakeFiles/gpuls.dir/src/algorithms/balance.cu.o
gpuls: CMakeFiles/gpuls.dir/src/algorithms/refactor.cu.o
gpuls: CMakeFiles/gpuls.dir/src/algorithms/refactor_core.cu.o
gpuls: CMakeFiles/gpuls.dir/src/algorithms/refactor_mffc.cu.o
gpuls: CMakeFiles/gpuls.dir/src/algorithms/rewrite.cu.o
gpuls: CMakeFiles/gpuls.dir/src/misc/print.cu.o
gpuls: CMakeFiles/gpuls.dir/build.make
gpuls: CMakeFiles/gpuls.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable gpuls"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpuls.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gpuls.dir/build: gpuls
.PHONY : CMakeFiles/gpuls.dir/build

CMakeFiles/gpuls.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gpuls.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gpuls.dir/clean

CMakeFiles/gpuls.dir/depend:
	cd /home/zhoulingfeng/EDAProject/AIGRewrite/bTest && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhoulingfeng/EDAProject/AIGRewrite /home/zhoulingfeng/EDAProject/AIGRewrite /home/zhoulingfeng/EDAProject/AIGRewrite/bTest /home/zhoulingfeng/EDAProject/AIGRewrite/bTest /home/zhoulingfeng/EDAProject/AIGRewrite/bTest/CMakeFiles/gpuls.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/gpuls.dir/depend
