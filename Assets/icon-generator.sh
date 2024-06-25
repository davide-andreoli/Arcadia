#!/bin/bash

# Check if filename is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Define the filename to search for
FILENAME="$1"

# Extract the base name without extension
BASENAME=$(basename "$FILENAME" .svg)

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

# Define the desired export widths and filenames
declare -A EXPORTS=(
  [1024]="$BASENAME-macOS-512pt-icon@2x.png $BASENAME-iOS-1024pt-icon.png"
  [512]="$BASENAME-macOS-512pt-icon.png $BASENAME-macOS-256pt-icon@2x.png"
  [256]="$BASENAME-macOS-256pt-icon.png $BASENAME-macOS-128pt-icon@2x.png"
  [192]="$BASENAME-iOS-64pt-icon@3x.png"
  [180]="$BASENAME-iOS-60pt-icon@3x.png"
  [167]="$BASENAME-iOS-83-5pt-icon@2x.png"
  [152]="$BASENAME-iOS-76pt-icon@2x.png"
  [136]="$BASENAME-iOS-68pt-icon@2x.png"
  [128]="$BASENAME-macOS-128pt-icon.png $BASENAME-macOS-64pt-icon@2x.png $BASENAME-iOS-64pt-icon@2x.png"
  [120]="$BASENAME-iOS-60pt-icon@2x.png $BASENAME-iOS-40pt-icon@3x.png"
  [114]="$BASENAME-iOS-38pt-icon@3x.png"
  [87]="$BASENAME-iOS-29pt-icon@3x.png"
  [80]="$BASENAME-iOS-40pt-icon@2x.png"
  [76]="$BASENAME-iOS-38pt-icon@2x.png"
  [64]="$BASENAME-macOS-64pt-icon.png $BASENAME-macOS-32pt-icon@2x.png"
  [60]="$BASENAME-iOS-20pt-icon@3x.png"
  [58]="$BASENAME-iOS-29pt-icon@2x.png"
  [40]="$BASENAME-iOS-20pt-icon@2x.png"
  [32]="$BASENAME-macOS-32pt-icon.png $BASENAME-macOS-16pt-icon@2x.png"
  [16]="$BASENAME-macOS-16pt-icon.png"
)

# Loop through the export widths and filenames
for WIDTH in "${!EXPORTS[@]}"; do
  FILENAMES="${EXPORTS[$WIDTH]}"
  for FILENAME_OUT in $FILENAMES; do
    "$INKSCAPE" "$FILEPATH" --export-filename="$FILENAME_OUT" --export-width="$WIDTH"
  done
done

echo "Inkscape processing completed."
