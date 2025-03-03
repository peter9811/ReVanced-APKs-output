# ReVanced Build Workflow Documentation

## Overview

This repository contains GitHub Actions workflows for automatically building and distributing ReVanced modules and APKs.

## Main Workflow: `build.yml`

The `build.yml` workflow handles:

1. Building ReVanced modules and APKs
2. Creating GitHub releases for the built files
3. Updating changelog information
4. Updating Magisk module update JSON files
5. Reporting new builds to Telegram

## How It Works

1. **Configuration Update**: Checks for updated configuration in the `update` branch.
2. **Version Management**: Automatically increments the version code based on the latest release.
3. **Build Process**: Executes the build script with the appropriate configuration.
4. **Release Creation**: Uploads all built files to a new GitHub release.
5. **Update Management**: Updates the changelog and Magisk module update JSON files.
6. **Notification**: If configured, sends a notification to Telegram with download links.

## Usage

The workflow can be triggered:

- Manually via the GitHub Actions interface
- As a reusable workflow from other workflows

## Environment Variables

- `GITHUB_TOKEN`: Used for GitHub API operations
- `TG_TOKEN`: Optional Telegram bot token for notifications

## Troubleshooting

If the build fails, check:

1. The build logs for specific error messages
2. That all required secrets are properly set up
3. That the configuration files are valid
