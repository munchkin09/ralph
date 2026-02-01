#!/bin/bash

# Ralph Setup Script
# This script creates symbolic links to use Ralph in any repository

set -e

# Display Ralph Wiggum ASCII art
cat << "EOF"

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡾⢟⣿⢿⣿⠟⢁⣠⠞⢉⡼⠋⢠⠏⠉⣿⠙⣏⠻⣟⠻⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⢋⡴⠋⣠⡞⠁⣴⠟⢁⣴⠋⠀⣠⡟⠀⢰⡇⠀⢻⡄⠘⣧⠈⠻⣿⡿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⡿⢋⣴⠟⠀⣼⠋⢀⡼⠃⠀⣾⠃⠀⢰⣿⠀⠀⢸⠃⠀⠈⣿⠀⠈⢷⡄⠘⣧⠈⢿⡙⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣰⠛⣽⠟⣡⡾⠋⢀⣾⠃⢀⣾⠃⠀⢸⠃⠀⠀⠸⠋⠀⠀⠸⠀⠀⠀⢻⡆⠀⠸⣿⠀⠘⢷⠈⢷⡄⠙⣿⡳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡾⢃⣼⠋⣰⡿⠁⢀⣿⠇⠀⢸⠇⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠈⠀⠈⠁⠀⠈⣷⡘⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣾⢁⣾⠇⢠⡿⠀⠀⢸⡟⠀⠀⠸⠀⠀⠀⠀⠀⢀⣴⠾⠿⠿⠿⠶⣆⡀⠀⠀⠀⠀⠀⠀⣠⡴⠾⠿⠛⠷⢦⡀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠸⠛⢸⡟⠀⢸⠁⠀⠀⢾⠁⠀⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠀⣴⠉⠀⠀⠀⠀⠀⠀⢳⡈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⣶⣷⠄⠀⠀⠀⢈⣧⠀⠀⠀⢈⣿⠀⠀⠀⢾⣿⠀⠀⢸⠇⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣰⠿⠿⠿⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣦⠀⠙⠉⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠹⣷⡀⠀⠀⠀⠀⢀⡞⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣤⣀⣀⣠⣤⡾⠟⠀⠀⠛⠒⠶⢶⣮⡛⠷⣶⡴⠶⠋⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⢀⣀⡀⠀⠀⠀⠀⠙⣿⠀⠀⠀⠀⠀⠀⠀⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠳⣦⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠿⠛⠻⣷⣄⠀⣠⣴⡿⠀⠀⠀⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⢀⣴⠟⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⠀⠀⣠⡟⠀⠀⠀⢠⣾⣷⠶⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⣿⠀⠀⠀⠀⠈⠉⠁⠀⢀⣽⣷⣄⣀⣠⣤⣤⣤⡶⠶⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠁⠀⠉⠻⢷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠘⠛⠉⠉⠹⣿⠉⠉⣽⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⣇⠀⠀⠀⠀⠀⠈⠙⠻⠿⢶⣤⣤⣤⣤⣤⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡏⣠⣾⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣤⣾⠿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⠏⠉⠉⠙⠿⣶⣦⡀⠀⠀⠀⠀⣿⡿⠿⢿⡟⠁⢈⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⡿⠉⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⠀⣰⡿⠋⠀⠀⠀⠀⠀⠈⠙⢿⣷⡄⠀⠀⣿⡇⠀⠀⣿⣶⣿⣏⠉⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⢶⣄⣀⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣄⣠⣿⠀⠀⣸⡿⠋⠈⠻⣷⣻⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡽⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⠙⢿⡾⠋⠀⠀⠀⠀⠹⣿⡇⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣴⡟⠙⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        Ralph Wiggum dice: "El aliento de mi gato huele a comida de gato."
EOF

# Interactive prompt for Ralph folder
echo "==================================================="
echo "  Welcome to Ralph Setup!"
echo "==================================================="
echo ""
read -p "Enter the path to target repo folder: " TARGET_FOLDER
    
# Trim whitespace
DEST="${TARGET_FOLDER/#\~/$HOME}"
TARGET_FOLDER=$(echo $DEST | xargs)

# Validate required parameters
if [ -z "$TARGET_FOLDER" ]; then
    echo "Error: Target repo folder path is required"
    exit 1
fi

# Expand tilde if present
RALPH_FOLDER="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Convert to absolute path
if [ ! -d "$RALPH_FOLDER" ]; then
    echo "Error: Ralph folder does not exist: $RALPH_FOLDER"
    exit 1
fi

# Check if required files exist in the ralph folder
if [ ! -f "$RALPH_FOLDER/ralph.sh" ]; then
    echo "Error: ralph.sh not found in $RALPH_FOLDER"
    exit 1
fi

if [ ! -f "$RALPH_FOLDER/CLAUDE.md" ]; then
    echo "Error: CLAUDE.md not found in $RALPH_FOLDER"
    exit 1
fi

if [ ! -d "$RALPH_FOLDER/skills" ]; then
    echo "Error: skills directory not found in $RALPH_FOLDER"
    exit 1
fi

if [ ! -f "$RALPH_FOLDER/prd.json.example" ]; then
    echo "Error: prd.json.example not found in $RALPH_FOLDER"
    exit 1
fi

echo ""
echo "Setting up Ralph in: $TARGET_FOLDER"
echo "Using Ralph from: $RALPH_FOLDER"
echo ""

# Create symbolic link for ralph.sh
echo "Creating symbolic link for ralph.sh..."
if [ -e "$TARGET_FOLDER/ralph.sh" ] || [ -L "$TARGET_FOLDER/ralph.sh" ]; then
    echo "  Warning: ralph.sh already exists. No actions taken, skipping..."
else
    ln -s "$RALPH_FOLDER/ralph.sh" "$TARGET_FOLDER/ralph.sh"
    echo "  ✓ ralph.sh linked"
fi

# Create symbolic link for CLAUDE.md
echo "Creating symbolic link for CLAUDE.md..."
if [ -e "$TARGET_FOLDER/CLAUDE.md" ] || [ -L "$TARGET_FOLDER/CLAUDE.md" ]; then
    echo "  Warning: CLAUDE.md already exists. Skipping..."
else
    ln -s "$RALPH_FOLDER/CLAUDE.md" "$TARGET_FOLDER/CLAUDE.md"
    echo "  ✓ CLAUDE.md linked"
fi

# Create symbolic link for skills directory
echo "Creating symbolic link for skills directory..."
if [ -d "$TARGET_FOLDER/.claude" ]; then
    if [ -e "$TARGET_FOLDER/.claude/skills" ] || [ -L "$TARGET_FOLDER/.claude/skills" ]; then
        echo "  Warning: skills directory on .claude already exists. Skipping..."
    else
        ln -s "$RALPH_FOLDER/skills/" "$TARGET_FOLDER/.claude/skills"
        echo "  ✓ .claude/skills linked"
    fi
elif [ -d "$TARGET_FOLDER/.github" ]; then
    if [ -e "$TARGET_FOLDER/.github/skills" ] || [ -L "$TARGET_FOLDER/.github/skills" ]; then
        echo "  Warning: skills directory on .github already exists. Skipping..."
    else
        ln -s "$RALPH_FOLDER/skills/" "$TARGET_FOLDER/.github/skills"
        echo "  ✓ .github/skills linked"
    fi
else
    echo "  Creating .claude directory and linking skills..."
    mkdir -p "$TARGET_FOLDER/.claude"
    ln -s "$RALPH_FOLDER/skills/" "$TARGET_FOLDER/.claude/skills"
    echo "  ✓ .claude/skills linked (default)"
fi



# Create progress.txt file
echo "Creating progress.txt file..."
if [ -e "$TARGET_FOLDER/progress.txt" ]; then
    echo "  Warning: progress.txt already exists. Skipping..."
else
    touch "$TARGET_FOLDER/progress.txt"
    echo "  ✓ progress.txt created"
fi

# Copy prd.json.example file
echo "Copying prd.json.example..."
if [ -e "$TARGET_FOLDER/prd.json.example" ]; then
    echo "  Warning: prd.json.example already exists. Skipping..."
else
    cp "$RALPH_FOLDER/prd.json.example" "$TARGET_FOLDER/prd.json.example"
    echo "  ✓ prd.json.example copied"
fi

echo ""
echo "==================================================="
echo "  ✓ Ralph setup complete! I'm a helper!"
echo "==================================================="
echo ""
echo "You can now use Ralph in this repository by running:"
echo "  ./ralph.sh [max_iterations]"
echo ""
echo "Enjoy!"
echo "==================================================="

exit 0
