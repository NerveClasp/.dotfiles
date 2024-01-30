# .dotfiles

## WARNING

Look through files here, especially in `profiles/` for any of my hardcoded
personal data and modify if necessary.

## Installation

### macOS

- Install homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install `Shemnei/punktf`

```sh
brew install michidk/tools/punktf
```

- Clone this repo somewhere and cd into it, for example

```sh
git clone git@github.com:NerveClasp/.dotfiles.git
cd .dotfiles
```

- Deploy dotfiles

```sh
punktf deploy --profile darwin
```
