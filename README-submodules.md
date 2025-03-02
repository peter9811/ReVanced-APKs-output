# Working with Submodules

This repository contains submodules that reference external repositories. Here's how to work with them:

## Initial Clone

When you first clone this repository, the submodule directories will be empty. You need to initialize and update them:

```bash
git clone https://github.com/yourusername/ReVanced-APKs-output.git
cd ReVanced-APKs-output
git submodule init
git submodule update
```

## Updating Submodules Manually

To update the submodules to their latest commits:

```bash
git submodule update --remote
git add .
git commit -m "Update submodules"
git push
```

## Adding New Submodules

To add a new submodule:

```bash
git submodule add https://github.com/username/repository.git path/to/submodule
git commit -m "Add new submodule"
git push
```

## Automatic Updates

This repository is configured with a GitHub Action that automatically updates all submodules daily. You can also trigger the update manually by navigating to the Actions tab in the GitHub repository and running the "Update Submodules" workflow.

## Included Patch Repositories

This repository includes the following patch repositories as submodules:

1. **anddea/revanced-patches** - Located in `anddea-patches/`
   - Source: <https://github.com/anddea/revanced-patches>
   - Branch: main

2. **ReVanced/revanced-patches** - Located in `revanced-patches/`
   - Source: <https://github.com/ReVanced/revanced-patches>
   - Branch: main

3. **inotia00/revanced-patches** - Located in `inotia00-patches/`
   - Source: <https://github.com/inotia00/revanced-patches>
   - Branch: revanced-extended
