execute_process(COMMAND "/home/liam/git/vision_grasp_capstone/ws_capstone/build/ggcnn/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/liam/git/vision_grasp_capstone/ws_capstone/build/ggcnn/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
