execute_process(
  COMMAND git "describe" "--tags"
  OUTPUT_VARIABLE GIT_REPO_VERSION_UNCLEANED
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  ERROR_QUIET
)
string(REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+(\\.[0-9]+(\\.g[0-9a-f]+)?)?"
             GIT_REPO_VERSION "${GIT_REPO_VERSION_UNCLEANED}"
)

if("${GIT_REPO_VERSION}" STREQUAL "")
  if(DEFINED ENV{GIT_DESCRIBE_TAG})
    message("TAG:" ENV{GIT_DESCRIBE_TAG})
    set(GIT_REPO_VERSION ENV{GIT_DESCRIBE_TAG})
  else()
    set(GIT_REPO_VERSION "99.99.99")
  endif()
endif()
