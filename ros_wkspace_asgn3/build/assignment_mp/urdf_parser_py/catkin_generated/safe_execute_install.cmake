execute_process(COMMAND "/home/luca/ros_wkspace_asgn3/build/assignment_mp/urdf_parser_py/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/luca/ros_wkspace_asgn3/build/assignment_mp/urdf_parser_py/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
