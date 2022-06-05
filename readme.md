# Dreck OptiPNG Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-optipng-plugin.svg)](https://github.com/sunruse/dreck-optipng-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Compresses PNG files.

## Dependencies

- OptiPNG

This must be available on the PATH (e.g. `optipng --help` prints help text when executed in a Bash terminal).

### For running tests

If you wish to run tests, Imagemagick must be installed; `convert` must be available on the PATH (e.g. `convert --help` prints help text when executed in a Bash terminal).

### Installing on Debian-based Linux distributions

OptiPNG is available from most Debian-based Linux distributions' package managers; for example, it can be installed when running Ubuntu 20.04 LTS using the following command:

```bash
sudo apt-get install optipng --yes
```

If you need to run tests, install Imagemagick:

```bash
sudo apt-get install imagemagick --yes
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-optipng-plugin plugins/optipng
```

## Input

This plugin compresses each PNG file in the `DRECK_PNG_INPUT_PNG_PATHS` Make variable.

## Output

This plugin writes an equivalent PNG document for each input PNG template.  For example, if `DRECK_PNG_INPUT_PNG_PATHS` contained `./a/b-c.png`, `./plugins/optipng/generated/a/b-c.png` would be written to disk.

Their paths are listed in the `DRECK_PNG_OUTPUT_PNG_PATHS` Make variable, space separated.