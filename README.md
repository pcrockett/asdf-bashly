<div align="center">

# asdf-bashly [![Build](https://github.com/pcrockett/asdf-bashly/actions/workflows/build.yml/badge.svg)](https://github.com/pcrockett/asdf-bashly/actions/workflows/build.yml) [![Lint](https://github.com/pcrockett/asdf-bashly/actions/workflows/lint.yml/badge.svg)](https://github.com/pcrockett/asdf-bashly/actions/workflows/lint.yml)

[bashly](https://bashly.dannyb.co/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add bashly
# or
asdf plugin add bashly https://github.com/pcrockett/asdf-bashly.git
```

bashly:

```shell
# Show all installable versions
asdf list-all bashly

# Install specific version
asdf install bashly latest

# Set a version globally (on your ~/.tool-versions file)
asdf global bashly latest

# Now bashly commands are available
bashly --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/pcrockett/asdf-bashly/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Philip Crockett](https://github.com/pcrockett/)
