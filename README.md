# cpp_template

A minimal, ready-to-use C++ project template with a Makefile, organized source/header folders, and a clean build system.

## Project Structure

    .
    ├── Makefile
    ├── README.md
    ├── .gitignore
    ├── header/          # Header files (.h / .hpp)
    └── src/             # Source files (.cpp)
        └── main.cpp

Build artifacts are generated automatically under `build/out/`.

## Requirements

- A C++17 compiler (`g++` or `clang++`)
- `make`

## Fresh start

    ./use.sh
### No git

    ./use.sh --no-git
### Reset

    make reset
### Clean directory

    make nuke

or if you just use the Makefile in your projects:
## Init

    make init

This will add source and header directory to your project.

## Build

    make

The executable is created at `build/app`.

## Rebuild

    make rebuild

Cleans and rebuilds the project.

## Run

    make run

## Clean

    make clean

Removes the entire `build/` directory.

## Using This Template

### Option 1: GitHub Template (Recommended)

1. Click the green **"Use this template"** button at the top of this repository.
2. Choose **"Create a new repository"**.
3. Give your new repository a name and click **Create**.
4. Clone your new repository:

        git clone https://github.com/YOUR_USERNAME/YOUR_NEW_REPO.git

5. Start coding!

### Option 2: Clone Directly

If you prefer not to use the template feature:

    git clone https://github.com/Mquency/cpp_template.git my_project
    cd my_project
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit from template"

### Option 3: GitHub CLI

    gh repo create my_project --template Mquency/cpp_template --public
    cd my_project

## Adding New Files

- Put new `.cpp` files in `src/`. They are picked up automatically by the Makefile.
- Put new headers in `header/`. Include them with `#include "your_header.h"` — the Makefile already adds `-Iheader` to the compiler flags.
