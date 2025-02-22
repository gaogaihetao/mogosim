# mogosim

## reference
- https://docs.ros.org/en/rolling/Installation/Ubuntu-Install-Debs.html
- https://fishros.org/doc/ros2/humble/dev/Tutorials/Beginner-Client-Libraries/Writing-A-Simple-Cpp-Publisher-And-Subscriber.html#

## how-to

### clone repo
execute somewhere: 
`git clone https://github.com/gaogaihetao/mogosim.git`

### build docker image
cd code directory: `${SOMEWHERE}/mogosim/`, then execute: 
`bash docker/build.sh`

It builds a docker image named with `mogusim:latest` with ros2 installed.

### start docker container

at `${SOMEWHERE}/mogosim/`, execute:
`bash docker/start.sh`

It starts a container named with `mogusim-dev` and builds sources with concol.

### enter container and run publisher
at `${SOMEWHERE}/mogosim/`, execute:

`bash docker/into.sh`

Then exeucte inside container:
`. install/setup.bash && ros2 run cpp_pub mogo_publisher`

It prints:
```
[INFO] [1740200050.602636860] [mogo_publisher]: hello mogo
[INFO] [1740200051.602645136] [mogo_publisher]: hello mogo
[INFO] [1740200052.602664741] [mogo_publisher]: hello mogo
```

### enter container and run publisher
open a new terminal, cd `${SOMEWHERE}/mogosim/`, and execute:

`bash docker/into.sh`

Then exeucte inside container:
`. install/setup.bash && ros2 run py_sub mogo_subscriber`

It prints:
```
[INFO] [1740200086.618111161] [mogo_subscriber]: hello mogo
[INFO] [1740200087.603848912] [mogo_subscriber]: hello mogo
[INFO] [1740200088.603836414] [mogo_subscriber]: hello mogo
```
