#!/bin/bash

# Function to add a line with a checkbox to a Markdown file
add_checkbox_line() {
    local file="$1"
    local line="$2"
    echo "- [ ] $line" >> "$file"
}

# Initialize variables with default values
file="/home/outp/Sync/MarkdownBase/mdar/Base/Общий TODO. (РТК ИТ).md"

# Parse command-line options
while getopts ":P:" opt; do
    case $opt in
        P)
            file="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Shift the command-line arguments
shift $((OPTIND - 1))

# Check if a line is provided as an argument
if [[ $# -eq 1 ]]; then
    line="$1"
else
    echo "Invalid arguments. Usage: $0 [-P file] line"
    exit 1
fi

# Call the function to add a line with a checkbox
add_checkbox_line "$file" "$line"
