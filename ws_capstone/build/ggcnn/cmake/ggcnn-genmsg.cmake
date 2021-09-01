# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ggcnn: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iggcnn:/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ggcnn_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_custom_target(_ggcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ggcnn" "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:ggcnn/Grasp:geometry_msgs/Point"
)

get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_custom_target(_ggcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ggcnn" "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ggcnn
)

### Generating Services
_generate_srv_cpp(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ggcnn
)

### Generating Module File
_generate_module_cpp(ggcnn
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ggcnn
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ggcnn_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ggcnn_generate_messages ggcnn_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_dependencies(ggcnn_generate_messages_cpp _ggcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_dependencies(ggcnn_generate_messages_cpp _ggcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ggcnn_gencpp)
add_dependencies(ggcnn_gencpp ggcnn_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ggcnn_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ggcnn
)

### Generating Services
_generate_srv_eus(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ggcnn
)

### Generating Module File
_generate_module_eus(ggcnn
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ggcnn
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ggcnn_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ggcnn_generate_messages ggcnn_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_dependencies(ggcnn_generate_messages_eus _ggcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_dependencies(ggcnn_generate_messages_eus _ggcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ggcnn_geneus)
add_dependencies(ggcnn_geneus ggcnn_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ggcnn_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ggcnn
)

### Generating Services
_generate_srv_lisp(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ggcnn
)

### Generating Module File
_generate_module_lisp(ggcnn
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ggcnn
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ggcnn_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ggcnn_generate_messages ggcnn_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_dependencies(ggcnn_generate_messages_lisp _ggcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_dependencies(ggcnn_generate_messages_lisp _ggcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ggcnn_genlisp)
add_dependencies(ggcnn_genlisp ggcnn_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ggcnn_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ggcnn
)

### Generating Services
_generate_srv_nodejs(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ggcnn
)

### Generating Module File
_generate_module_nodejs(ggcnn
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ggcnn
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ggcnn_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ggcnn_generate_messages ggcnn_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_dependencies(ggcnn_generate_messages_nodejs _ggcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_dependencies(ggcnn_generate_messages_nodejs _ggcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ggcnn_gennodejs)
add_dependencies(ggcnn_gennodejs ggcnn_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ggcnn_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn
)

### Generating Services
_generate_srv_py(ggcnn
  "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn
)

### Generating Module File
_generate_module_py(ggcnn
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ggcnn_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ggcnn_generate_messages ggcnn_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/srv/GraspPrediction.srv" NAME_WE)
add_dependencies(ggcnn_generate_messages_py _ggcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/josh/Documents/GitHub/vision_grasp_capstone/ws_capstone/src/mvp_grasp-master/ggcnn/msg/Grasp.msg" NAME_WE)
add_dependencies(ggcnn_generate_messages_py _ggcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ggcnn_genpy)
add_dependencies(ggcnn_genpy ggcnn_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ggcnn_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ggcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ggcnn
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ggcnn_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ggcnn_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ggcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ggcnn
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ggcnn_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ggcnn_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ggcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ggcnn
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ggcnn_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ggcnn_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ggcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ggcnn
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ggcnn_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ggcnn_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ggcnn/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ggcnn_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ggcnn_generate_messages_py geometry_msgs_generate_messages_py)
endif()
