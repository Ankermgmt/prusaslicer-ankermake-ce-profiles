#!/bin/bash

# Function to check for macOS PrusaSlicer directories
mac_directories() {
    # Prusa Slicer
    if [ -d "$HOME/Library/Application Support/PrusaSlicer" ]; then
        echo "$HOME/Library/Application Support/PrusaSlicer"
    fi
    if [ -d "$HOME/Library/Application Support/PrusaSlicer-alpha" ]; then
        echo "$HOME/Library/Application Support/PrusaSlicer-alpha"
    fi
    if [ -d "$HOME/Library/Application Support/PrusaSlicer-beta" ]; then
        echo "$HOME/Library/Application Support/PrusaSlicer-beta"
    fi
    # Anker Slicer
    if [ -d "$HOME/Library/Application Support/AnkerMake_alpha-alpha" ]; then
        echo "$HOME/Library/Application Support/AnkerMake_alpha-alpha"
    fi
    # Super Slicer
    if [ -d "$HOME/Library/Application Support/SuperSlicer" ]; then
        echo "$HOME/Library/Application Support/SuperSlicer"
    fi
    if [ -d "$HOME/Library/Application Support/SuperSlicer-alpha" ]; then
        echo "$HOME/Library/Application Support/SuperSlicer-alpha"
    fi
    if [ -d "$HOME/Library/Application Support/SuperSlicer-beta" ]; then
        echo "$HOME/Library/Application Support/SuperSlicer-beta"
    fi

}

# Function to check for Linux PrusaSlicer directories
linux_directories() {
    # Prusa Slicer
    if [ -d "$HOME/.PrusaSlicer" ]; then
        echo "$HOME/.PrusaSlicer"
    fi
    if [ -d "$HOME/.config/PrusaSlicer" ]; then
        echo "$HOME/.config/PrusaSlicer"
    fi
    if [ -d "$HOME/.config/PrusaSlicer-alpha" ]; then
        echo "$HOME/.config/PrusaSlicer-alpha"
    fi
    if [ -d "$HOME/.config/PrusaSlicer-beta" ]; then
        echo "$HOME/.config/PrusaSlicer-beta"
    fi
    # Anker Slicer
    if [ -d "$HOME/.config/AnkerMake_alpha-alpha" ]; then
        echo "$HOME/.config/AnkerMake_alpha-alpha"
    fi
    # Super Slicer
    if [ -d "$HOME/.SuperSlicer" ]; then
        echo "$HOME/.SuperSlicer"
    fi
    if [ -d "$HOME/.config/SuperSlicer" ]; then
        echo "$HOME/.config/SuperSlicer"
    fi
    if [ -d "$HOME/.config/SuperSlicer-alpha" ]; then
        echo "$HOME/.config/SuperSlicer-alpha"
    fi
    if [ -d "$HOME/.config/SuperSlicer-beta" ]; then
        echo "$HOME/.config/SuperSlicer-beta"
    fi
}

# Detect the operating system and get the directories
IFS=$'\n'
directories=()
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    directories=($(linux_directories))
elif [[ "$OSTYPE" == "darwin"* ]]; then
    directories=($(mac_directories))
else
    echo "Unsupported operating system."
    exit 1
fi
IFS=' \t\n'

# Check the number of directories found
count=${#directories[@]}
if [ "$count" -eq 0 ]; then
    echo "PrusaSlicer directories not found."
    exit 1
elif [ "$count" -eq 1 ]; then
    chosen_dir="${directories[0]}"
else
    echo "Multiple PrusaSlicer directories found."
    echo "Please choose which one you want to use:"
    select slicer_dir in "${directories[@]}"; do
        chosen_dir="$slicer_dir"
        break
    done
fi

echo "You chose: $chosen_dir"

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
else
    overwrite=true
fi
if [ "$overwrite" = true ]; then
    # Create the destination directory if it doesn't exist
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi
    
    # Open the destination directory in the platform default file manager
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$dest_dir" || true
    fi
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "$dest_dir" || true
    fi

    script_dir=$(dirname "$0")

    # Copy the directory and files recursively
    cp -R "$script_dir/vendor/${files[0]}" "$dest_dir"
    cp "$script_dir/vendor/${files[1]}" "$dest_dir"
    cp "$script_dir/vendor/${files[2]}" "$dest_dir"
    
    echo "Files and directory copied successfully."
fi
