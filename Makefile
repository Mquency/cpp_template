# Compiler and flags
CXX			:= g++
CXXFLAGS	:= -std=c++20 -Wall -Wextra

# Folders
SRC_DIR		:= src
HDR_DIR		:= header
BUILD_DIR	:= build
OBJ_DIR		:= $(BUILD_DIR)/out

# Target executable
TARGET		:= $(BUILD_DIR)/app

# Find all source files and derive object files
SRCS		:= $(wildcard $(SRC_DIR)/*.cpp)
OBJS		:= $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

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
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
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

.PHONY: all run clean
