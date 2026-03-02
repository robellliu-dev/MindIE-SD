#!/bin/bash

set -e

echo "Starting MindIE-SD build..."

# Source environment
source /usr/local/Ascend/ascend-toolkit/set_env.sh

export TORCH_DEVICE_BACKEND_AUTOLOAD=0
export USER_ABI_VERSION=1

echo "Environment variables set:"
echo "TORCH_DEVICE_BACKEND_AUTOLOAD=$TORCH_DEVICE_BACKEND_AUTOLOAD"
echo "USER_ABI_VERSION=$USER_ABI_VERSION"

# Install dependencies if needed
if [ -f "requirements.txt" ]; then
    echo "Installing requirements..."
    pip install -r requirements.txt
fi

# Build wheel package
echo "Building wheel package..."
python setup.py bdist_wheel

# Display results
echo "Build completed!"
find . -name "*.whl" -type f -exec echo "Found wheel: {}" \;