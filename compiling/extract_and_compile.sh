#!/usr/sbin/env bash


NUM=$1

# Check if archive exists
if [ -f "NthPrime.tgz" ]; then
  echo "Archive found: NthPrime.tgz, continuing."
  #Extract the Archive
  tar -xzf NthPrime.tgz
else
  echo "Archive not found: NthPrime.tgz, exiting."
  exit 1
fi

# Enter the extracted directory
if [ -d "NthPrime" ]; then
  echo "Directory found: NthPrime, continuing."
  cd NthPrime || exit 1
else
  echo "Directory not found after extraction, exiting."
  exit 1
fi

# Check for source files
if [ -f "main.c" ] && [ -f "nth_prime.c" ]; then
  echo "Source files found: main.c and nth_prime.c, continuing."
else
  echo "Missing source files exiting."
  exit 1
fi

# Compile the program
echo "Compiling program..."
gcc -o NthPrime main.c nth_prime.c
echo "Compilation complete."

# Check if executable exists
if [ -f "NthPrime" ]; then
  echo "Executable created successfully running program."
  ./NthPrime "$NUM"
else
  echo "Executable not found after compilation exiting."
  exit 1
fi

