#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/luca/ros_wkspace_asgn3/src/assignment_mp/urdf_parser_py"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/luca/ros_wkspace_asgn3/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/luca/ros_wkspace_asgn3/install/lib/python3/dist-packages:/home/luca/ros_wkspace_asgn3/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/luca/ros_wkspace_asgn3/build" \
    "/usr/bin/python3" \
    "/home/luca/ros_wkspace_asgn3/src/assignment_mp/urdf_parser_py/setup.py" \
     \
    build --build-base "/home/luca/ros_wkspace_asgn3/build/assignment_mp/urdf_parser_py" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/luca/ros_wkspace_asgn3/install" --install-scripts="/home/luca/ros_wkspace_asgn3/install/bin"
