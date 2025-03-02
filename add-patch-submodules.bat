@echo off
echo Adding ReVanced patches repositories as submodules...

git submodule add https://github.com/anddea/revanced-patches/ patches/anddea
git submodule add https://github.com/ReVanced/revanced-patches/ patches/revanced
git submodule add https://github.com/inotia00/revanced-patches/ patches/inotia00

echo.
echo Submodules added successfully. Initializing and updating...
git submodule update --init --recursive

echo.
echo Done! All patch repositories have been added as submodules.
pause
