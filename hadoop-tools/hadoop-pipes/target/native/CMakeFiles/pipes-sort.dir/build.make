# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native

# Include any dependencies generated for this target.
include CMakeFiles/pipes-sort.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pipes-sort.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pipes-sort.dir/flags.make

CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o: CMakeFiles/pipes-sort.dir/flags.make
CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o: /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src/main/native/examples/impl/sort.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o"
	/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o -c /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src/main/native/examples/impl/sort.cc

CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.i"
	/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src/main/native/examples/impl/sort.cc > CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.i

CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.s"
	/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src/main/native/examples/impl/sort.cc -o CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.s

# Object files for target pipes-sort
pipes__sort_OBJECTS = \
"CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o"

# External object files for target pipes-sort
pipes__sort_EXTERNAL_OBJECTS =

examples/pipes-sort: CMakeFiles/pipes-sort.dir/main/native/examples/impl/sort.cc.o
examples/pipes-sort: CMakeFiles/pipes-sort.dir/build.make
examples/pipes-sort: libhadooppipes.a
examples/pipes-sort: libhadooputils.a
examples/pipes-sort: /usr/lib64/libssl.so
examples/pipes-sort: /usr/lib64/libcrypto.so
examples/pipes-sort: CMakeFiles/pipes-sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable examples/pipes-sort"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pipes-sort.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pipes-sort.dir/build: examples/pipes-sort

.PHONY : CMakeFiles/pipes-sort.dir/build

CMakeFiles/pipes-sort.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pipes-sort.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pipes-sort.dir/clean

CMakeFiles/pipes-sort.dir/depend:
	cd /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/src /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native /home/kangdw/devel/hadoop-src/hadoop-tools/hadoop-pipes/target/native/CMakeFiles/pipes-sort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pipes-sort.dir/depend

