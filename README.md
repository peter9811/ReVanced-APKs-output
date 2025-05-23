# ReVanced Magisk Module

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/rvc_magisk)
[![CI](https://github.com/j-hc/revanced-magisk-module/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/j-hc/revanced-magisk-module/actions/workflows/ci.yml)

Extensive ReVanced builder

Get the [latest CI release](https://github.com/j-hc/revanced-magisk-module/releases).

Use [**zygisk-detach**](https://github.com/j-hc/zygisk-detach) to detach YouTube and YT Music from Play Store if you are using magisk modules.

<details><summary><big>Features</big></summary>
<ul>
 <li>Support all present and future ReVanced and <a href="https://github.com/inotia00/revanced-patches">ReVanced Extended</a> apps</li>
 <li> Can build Magisk modules and non-root APKs</li>
 <li> Updated daily with the latest versions of apps and patches</li>
 <li> Optimize APKs and modules for size</li>
 <li> Modules</li>
    <ul>
     <li> recompile invalidated odex for faster usage</li>
     <li> receive updates from Magisk app</li>
     <li> do not break safetynet or trigger root detections</li>
     <li> handle installation of the correct version of the stock app and all that</li>
     <li> support Magisk and KernelSU</li>
    </ul>
</ul>
Note that the <a href="../../actions/workflows/ci.yml">CI workflow</a> is scheduled to build the modules and APKs everyday using GitHub Actions if there is a change in ReVanced patches. You may want to disable it.
</details>

## Included Patch Repositories

This project includes the following patch repositories as submodules:

- [Official ReVanced Patches](https://github.com/ReVanced/revanced-patches/) - The official ReVanced patches
- [inotia00's Extended Patches](https://github.com/inotia00/revanced-patches/) - ReVanced Extended patches with additional features
- [anddea's Patches](https://github.com/anddea/revanced-patches/) - Additional community patches

To add these submodules to your repository, run the provided script:

```
add-patch-submodules.bat
```

## To include/exclude patches or patch other apps

- Star the repo :eyes:
- Use the repo as a [template](https://github.com/new?template_name=revanced-magisk-module&template_owner=j-hc)
- Customize [`config.toml`](./config.toml) using [rvmm-config-gen](https://j-hc.github.io/rvmm-config-gen/)
- Run the build [workflow](../../actions/workflows/build.yml)
- Grab your modules and APKs from [releases](../../releases)

also see here [`CONFIG.md`](./CONFIG.md)

## Building Locally

### On Termux

```console
bash <(curl -sSf https://raw.githubusercontent.com/j-hc/revanced-magisk-module/main/build-termux.sh)
```

### On Desktop

```console
git clone https://github.com/j-hc/revanced-magisk-module
cd revanced-magisk-module
./build.sh
```

# ReVanced APKs Output

This repository contains automatically built ReVanced APKs. The builds are automatically triggered:

- Daily at 16:00 UTC
- Manually using the "Run workflow" button
- When configuration changes are detected

## How it works

1. The CI workflow checks if there are any configuration changes
2. If changes are detected or this is the first run, it triggers the build workflow
3. The build workflow creates the APKs and publishes them

## Configuration

The build process uses `config.toml` for configuration. Any changes to this file will trigger a new build.

## Manual Build

To manually trigger a build, go to the Actions tab, select the CI workflow, and click "Run workflow".
