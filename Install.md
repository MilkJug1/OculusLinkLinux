# Compiling and Installing from Source

The install instructions here are a bit detailed, if I miss something and or do something wrong, please make a GH issue about it, or create a pr to fix it.

First you need to clone this repo(since there is no prebuilt image for right now)

Do this by using this command

```sh
git clone https://github.com/MilkJug1/OculusLinkLinux
```

~~After this you need to initialize the submodules, which is only OpenXR for the time being, do this by using this command:~~

Don't worry about OpenXR right now, if you have created a fork that uses OpenXR for something with this, then you can ignore this.

```sh
git submodule init 
git submodule sync 
git submodule update 
```

> **Note**
> You could only do the git submodule init, but in the event that the `OpenXR-SDK` folder is not cloned into the `src/ directory, you can choose to do the other commands.
> Another note, OpenXR-SDK may not be needed in later revisions, but may become utilized later on in this lifespan of this project, for right now I am removing it from the Repo since OpenVR can handle of the talk to SteamVR.

Create the build dir via the

```sh
mkdir build/
```

command, since in a recent commit, I removed it since it just held stuff for your system, it info for my system, which could be an issue for your installation of Linux.

Than `cd build/` into that recently created directory and then run the following command:

```sh
conan install .. 
```

> **Warning**
> This may cause an error the first time you do this command, in that case, please run this command with the `--build` flag at the end.

^ You only need to do this command once, in the event that you add a library to the `conanfile.txt`, still don't unless you get an error that requires you to build it.

Finally, you can then compile with this command:

```sh
make -j$(nproc) 
```

> **Note**
> the `-j$(nproc) flag is only for using multiple cores at once to build, the reason for this is to speed up the build times, since depending on how big this project gets, it can be quite long.

The binary will compile inside of the `build/` dir.

In the event you make a change and need to compile again make sure to do the `make clean` command and then do `make -j$(nproc)`
