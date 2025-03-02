# ReVanced Patch Repositories

This directory contains submodules for different ReVanced patch repositories:

## Official ReVanced Patches

- Location: `./revanced/`
- Repository: [ReVanced/revanced-patches](https://github.com/ReVanced/revanced-patches/)
- Description: The official ReVanced patches from the ReVanced team

## inotia00's Extended Patches

- Location: `./inotia00/`
- Repository: [inotia00/revanced-patches](https://github.com/inotia00/revanced-patches/)
- Description: ReVanced Extended patches with additional features and customizations

## anddea's Patches

- Location: `./anddea/`
- Repository: [anddea/revanced-patches](https://github.com/anddea/revanced-patches/)
- Description: Additional community patches

## Usage

After initializing the submodules with the `add-patch-submodules.bat` script, you can reference the patches from these repositories in your build configuration.

To update all patch repositories to their latest versions:

```bash
git submodule update --remote --merge
```
