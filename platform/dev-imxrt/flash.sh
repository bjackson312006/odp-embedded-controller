#!/bin/bash
# Flash script that builds in WSL and flashes via Windows probe-rs
# This works around WSL USB passthrough issues with CMSIS-DAP

set -e

CHIP="MIMXRT685SFVKB"
TARGET="thumbv8m.main-none-eabihf"
BINARY_NAME="dev-imxrt"
WINDOWS_TEMP="C:\\temp"
WSL_WINDOWS_TEMP="/mnt/c/temp"

# Build the project
echo "Building..."
cargo build

# Copy binary to Windows temp directory
echo "Copying binary to Windows..."
mkdir -p "$WSL_WINDOWS_TEMP"
cp "target/$TARGET/debug/$BINARY_NAME" "$WSL_WINDOWS_TEMP/"

# Flash using Windows probe-rs
echo "Flashing via Windows probe-rs..."
powershell.exe -c "probe-rs run --chip $CHIP $WINDOWS_TEMP\\$BINARY_NAME"

echo "Done!"
