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
         Ralph Wiggum says: "I'm helping!"
         
EOF

# Interactive prompt for Ralph folder
echo "==================================================="
echo "  Welcome to Ralph Setup!"
echo "==================================================="
echo ""
read -p "Enter the path to target repo folder: " TARGET_FOLDER
    
# Trim whitespace
TARGET_FOLDER=$(echo "$TARGET_FOLDER" | xargs)

# Validate required parameters
if [ -z "$TARGET_FOLDER" ]; then
  echo "Error: Target repo folder path is required"
  exit 1
fi

# Expand tilde if present
RALPH_FOLDER="$(pwd)"

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
echo "Setting up Ralph in: $TARGET_DIR"
echo "Using Ralph from: $RALPH_FOLDER"
echo ""

# Create symbolic link for ralph.sh
echo "Creating symbolic link for ralph.sh..."
if [ -e "$TARGET_DIR/ralph.sh" ] || [ -L "$TARGET_DIR/ralph.sh" ]; then
    echo "  Warning: ralph.sh already exists. No actions taken, skipping..."
else
    ln -s "$RALPH_FOLDER/ralph.sh" "$TARGET_DIR/ralph.sh"
    echo "  ✓ ralph.sh linked"
fi

# Create symbolic link for CLAUDE.md
echo "Creating symbolic link for CLAUDE.md..."
if [ -e "$TARGET_DIR/CLAUDE.md" ] || [ -L "$TARGET_DIR/CLAUDE.md" ]; then
    echo "  Warning: CLAUDE.md already exists. Skipping..."
else
    ln -s "$RALPH_FOLDER/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
    echo "  ✓ CLAUDE.md linked"
fi

# Create symbolic link for skills directory
echo "Creating symbolic link for skills directory..."
if [ -e "$TARGET_DIR/skills" ] || [ -L "$TARGET_DIR/skills" ]; then
    echo "  Warning: skills directory already exists. Skipping..."
else
    ln -s "$RALPH_FOLDER/skills" "$TARGET_DIR/skills"
    echo "  ✓ skills directory linked"
fi


# Create progress.txt file
echo "Creating progress.txt file..."
if [ -e "$TARGET_DIR/progress.txt" ]; then
  echo "  Warning: progress.txt already exists. Skipping..."
else
  touch "$TARGET_DIR/progress.txt"
  echo "  ✓ progress.txt created"
fi

# Copy prd.json.example file
echo "Copying prd.json.example..."
if [ -e "$TARGET_DIR/prd.json.example" ]; then
  echo "  Warning: prd.json.example already exists. Skipping..."
else
  cp "$RALPH_FOLDER/prd.json.example" "$TARGET_DIR/prd.json.example"
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
