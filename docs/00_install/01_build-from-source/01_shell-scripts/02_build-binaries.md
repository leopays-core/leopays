---
content_title: Build LeoPays Binaries
---

[[info | Shell Scripts]]
| The build script is one of various automated shell scripts provided in the LeoPays Repository for building, installing, and optionally uninstalling the LeoPays software and its dependencies. They are available in the `leopays/scripts` folder.

The build script first installs all dependencies and then builds LeoPays. The script supports these [Operating Systems](../../index.md#supported-operating-systems). To run it, first change to the `~/leopays-core/leopays` folder, then launch the script:

```sh
cd ~/leopays-core/leopays
./build.sh
```

The build process writes temporary content to the `leopays/build` folder. After building, the program binaries can be found at `leopays/build/programs`.

[[info | What's Next?]]
| [Installing LeoPays](./03_install-binaries.md) is strongly recommended after building from source as it makes local development significantly more friendly.
