# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aditya/quinoa/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aditya/quinoa/cmake

# Include any dependencies generated for this target.
include RNG/CMakeFiles/RNG.dir/depend.make

# Include the progress variables for this target.
include RNG/CMakeFiles/RNG.dir/progress.make

# Include the compile flags for this target's objects.
include RNG/CMakeFiles/RNG.dir/flags.make

RNG/CMakeFiles/RNG.dir/RNGStack.C.o: RNG/CMakeFiles/RNG.dir/flags.make
RNG/CMakeFiles/RNG.dir/RNGStack.C.o: /home/aditya/quinoa/src/RNG/RNGStack.C
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aditya/quinoa/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object RNG/CMakeFiles/RNG.dir/RNGStack.C.o"
	cd /home/aditya/quinoa/cmake/RNG && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RNG.dir/RNGStack.C.o -c /home/aditya/quinoa/src/RNG/RNGStack.C

RNG/CMakeFiles/RNG.dir/RNGStack.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RNG.dir/RNGStack.C.i"
	cd /home/aditya/quinoa/cmake/RNG && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aditya/quinoa/src/RNG/RNGStack.C > CMakeFiles/RNG.dir/RNGStack.C.i

RNG/CMakeFiles/RNG.dir/RNGStack.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RNG.dir/RNGStack.C.s"
	cd /home/aditya/quinoa/cmake/RNG && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aditya/quinoa/src/RNG/RNGStack.C -o CMakeFiles/RNG.dir/RNGStack.C.s

RNG/CMakeFiles/RNG.dir/RNGStack.C.o.requires:

.PHONY : RNG/CMakeFiles/RNG.dir/RNGStack.C.o.requires

RNG/CMakeFiles/RNG.dir/RNGStack.C.o.provides: RNG/CMakeFiles/RNG.dir/RNGStack.C.o.requires
	$(MAKE) -f RNG/CMakeFiles/RNG.dir/build.make RNG/CMakeFiles/RNG.dir/RNGStack.C.o.provides.build
.PHONY : RNG/CMakeFiles/RNG.dir/RNGStack.C.o.provides

RNG/CMakeFiles/RNG.dir/RNGStack.C.o.provides.build: RNG/CMakeFiles/RNG.dir/RNGStack.C.o


# Object files for target RNG
RNG_OBJECTS = \
"CMakeFiles/RNG.dir/RNGStack.C.o"

# External object files for target RNG
RNG_EXTERNAL_OBJECTS =

RNG/libquinoa_rng.so: RNG/CMakeFiles/RNG.dir/RNGStack.C.o
RNG/libquinoa_rng.so: RNG/CMakeFiles/RNG.dir/build.make
RNG/libquinoa_rng.so: RNG/CMakeFiles/RNG.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aditya/quinoa/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libquinoa_rng.so"
	cd /home/aditya/quinoa/cmake/RNG && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RNG.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
RNG/CMakeFiles/RNG.dir/build: RNG/libquinoa_rng.so

.PHONY : RNG/CMakeFiles/RNG.dir/build

RNG/CMakeFiles/RNG.dir/requires: RNG/CMakeFiles/RNG.dir/RNGStack.C.o.requires

.PHONY : RNG/CMakeFiles/RNG.dir/requires

RNG/CMakeFiles/RNG.dir/clean:
	cd /home/aditya/quinoa/cmake/RNG && $(CMAKE_COMMAND) -P CMakeFiles/RNG.dir/cmake_clean.cmake
.PHONY : RNG/CMakeFiles/RNG.dir/clean

RNG/CMakeFiles/RNG.dir/depend:
	cd /home/aditya/quinoa/cmake && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aditya/quinoa/src /home/aditya/quinoa/src/RNG /home/aditya/quinoa/cmake /home/aditya/quinoa/cmake/RNG /home/aditya/quinoa/cmake/RNG/CMakeFiles/RNG.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : RNG/CMakeFiles/RNG.dir/depend

