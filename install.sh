#!/bin/bash

# Author: Anthony Cox
# Date: August 14th, 2023
# Purpose: Copies a file or directory from a template located in '/usr/local/share/gentemp/templates' to the given destination
# 
# Exit Codes:
# 1: "$resource_dir" does not exist or script does not have write permissions
# 2: "$binary_dir" does not exist or script does not have write permissions
set -e

# 1. Installation Locations
binary_dir=/usr/local/bin
resource_dir=/usr/local/share

# 2. Validation write permissions to installation locations
if [[ ! -w "$resource_dir" ]]; then
    >&2 echo "fatal: insufficient permissions to create resources directory (gentemp/templates) in $resource_dir"
    exit 1
fi

if [[ ! -w "$binary_dir" ]]; then
    >&2 echo "fatal: insufficient permissions to install binary to '$binary_dir'"
    exit 2
fi

# 3. Installation
mkdir -p "$resource_dir/gentemp/templates"
cp gentemp "$binary_dir"
