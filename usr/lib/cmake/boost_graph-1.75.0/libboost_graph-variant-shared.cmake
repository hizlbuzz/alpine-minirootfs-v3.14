# Generated by Boost 1.75.0

# address-model=32

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  _BOOST_SKIPPED("libboost_graph.so.1.75.0" "32 bit, need 64")
  return()
endif()

# layout=system

# toolset=gcc10

# link=shared

if(DEFINED Boost_USE_STATIC_LIBS)
  if(Boost_USE_STATIC_LIBS)
    _BOOST_SKIPPED("libboost_graph.so.1.75.0" "shared, Boost_USE_STATIC_LIBS=${Boost_USE_STATIC_LIBS}")
    return()
  endif()
else()
  if(WIN32 AND NOT _BOOST_SINGLE_VARIANT)
    _BOOST_SKIPPED("libboost_graph.so.1.75.0" "shared, default on Windows is static, set Boost_USE_STATIC_LIBS=OFF to override")
    return()
  endif()
endif()

# runtime-link=shared

if(Boost_USE_STATIC_RUNTIME)
  _BOOST_SKIPPED("libboost_graph.so.1.75.0" "shared runtime, Boost_USE_STATIC_RUNTIME=${Boost_USE_STATIC_RUNTIME}")
  return()
endif()

# runtime-debugging=off

if(Boost_USE_DEBUG_RUNTIME)
  _BOOST_SKIPPED("libboost_graph.so.1.75.0" "release runtime, Boost_USE_DEBUG_RUNTIME=${Boost_USE_DEBUG_RUNTIME}")
  return()
endif()

# threading=multi

# variant=release

if(NOT "${Boost_USE_RELEASE_LIBS}" STREQUAL "" AND NOT Boost_USE_RELEASE_LIBS)
  _BOOST_SKIPPED("libboost_graph.so.1.75.0" "release, Boost_USE_RELEASE_LIBS=${Boost_USE_RELEASE_LIBS}")
  return()
endif()

if(Boost_VERBOSE OR Boost_DEBUG)
  message(STATUS "  [x] libboost_graph.so.1.75.0")
endif()

# Create imported target Boost::graph

if(NOT TARGET Boost::graph)
  add_library(Boost::graph SHARED IMPORTED)

  set_target_properties(Boost::graph PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_BOOST_INCLUDEDIR}"
    INTERFACE_COMPILE_DEFINITIONS "BOOST_ALL_NO_LIB"
  )
endif()

# Target file name: libboost_graph.so.1.75.0

get_target_property(__boost_imploc Boost::graph IMPORTED_LOCATION_RELEASE)
if(__boost_imploc)
  message(SEND_ERROR "Target Boost::graph already has an imported location '${__boost_imploc}', which is being overwritten with '${_BOOST_LIBDIR}/libboost_graph.so.1.75.0'")
endif()
unset(__boost_imploc)

set_property(TARGET Boost::graph APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)

set_target_properties(Boost::graph PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE CXX
  IMPORTED_LOCATION_RELEASE "${_BOOST_LIBDIR}/libboost_graph.so.1.75.0"
  )

set_target_properties(Boost::graph PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
  )

set_property(TARGET Boost::graph APPEND
  PROPERTY INTERFACE_COMPILE_DEFINITIONS "BOOST_GRAPH_DYN_LINK"
  )

list(APPEND _BOOST_GRAPH_DEPS regex headers)

if(CMAKE_CONFIGURATION_TYPES)
  set_property(TARGET Boost::graph APPEND PROPERTY INTERFACE_LINK_LIBRARIES
    "$<$<CONFIG:release>:icudata;icui18n;icuuc>")
else()
  set_property(TARGET Boost::graph APPEND PROPERTY INTERFACE_LINK_LIBRARIES
    icudata icui18n icuuc)
endif()
