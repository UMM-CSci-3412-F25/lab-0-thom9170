#!/usr/bin/env bash
set -e

ARCHIVE=$1
SCRATCH=$(mktemp -d)
HERE=$(pwd)

tar -xzf "$ARCHIVE" -C "$SCRATCH"

# Determine the top-level directory inside the tar
TOPDIR=$(ls "$SCRATCH")

# Remove files with "DELETE ME!"
grep -rl "DELETE ME!" "$SCRATCH/$TOPDIR" | while read -r f; do
    rm -f "$f"
done

# Count remaining files
num_remaining=$(find "$SCRATCH/$TOPDIR" -type f | wc -l)
echo "$num_remaining"

# Create cleaned archive
cd "$SCRATCH" || exit 1
CLEANED="cleaned_$(basename "$ARCHIVE")"
tar -zcf "$HERE/$CLEANED" "$TOPDIR"





