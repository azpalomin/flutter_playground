#!/bin/sh

# Get the list of staged files
staged_files=$(git diff --cached --name-only --diff-filter=d)

# Regex pattern for files to exclude
exclude_pattern="firebase_options\.dart\|.*\.g\.dart"

# Run dart analyze on each staged Dart file
for file in $staged_files; do
  case $file in
    *.dart)
      # If the file path matches the exclude pattern, skip this file
      if echo "$file" | grep -q "$exclude_pattern"; then
        continue
      fi

      dart analyze $file
      # If dart analyze fails, exit with a non-zero status
      if [ $? -ne 0 ]; then
        echo "🔴 dart analyze failed on $file, aborting commit"
        exit 1
      fi
      ;;
  esac
done