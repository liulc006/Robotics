# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "state_estimator: 5 messages, 0 services")

set(MSG_I_FLAGS "-Istate_estimator:/home/luca/ros_wkspace_asgn4/src/state_estimator/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(state_estimator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_custom_target(_state_estimator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "state_estimator" "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" ""
)

get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_custom_target(_state_estimator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "state_estimator" "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" "state_estimator/Landmark"
)

get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_custom_target(_state_estimator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "state_estimator" "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" "state_estimator/Landmark"
)

get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_custom_target(_state_estimator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "state_estimator" "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" "state_estimator/Landmark:state_estimator/LandmarkReading:std_msgs/Header"
)

get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_custom_target(_state_estimator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "state_estimator" "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" "std_msgs/Header:geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
)
_generate_msg_cpp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
)
_generate_msg_cpp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
)
_generate_msg_cpp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg;/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
)
_generate_msg_cpp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
)

### Generating Services

### Generating Module File
_generate_module_cpp(state_estimator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(state_estimator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(state_estimator_generate_messages state_estimator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_cpp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_cpp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_cpp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_cpp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_cpp _state_estimator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(state_estimator_gencpp)
add_dependencies(state_estimator_gencpp state_estimator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS state_estimator_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
)
_generate_msg_eus(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
)
_generate_msg_eus(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
)
_generate_msg_eus(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg;/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
)
_generate_msg_eus(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
)

### Generating Services

### Generating Module File
_generate_module_eus(state_estimator
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(state_estimator_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(state_estimator_generate_messages state_estimator_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_eus _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_eus _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_eus _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_eus _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_eus _state_estimator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(state_estimator_geneus)
add_dependencies(state_estimator_geneus state_estimator_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS state_estimator_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
)
_generate_msg_lisp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
)
_generate_msg_lisp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
)
_generate_msg_lisp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg;/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
)
_generate_msg_lisp(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
)

### Generating Services

### Generating Module File
_generate_module_lisp(state_estimator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(state_estimator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(state_estimator_generate_messages state_estimator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_lisp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_lisp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_lisp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_lisp _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_lisp _state_estimator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(state_estimator_genlisp)
add_dependencies(state_estimator_genlisp state_estimator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS state_estimator_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
)
_generate_msg_nodejs(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
)
_generate_msg_nodejs(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
)
_generate_msg_nodejs(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg;/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
)
_generate_msg_nodejs(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
)

### Generating Services

### Generating Module File
_generate_module_nodejs(state_estimator
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(state_estimator_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(state_estimator_generate_messages state_estimator_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_nodejs _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_nodejs _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_nodejs _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_nodejs _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_nodejs _state_estimator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(state_estimator_gennodejs)
add_dependencies(state_estimator_gennodejs state_estimator_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS state_estimator_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
)
_generate_msg_py(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
)
_generate_msg_py(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
)
_generate_msg_py(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg;/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
)
_generate_msg_py(state_estimator
  "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
)

### Generating Services

### Generating Module File
_generate_module_py(state_estimator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(state_estimator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(state_estimator_generate_messages state_estimator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/Landmark.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_py _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkReading.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_py _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/LandmarkSet.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_py _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/SensorData.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_py _state_estimator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/luca/ros_wkspace_asgn4/src/state_estimator/msg/RobotPose.msg" NAME_WE)
add_dependencies(state_estimator_generate_messages_py _state_estimator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(state_estimator_genpy)
add_dependencies(state_estimator_genpy state_estimator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS state_estimator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/state_estimator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(state_estimator_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(state_estimator_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/state_estimator
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(state_estimator_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(state_estimator_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/state_estimator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(state_estimator_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(state_estimator_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/state_estimator
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(state_estimator_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(state_estimator_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/state_estimator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(state_estimator_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(state_estimator_generate_messages_py geometry_msgs_generate_messages_py)
endif()
