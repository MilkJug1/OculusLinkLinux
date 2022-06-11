# Compiling and Installing from Source

TODO: ADD DETAILED EXPLANATION FOR INSTALLING

First you need to clone this repo(since there is no prebuilt image for right now)

Do this by using this command

```sh
git clone https://github.com/MilkJug1/OculusLinkLinux
```

After this you need to initialize the submodules, which is only OpenXR for the time being, do this by using this command:

```sh
git submodule init 
git submodule sync 
git submodule update 
```
> **Note**
> You could only do the git submodule init, but in the even that the `OpenXR-SDK` folder is not cloned into the `src/ directory, you can choose to do the other commands. 

Now one more thing before you can compile, cd into the `build/` dir and paste this in your terminal:

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
