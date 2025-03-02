#!/bin/bash

# Initialize all submodules
git submodule init

# Update and checkout specific branches for each submodule
echo "Setting up anddea/revanced-patches..."
git submodule update --init -- anddea-patches
(cd anddea-patches && git checkout main && git pull origin main)

echo "Setting up ReVanced/revanced-patches..."
git submodule update --init -- revanced-patches
(cd revanced-patches && git checkout main && git pull origin main)

echo "Setting up inotia00/revanced-patches..."
git submodule update --init -- inotia00-patches
(cd inotia00-patches && git checkout revanced-extended && git pull origin revanced-extended)

echo "All patch repositories have been initialized and updated."
