# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build

# Include any dependencies generated for this target.
include assignment-autotest/CMakeFiles/assignment-autotest.dir/depend.make

# Include the progress variables for this target.
include assignment-autotest/CMakeFiles/assignment-autotest.dir/progress.make

# Include the compile flags for this target's objects.
include assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make

../assignment-autotest/test/assignment1/Test_hello_Runner.c: ../assignment-autotest/test/assignment1/Test_hello.c
../assignment-autotest/test/assignment1/Test_hello_Runner.c: ../assignment-autotest/test/assignment1/Test_assignment_validate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../assignment-autotest/test/assignment1/Test_hello_Runner.c, ../../assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c, ../../assignment-autotest/test/unity_runner.c"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && ../../assignment-autotest/auto_generate.sh test/assignment1/Test_hello.c test/assignment1/Test_assignment_validate.c

../assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c: ../assignment-autotest/test/assignment1/Test_hello_Runner.c
	@$(CMAKE_COMMAND) -E touch_nocreate ../assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c

../assignment-autotest/test/unity_runner.c: ../assignment-autotest/test/assignment1/Test_hello_Runner.c
	@$(CMAKE_COMMAND) -E touch_nocreate ../assignment-autotest/test/unity_runner.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o: ../assignment-autotest/test/assignment1/Test_hello.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello.c > CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello.c -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.s

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o: ../assignment-autotest/test/assignment1/Test_assignment_validate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate.c > CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate.c -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.s

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o: ../assignment-autotest/test/assignment1/Test_hello_Runner.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello_Runner.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello_Runner.c > CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_hello_Runner.c -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.s

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o: ../assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c > CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c -o CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.s

assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o: ../examples/autotest-validate/autotest-validate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/examples/autotest-validate/autotest-validate.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/examples/autotest-validate/autotest-validate.c > CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/examples/autotest-validate/autotest-validate.c -o CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.s

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o: assignment-autotest/CMakeFiles/assignment-autotest.dir/flags.make
assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o: ../assignment-autotest/test/unity_runner.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o   -c /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/unity_runner.c

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/assignment-autotest.dir/test/unity_runner.c.i"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/unity_runner.c > CMakeFiles/assignment-autotest.dir/test/unity_runner.c.i

assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/assignment-autotest.dir/test/unity_runner.c.s"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest/test/unity_runner.c -o CMakeFiles/assignment-autotest.dir/test/unity_runner.c.s

# Object files for target assignment-autotest
assignment__autotest_OBJECTS = \
"CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o" \
"CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o" \
"CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o" \
"CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o" \
"CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o" \
"CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o"

# External object files for target assignment-autotest
assignment__autotest_EXTERNAL_OBJECTS =

assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_hello_Runner.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/test/assignment1/Test_assignment_validate_Runner.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/__/examples/autotest-validate/autotest-validate.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/test/unity_runner.c.o
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/build.make
assignment-autotest/assignment-autotest: assignment-autotest/Unity/src/libunity.a
assignment-autotest/assignment-autotest: assignment-autotest/CMakeFiles/assignment-autotest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable assignment-autotest"
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/assignment-autotest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
assignment-autotest/CMakeFiles/assignment-autotest.dir/build: assignment-autotest/assignment-autotest

.PHONY : assignment-autotest/CMakeFiles/assignment-autotest.dir/build

assignment-autotest/CMakeFiles/assignment-autotest.dir/clean:
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest && $(CMAKE_COMMAND) -P CMakeFiles/assignment-autotest.dir/cmake_clean.cmake
.PHONY : assignment-autotest/CMakeFiles/assignment-autotest.dir/clean

assignment-autotest/CMakeFiles/assignment-autotest.dir/depend: ../assignment-autotest/test/assignment1/Test_hello_Runner.c
assignment-autotest/CMakeFiles/assignment-autotest.dir/depend: ../assignment-autotest/test/assignment1/Test_assignment_validate_Runner.c
assignment-autotest/CMakeFiles/assignment-autotest.dir/depend: ../assignment-autotest/test/unity_runner.c
	cd /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/assignment-autotest /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest /home/jeevank12/Documents/coursera_linux/assignments-3-and-later-Jeevanksbu/build/assignment-autotest/CMakeFiles/assignment-autotest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : assignment-autotest/CMakeFiles/assignment-autotest.dir/depend

