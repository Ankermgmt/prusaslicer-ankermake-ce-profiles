#!/bin/bash

# Function to check for macOS PrusaSlicer directories
mac_directories() {
    directories=()
    if [ -d "$HOME/Library/Application Support/PrusaSlicer" ]; then
        directories+=("$HOME/Library/Application Support/PrusaSlicer")
    fi
    if [ -d "$HOME/Library/Application Support/PrusaSlicer-alpha" ]; then
        directories+=("$HOME/Library/Application Support/PrusaSlicer-alpha")
    fi
    if [ -d "$HOME/Library/Application Support/PrusaSlicer-beta" ]; then
        directories+=("$HOME/Library/Application Support/PrusaSlicer-beta")
    fi

    printf '%s\n' "${directories[@]}"
}

# Function to check for Linux PrusaSlicer directories
linux_directories() {
    directories=()
    #TODO: Test and verify which directories show up on linux systems
    if [ -d "$HOME/.PrusaSlicer" ]; then
        directories+=("$HOME/.PrusaSlicer")
    fi

    printf '%s\n' "${directories[@]}"
}

# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    PRUSASLICER_DIR=$(linux_directories)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    PRUSASLICER_DIR=$(mac_directories)
else
    echo "Unsupported operating system."
    exit 1
fi

# Check the number of directories found
count=$(echo "$PRUSASLICER_DIR" | wc -l)
if [ "$count" -eq 0 ]; then
    echo "PrusaSlicer directories not found."
    exit 1
elif [ "$count" -eq 1 ]; then
    chosen_dir=$(echo "$PRUSASLICER_DIR" | head -1)
else
    echo "Multiple PrusaSlicer directories found."
    echo "Please choose which one you want to use:"
    IFS=$'\n' read -r -d '' -a directories <<< "$PRUSASLICER_DIR"
    select slicer_dir in "${directories[@]}"; do
        chosen_dir="$slicer_dir"
        break
    done
fi

echo "You chose: $chosen_dir"

# Continue with further actions using "$chosen_dir"

# Destination directory
dest_dir="$chosen_dir/vendor"

# Files to copy
files=("AnkerMakeCE" "AnkerMakeCE.idx" "AnkerMakeCE.ini")

# Check if destination directory or files exist
overwrite=false
if [ -d "$dest_dir/${files[0]}" ] || [ -f "$dest_dir/${files[1]}" ] || [ -f "$dest_dir/${files[2]}" ]; then
    echo "Destination directory or files already exist:"
    [ -d "$dest_dir/${files[0]}" ] && echo "  - $dest_dir/${files[0]} (directory)"
    [ -f "$dest_dir/${files[1]}" ] && echo "  - $dest_dir/${files[1]} (file)"
    [ -f "$dest_dir/${files[2]}" ] && echo "  - $dest_dir/${files[2]} (file)"
    read -p "Do you want to overwrite them? (y/n): " choice
    case "$choice" in
        y|Y)
            overwrite=true
            ;;
        n|N)
            echo "Skipping file copying."
            ;;
        *)
            echo "Invalid choice. Skipping file copying."
            ;;
    esac
fi
if [ "$overwrite" = true ]; then
    # Create the destination directory if it doesn't exist
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi
    
    # Copy the directory and files recursively
    cp -R "${files[0]}" "$dest_dir"
    cp "${files[1]}" "$dest_dir"
    cp "${files[2]}" "$dest_dir"
    
    echo "Files and directory copied successfully."
fi