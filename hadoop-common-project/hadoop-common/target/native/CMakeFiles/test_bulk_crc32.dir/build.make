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
CMAKE_SOURCE_DIR = /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native

# Include any dependencies generated for this target.
include CMakeFiles/test_bulk_crc32.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_bulk_crc32.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_bulk_crc32.dir/flags.make

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o: CMakeFiles/test_bulk_crc32.dir/flags.make
CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o: /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o   -c /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32.c

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32.c > CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.i

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32.c -o CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.s

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o: CMakeFiles/test_bulk_crc32.dir/flags.make
CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o: /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o   -c /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c > CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.i

CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c -o CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.s

CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o: CMakeFiles/test_bulk_crc32.dir/flags.make
CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o: /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o   -c /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c

CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c > CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.i

CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c -o CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.s

# Object files for target test_bulk_crc32
test_bulk_crc32_OBJECTS = \
"CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o" \
"CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o" \
"CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o"

# External object files for target test_bulk_crc32
test_bulk_crc32_EXTERNAL_OBJECTS =

test_bulk_crc32: CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32.c.o
test_bulk_crc32: CMakeFiles/test_bulk_crc32.dir/main/native/src/org/apache/hadoop/util/bulk_crc32_x86.c.o
test_bulk_crc32: CMakeFiles/test_bulk_crc32.dir/main/native/src/test/org/apache/hadoop/util/test_bulk_crc32.c.o
test_bulk_crc32: CMakeFiles/test_bulk_crc32.dir/build.make
test_bulk_crc32: CMakeFiles/test_bulk_crc32.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable test_bulk_crc32"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_bulk_crc32.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_bulk_crc32.dir/build: test_bulk_crc32

.PHONY : CMakeFiles/test_bulk_crc32.dir/build

CMakeFiles/test_bulk_crc32.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_bulk_crc32.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_bulk_crc32.dir/clean

CMakeFiles/test_bulk_crc32.dir/depend:
	cd /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/src /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native /home/kangdw/devel/hadoop-src/hadoop-common-project/hadoop-common/target/native/CMakeFiles/test_bulk_crc32.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_bulk_crc32.dir/depend

