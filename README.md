# OculusLinkLinux, a way to play your PCVR games on quest via a USB on Linux

As noted by the name, this project aims to either recreate, emulate, or find a way to get Oculus Link, or a Link-like app to allow for people to play
PCVR games on Linux, since Oculus(Meta) has no support, and also no plans to support Linux.

|    Headset     |  Work?|
| :------------: | :---: |
|  Oculus Quest  |   ?   |
| Oculus Quest 2 |   ?   |
| Quest Pro      |   ?   |  

> **Note**
> This may be affected by the type of gpu you have and the driver, Nvidia GPUs are known to have issues with VR(Unfortunately I have one)
> If that is the case, then I will update the graph accordingly.


As noted by the name, this project aims to either recreate, emulate, or find a way to get Oculus Link, or a Link-like app to allow for people to play
PCVR games on Linux, since Oculus(Meta) has no support, and also no plans to support Linux.

### Requirements

The full list of requirements is in the [Requirements](Requirements.md) folder.

#### OLL Progress

If you want to see the progress of this project, you can see the [Progress](./Progress.md) <-*TODO* folder, and also the Project page here on github.

The SteamVR driver, which has info in the [SteamVR driver readme](./src/driver/README.md), progress for this will be kept on #22, I will go into detail about how everything
is going.

If you want to see it, then [click here](https://github.com/MilkJug1/OculusLinkLinux/projects/3) for it.

##### Credits

Thanks to all of the people working on the OpenXR Project.

Thanks to Valve and all of the contributors of the OpenVR project.

~~Thanks to everyone working on Monado(The OpenSource XR platform for linux)~~ - Not needed now after commit 0c800c52552d814c1ae87454e8d7d20990ecd5a5

And believe it or not, thanks to Oculus for making the Quest(Even though no Linux support yet.)

Thanks to the Conan the C/C++ package manager that is open-source for making my life easier.

### Installing

Follow the instructions in the [Install.md file, since it has a really detailed instalation process, though nothing is currently working](./Install.md)

> **Note**
> At this current time(at the time of writing this), August 1st, 2022, there is no working build and or compiled version. You can try compiling from source for right now
> it may work in the future for when you are compiling.

> **Note**
> At this current time(at the time of writing this), August 1st, 2022, there is no working build and or compiled version. You can try compiling from source for right now
> it may work in the future for when you are compiling.

[![forthebadge](https://forthebadge.com/images/badges/made-with-c-plus-plus.svg)](https://forthebadge.com)

### Socials

![Discord Banner 3](https://discordapp.com/api/guilds/936065347218448415/widget.png?style=banner3)

I finally got the Discord Sever up, its a bit barebones, as I have never hosted a discord server, but it will be a place for people to chat about the project, and also to discuss the project.

### Branches

In past iterations of this Readme, I talked about the multiple different branches each with their own codebase and whatnot.
In this repo there are 4 different branches, each with their own different thing and also how up to date it is.

The branch list goes as followed:

`main` - The branch which will be the most stable, but can fluctate between codebases between the `rust` and `cpp` branch

`cpp` - This project rewritten in C++, and also will function as a nightly branch.

`rust` - As the name implies, this project just written in the rust programming language, OLfL was orginally going to be written in rust, though after thinking about it for a while,
I didn't know if it was possible in Rust. I still have plans for it to be rewritten in rust, its just going to be when the first working c++ build is out to the public.

`android` - Since of figuring out how the Qos(Quest OS) works, it may be required to have an android app in order to send the correct information to the OLfL desktop app, and the Quest.
This is only for right now, and can change in the future. We wouldn't have to require an android app if we knew we didn't need root in order to send and receive certain things.

> **Warning**
> I may just make the android branch a entirely separate repo, in order to help with separating the code bases, and also make it easier to build
