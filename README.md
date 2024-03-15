# p6macosx

## Table of Contents


### p6macosx
- [p6macosx](#p6macosx)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Changes](#changes)
    - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6macosx)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6macosx/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6macosx/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6macosx)
[![Known Vulnerabilities](https://snyk.io/test/github/p6m7g8/p6macosx/badge.svg?targetFile=package.json)](https://snyk.io/test/github/p6m7g8/p6macosx?targetFile=package.json)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6macosx)](https://github.com/p6m7g8/p6macosx/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6macosx)](https://github.com/p6m7g8/p6macosx/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Changes

- [Change Log](CHANGELOG.md)

## Usage

### p6macosx:

#### p6macosx/init.zsh:

- p6df::modules::p6macosx::deps()
- p6df::modules::p6macosx::init(_module, dir)


### p6macosx/lib:

#### p6macosx/lib/osa.sh:

- p6_macosx_osa_bg_for_host(host)
- p6_macosx_osa_fg_for_host(host)
- p6_macosx_osa_iterm_color(host, fg, bg, alpha)
- p6_macosx_osa_iterm_color_default()
- p6_macosx_osa_iterm_color_run(host, code)
- p6_macosx_osa_iterm_color_set(host)

#### p6macosx/lib/ssh.sh:

- p6_macosx_ssh_do(host, [type=ssh], [pfunc=])



## Hier
```text
.
├── osa.sh
└── ssh.sh

1 directory, 2 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
