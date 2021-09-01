execute_process(COMMAND "/home/nuwan/git/vision_grasp_capstone/ws_capstone/build/dougsm_helpers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/nuwan/git/vision_grasp_capstone/ws_capstone/build/dougsm_helpers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
