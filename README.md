# PLEASE READ THIS BEFORE CONTINUING ON

**AT THE MOMENT, THIS DOES NOT WORK..**

Still in development so come back later to see a native build come out, its first going to be on Arch since I develop on it, and then comes the other distros. 

Performace will be very poor, since its in its early stage, so come here to submit a issue from a certain game/VR tool and try and commit to this repo.
This may or may not be built in Rust or C/C++, I just gotta decide on which one I want to do. Also a Discord Server is coming soon!

*note: this may be packaged as a flatpak in order for every else to use it, but im not sure if the whole thing will work smoohtly. Mainly expect Arch to be the most stable, and be weary of the other distros binary of this since it may be less stable.*

There is 2 different branches that have their own code base, it goes as followed: Main-> Has mainly cpp code, and makefiles. This is going to be the one that the most actively developed because of OpenXR. C/CPP: Just the same as main but not as updated
Rust: the entirety of this project written in rust, the original language that this was going to be written in.


# OculusLinkLinux
This Open-Source Project is trying to get Oculus Quest link(Meta link?) working on Linux, since there is no support for Oculus drivers on Linux. 

# Requirements
The full list of requirements is in the [Requirements](./Requirements.md) folder.


# OLL Progress 
Please if you want to see the progress of this project, then check out the trello board that I made(its not entirly full of things atm, but once later down the line it will look much more like a todo list or something like that).

If you want to see it, then [click here](https://trello.com/b/Q6wLkRCi/progess-with-oll) for it.

# Credits
Thanks to all of the people working on the OpenXR Project

Thanks to everyone working on Monado(The OpenSource XR platform for linux )

And believe it or not, thanks to Oculus for making the Quest(Even though no Linux support yet.)

Thanks to the Conan the C/C++ package manager that is opensource for making my life easier.


# Installing
**At the current moment there is no working public build, but you can try to compile from source.**

1. Git clone this repo.
```git clone https://github.com/MilkJug1/OculusLinkLinux.git```

2. cd into OculusLinkLinux and then run 
```git submodule init``` & ```cd build && conan install ..```

If doing ```conan install``` gives any errors(mainly any that are related to the build system), then do ```conan install .. --build *nameofpackage*``` .

3. then cd back into into oll/(can do this by ```cd .. ```) and then run ```make```



[![forthebadge](https://forthebadge.com/images/badges/made-with-c-plus-plus.svg)](https://forthebadge.com)
