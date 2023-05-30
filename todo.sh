#!/bin/bash

# Function to add a line with a checkbox to a Markdown file
add_checkbox_line() {
    local file="$1"
    local header="$2"
    local line="$3"

    # Create a temporary file
    local temp_file=$(mktemp)

    # Flag to indicate if the header is found
    local header_found=0

    # Read the input file
    while IFS= read -r input_line; do
        echo "$input_line" >> "$temp_file"

        # Check if the current line matches the header
        if [[ "$input_line" == "## $header" ]]; then
            # Append the checkbox line under the header
            echo "- [ ] $line" >> "$temp_file"
            header_found=1
        fi
    done < "$file"

    # If the header was not found, append the header and the checkbox line at the end of the file
    if [[ $header_found -eq 0 ]]; then
        echo "" >> "$temp_file"
        echo "## $header" >> "$temp_file"
        echo "- [ ] $line" >> "$temp_file"
    fi

    # Replace the original file with the updated file
    mv "$temp_file" "$file"
}

# Initialize variables with default values
file="/home/outp/Sync/MarkdownBase/mdar/Base/Общий TODO. (РТК ИТ).md"
header="Fast TODO"

# Parse command-line options
while getopts ":P:h:" opt; do
    case $opt in
        P)
            file="$OPTARG"
            ;;
        h)
            header="$OPTARG"
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
    echo "Invalid arguments. Usage: $0 [-P file] [-h header] line"
    exit 1
fi

# Call the function to add a line with a checkbox
add_checkbox_line "$file" "$header" "$line"
