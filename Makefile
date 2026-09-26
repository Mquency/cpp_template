# ==============
# Project config
# ==============

# Folders
SRC_DIR		:= src
HDR_DIR		:= header
BUILD_DIR	:= build
OBJ_DIR		:= $(BUILD_DIR)/out

# Target executable
TARGET		:= $(BUILD_DIR)/app

# Toolchain
CXX			:= g++
HFL			:= hpp
CFL			:= cpp
STD_NUM		:= ++23
STD			:= c$(STD_NUM)

# Flags
STD_FLAGS	:= -std=$(STD)
WARN_FLAGS	:= -Wall -Wextra
INC_FLAGS	:= -I$(HDR_DIR)

CXXFLAGS	:= $(STD_FLAGS) $(WARN_FLAGS) $(INC_FLAGS)

# Find all source files and derive object files
SRCS		:= $(wildcard $(SRC_DIR)/*.$(CFL))
OBJS		:= $(patsubst $(SRC_DIR)/%.$(CFL), $(OBJ_DIR)/%.o, $(SRCS))
HDRS		:= $(wildcard $(HDR_DIR)/*.$(HXX))


# =======
# Targets
# =======

.PHONY: all init run rebuild clean nuke reset help

# Default target
all: $(TARGET)

# Link
$(TARGET): $(OBJS)
	@if [ ! -d $(BUILD_DIR) ]; then \
		mkdir -p $(BUILD_DIR) && echo "Creating build directory at: $(BUILD_DIR)"; \
	fi
	@echo "Creating executable at $@"
	$(CXX) $(CXXFLAGS) $^ -o $@
	@chmod +x $@

# Compile
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.$(CFL) $(HDRS)
	@if [ ! -d $(OBJ_DIR) ]; then \
		mkdir -p $(OBJ_DIR) && echo "Creating objects directory at: $(OBJ_DIR)"; \
	fi
	@echo "Compiling source files and saving at: $(OBJ_DIR)"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run the program
run: $(TARGET)
	@./$(TARGET)

# Clean everything
clean:
	@echo "Removing Build directory at: $(BUILD_DIR)"
	@rm -rf $(BUILD_DIR)

# Rebuild the program
rebuild: clean all

# Initialize the project structure
init:
	@if [ ! -d $(HDR_DIR) ]; then \
		mkdir -p $(HDR_DIR) && echo "Creating header files directory named: $(HDR_DIR)"; \
	fi
	@if [ ! -d $(SRC_DIR) ]; then \
		mkdir -p $(SRC_DIR) && echo "Creating source files directory named: $(SRC_DIR)"; \
	else \
		if [ ! -f "$(SRC_DIR)/main.$(CFL)" ]; then \
			echo "Creating default program at: $(SRC_DIR)/main.$(CFL)"; \
			touch $(SRC_DIR)/main.$(CFL); \
		else \
			exit 0; \
		fi \
	fi

	@echo "Hello, world!  :)"
	@if [ -f "$(SRC_DIR)/main.cpp" ]; then \
	    printf '%s\n' \
		'#include <iostream>' \
		'using namespace std;' \
		'' \
		'int main(){' \
		'' \
		'    cout << "Hello, world!" << endl;' \
		'' \
		'    return 0;' \
		'}' \
		> $(SRC_DIR)/main.cpp; \
	elif [ -f "$(SRC_DIR)/main.c" ]; then \
	    printf '%s\n' \
		'#include <stdio.h>' \
		'' \
		'int main(){' \
		'' \
		'    printf("Hello, world!\n");' \
		'' \
		'    return 0;' \
		'}' \
		> $(SRC_DIR)/main.c; \
	fi

# Nukes the source files
nuke: clean
	@rm -rf $(SRC_DIR)
	@rm -rf $(HDR_DIR)

# Reset the Project
reset: nuke init

help:
	@echo "Targets:"
	@echo "  all        Build the project (default)"
	@echo "  init       Initialize main project structure"
	@echo "  run        Build and run the executable"
	@echo "  rebuild    Clean and rebuild"
	@echo "  clean      Remove the build directory"
	@echo "  nuke       Nukes all project files"
	@echo "  reset      Restart the project, WARNING: Resets source files"
	@echo "  help       Show this message"
