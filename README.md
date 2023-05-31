# Quick TODO entries in Markdown

This shell script allows you to add a line with a checkbox to a Markdown file. The line entry will be placed under a specified second-level Markdown header or at the end of the file if the header is not found.

## Usage

```
./todo.sh [-P file] [-h header] line
```

## Arguments

- `-P file`: Specifies the path to the Markdown file. If not provided, a default path will be used.
- `-h header`: Specifies the second-level Markdown header under which the line entry will be added. If not provided, a default header will be used.
- `line`: The line entry to be added as a checkbox item.

## Examples

1. Add a line entry under the default second-level header to a Markdown file:
   ```
   ./todo.sh "Your line with a checkbox"
   ```

2. Add a line entry under a specified second-level header to a Markdown file:
   ```
   ./todo.sh -P /path/to/markdown/file.md -h "Your Header" "Your line with a checkbox"
   ```

## Notes

- The script appends the line entry as a checkbox item ("- [ ] line entry") under the specified second-level header in the Markdown file.
- If the specified header is not found in the file, the script will add the header and the line entry at the end of the file.
- Make sure to replace the default file path and header with the appropriate values for your Markdown file.
