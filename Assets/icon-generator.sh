#!/bin/bash

# Define the filename to search for
FILENAME="Arcadia.svg"

# Find the file in the current directory
FILEPATH=$(find . -name "$FILENAME" -print -quit)

# Check if the file was found
if [[ -z "$FILEPATH" ]]; then
  echo "File $FILENAME not found."
  exit 1
fi

# Define the path to Inkscape executable
INKSCAPE="/Applications/Inkscape.app/Contents/MacOS/inkscape"

# Check if Inkscape executable exists
if [[ ! -x "$INKSCAPE" ]]; then
  echo "Inkscape executable not found at $INKSCAPE."
  exit 1
fi

# Define the desired export width
EXPORT_WIDTH=800

# 1024
EXPORT_WIDTH=1024
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-512pt-icon@2x.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-1024pt-icon.png" --export-width="$EXPORT_WIDTH"

# 512
EXPORT_WIDTH=512
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-512pt-icon.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-256pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 256
EXPORT_WIDTH=256
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-256pt-icon.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-128pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 192
EXPORT_WIDTH=192
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-64pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 180
EXPORT_WIDTH=180
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-60pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 167
EXPORT_WIDTH=167
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-83-5pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 152
EXPORT_WIDTH=152
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-76pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 136
EXPORT_WIDTH=136
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-68pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 128
EXPORT_WIDTH=128
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-128pt-icon.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-64pt-icon@2x.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-64pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 114
EXPORT_WIDTH=114
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-38pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 120
EXPORT_WIDTH=120
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-60pt-icon@2x.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-40pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 87
EXPORT_WIDTH=87
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-29pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 80
EXPORT_WIDTH=80
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-40pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 76
EXPORT_WIDTH=76
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-38pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 64
EXPORT_WIDTH=64
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-64pt-icon.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-32pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 60
EXPORT_WIDTH=60
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-20pt-icon@3x.png" --export-width="$EXPORT_WIDTH"

# 58
EXPORT_WIDTH=58
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-29pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 40
EXPORT_WIDTH=40
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-iOS-20pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 32
EXPORT_WIDTH=32
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-32pt-icon.png" --export-width="$EXPORT_WIDTH"
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-16pt-icon@2x.png" --export-width="$EXPORT_WIDTH"

# 16
EXPORT_WIDTH=16
"$INKSCAPE" "$FILEPATH" --export-filename="Arcadia-macOS-16pt-icon.png" --export-width="$EXPORT_WIDTH"

echo "Inkscape processing completed."
