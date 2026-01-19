# P6's POSIX.2: p6macosx

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Hooks](#hooks)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Hooks

- `deps` -> `p6df::modules::p6macosx::deps()`
- `init` -> `p6df::modules::p6macosx::init(_module, dir)`

### Functions

#### p6macosx

##### p6macosx/init.zsh

- `p6df::modules::p6macosx::deps()`
- `p6df::modules::p6macosx::init(_module, dir)`

#### p6macosx/lib

##### p6macosx/lib/osa.sh

- `p6_macosx_osa_iterm_color(host, fg, bg, alpha)`
- `p6_macosx_osa_iterm_color_default()`
- `p6_macosx_osa_iterm_color_run(host, code)`
- `p6_macosx_osa_iterm_color_set(host)`
- `str bg = p6_macosx_osa_bg_for_host(host)`
- `str fg = p6_macosx_osa_fg_for_host(host)`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── osa.sh
└── README.md

2 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
