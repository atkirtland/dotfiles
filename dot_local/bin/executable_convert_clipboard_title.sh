#!/usr/bin/env sh

title=$(xclip -o -selection clipboard)
converted_title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
echo -n "$converted_title" | xclip -selection clipboard
echo "Converted title: $converted_title (Copied to clipboard)"
