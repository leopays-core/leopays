---
content_title: Download LeoPays Source
---

To download the LeoPays source code, clone the LeoPays repo and its submodules. It is adviced to create a home `leopays-core` folder first and download all the LeoPays related software there:

```sh
mkdir -p ~/leopays-core && cd ~/leopays-core
git clone --recursive https://github.com/leopays-core/leopays
```

## Update Submodules

If a repository is cloned without the `--recursive` flag, the submodules *must* be updated before starting the build process:

```sh
cd ~/leopays-core/leopays
git submodule update --init --recursive
```

## Pull Changes

When pulling changes, especially after switching branches, the submodules *must* also be updated. This can be achieved with the `git submodule` command as above, or using `git pull` directly:

```sh
[git checkout <branch>]  (optional)
git pull --recurse-submodules
```

[[info | What's Next?]]
| [Build LeoPays binaries](./02_build-binaries.md)
