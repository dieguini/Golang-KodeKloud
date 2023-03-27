# Golang-KodeKloud

Following Golang Path at #KodeKloud platform

## Environment

The most important parts of the environmentare divided in this two:

- **.devcontainer**: A container with dependencies to build and execute the go command, Anaconda for the playbooks
- **Makefile**: Make file has all extra dependencies to work and compile the project

### Devcontainer

[Working on it...]

### [Make](Makefile)

[Working on it...]

### Magic fix command

There is a magic fix command for the `\r` character

```sh
cd ~/.pyenv && find . -type f | xargs sed -i $'s/\r$//' && cd -
```

This is extra speccial when using WSL on Windows
