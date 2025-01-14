include(cmake/CPM.cmake)
set(CPM_USE_LOCAL_PACKAGES OFF)
set(CPM_SOURCE_CACHE=$HOME/.cache/CPM)

# Done as a function so that updates to variables like
# CMAKE_CXX_FLAGS don't propagate out to other
# targets
function(myproject_setup_dependencies)

  # For each dependency, see if it's
  # already been provided to us by a parent project

#  if(NOT TARGET boost::boost)
#    if (myproject_ENABLE_CONAN)
#      CPMFindPackage(NAME Boost)
#    else()
#      CPMAddPackage(
#        NAME Boost
#        VERSION 1.82.0
#        GITHUB_REPOSITORY "boostorg/boost"
#        GIT_TAG "boost-1.82.0"
#      )
#    endif()
#  endif()

  if(NOT TARGET fmtlib::fmtlib)
    if (myproject_ENABLE_CONAN)
      CPMFindPackage(NAME fmt)
    else()
      CPMAddPackage("gh:fmtlib/fmt#9.1.0")
    endif()
  endif()

  if(NOT TARGET spdlog::spdlog)
    if (myproject_ENABLE_CONAN)
      CPMFindPackage(NAME spdlog)
    else()
      CPMAddPackage(
        NAME
        spdlog
        VERSION
        1.11.0
        GITHUB_REPOSITORY
        "gabime/spdlog"
        OPTIONS
        "SPDLOG_FMT_EXTERNAL ON")
    endif()
  endif()

#  if(NOT TARGET magic_enum::magic_enum)
#    if (myproject_ENABLE_CONAN)
#      CPMFindPackage(NAME magic_enum)
#    else()
#      CPMAddPackage(
#        NAME magic_enum
#        VERSION 0.9.3
#        GITHUB_REPOSITORY Neargye/magic_enum
#      )
#    endif()
#  endif()
#
#  if(NOT TARGET gsl-lite::gsl-lite)
#    if (myproject_ENABLE_CONAN)
#      CPMFindPackage(NAME gsl-lite)
#    else()
#      CPMAddPackage("gh:gsl-lite/gsl-lite@0.41.0")
#    endif()
#  endif()

  if(NOT TARGET CLI11::CLI11)
    if (myproject_ENABLE_CONAN)
      CPMFindPackage(NAME CLI11)
    else()
      CPMAddPackage("gh:CLIUtils/CLI11@2.3.2")
    endif()
  endif()

  if(NOT TARGET ftxui::screen)
    if (myproject_ENABLE_CONAN)
      CPMFindPackage(NAME ftxui)
    else()
      CPMAddPackage("gh:ArthurSonzogni/FTXUI#e23dbc7473654024852ede60e2121276c5aab660")
    endif()
  endif()

  if(NOT TARGET Catch2::Catch2WithMain)
    if (myproject_ENABLE_CONAN)
      CPMFindPackage(NAME Catch2)
    else()
      CPMAddPackage("gh:catchorg/Catch2@3.3.2")
    endif()
  endif()

#  if(NOT TARGET doctest::doctest)
#    if (myproject_ENABLE_CONAN)
#      CPMFindPackage(NAME doctest)
#    else()
#      CPMAddPackage("gh:doctest/doctest@2.4.11")
#    endif()
#  endif()

  # Packages only available with CPM
  if(NOT TARGET tools::tools)
    CPMAddPackage("gh:lefticus/tools#update_build_system")
  endif()

#  if(NOT TARGET simpleini::simpleini)
#    CPMAddPackage(
#      NAME simpleini
#      VERSION 4.19
#      GITHUB_REPOSITORY brofield/simpleini
#    )
#  endif()

  # Standalone packages not available anywhere else
  # Include module path for packages that we need to find or build manually
#  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)
#  include(cmake/Findnewt.cmake)
#  if(NOT TARGET newt)
#    CPMFindPackage(NAME newt)
#  endif()

endfunction()
