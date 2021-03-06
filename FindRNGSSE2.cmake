################################################################################
#
# \file      FindRNGSSE2.cmake
# \copyright 2012-2015 J. Bakosi,
#            2016-2018 Los Alamos National Security, LLC.,
#            2019-2020 Triad National Security, LLC.
#            All rights reserved. See the LICENSE file for details.
# \brief     Find the RNGSSE2 library
#
################################################################################

# RNGSSE2: http://cpc.cs.qub.ac.uk/summaries/AEIT_v2_0.html
#
#  RNGSSE2_FOUND - System has RNGSSE2
#  RNGSSE2_INCLUDE_DIRS - The RNGSSE2 include directories
#  RNGSSE2_LIBRARIES - The libraries needed to use RNGSSE2
#
#  Set RNGSSE2_ROOT before calling find_package to a path to add an additional
#  search path, e.g.,
#
#  Usage:
#
#  set(RNGSSE2_ROOT "/path/to/custom/rngsse2") # prefer over system
#  find_package(RNGSSE2)
#  ifRNGSSE2_FOUND)
#    target_link_libraries (TARGET ${RNGSSE2_LIBRARIES})
#  endif()

# If already in cache, be silent
if(RNGSSE2_INCLUDE_DIRS AND RNGSSE2_LIBRARIES)
  set (RNGSSE2_FIND_QUIETLY TRUE)
endif()

FIND_PATH(RNGSSE2_INCLUDE_GM19 NAMES gm19.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GM29 NAMES gm29.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GM31 NAMES gm31.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GM55 NAMES gm55.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GM61 NAMES gm61.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GQ58X1 NAMES gq58x1.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GQ58X3 NAMES gq58x3.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_GQ58X4 NAMES gq58x4.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_MT19937 NAMES mt19937.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_LFSR113 NAMES lfsr113.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)
FIND_PATH(RNGSSE2_INCLUDE_MRG32K3A NAMES mrg32k3a.h HINTS ${RNGSSE2_ROOT}/include
                                                  $ENV{RNGSSE2_ROOT}/include)

set(RNGSSE2_INCLUDE_DIRS ${RNGSSE2_INCLUDE_GM19}
                         ${RNGSSE2_INCLUDE_GM29}
                         ${RNGSSE2_INCLUDE_GM31}
                         ${RNGSSE2_INCLUDE_GM55}
                         ${RNGSSE2_INCLUDE_GM61}
                         ${RNGSSE2_INCLUDE_GQ58X1}
                         ${RNGSSE2_INCLUDE_GQ58X3}
                         ${RNGSSE2_INCLUDE_GQ58X4}
                         ${RNGSSE2_INCLUDE_MT19937}
                         ${RNGSSE2_INCLUDE_LFSR113}
                         ${RNGSSE2_INCLUDE_MRG32K3A})

list(REMOVE_DUPLICATES RNGSSE2_INCLUDE_DIRS)

if(NOT BUILD_SHARED_LIBS)
 find_library(RNGSSE2_LIBRARY NAMES librngsse.a HINTS ${RNGSSE2_ROOT}/lib
                                                      $ENV{RNGSSE2_ROOT}/lib)
else()
 find_library(RNGSSE2_LIBRARY NAMES rngsse HINTS ${RNGSSE2_ROOT}/lib
                                                 $ENV{RNGSSE2_ROOT}/lib)
endif()

set(RNGSSE2_LIBRARIES ${RNGSSE2_LIBRARY})

# Handle the QUIETLY and REQUIRED arguments and set RNGSSE2_FOUND to TRUE if
# all listed variables are TRUE.
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(RNGSSE2 DEFAULT_MSG RNGSSE2_LIBRARIES RNGSSE2_INCLUDE_DIRS)

if(NOT RNGSSE2_FOUND)
  set(RNGSSE2_INCLUDE_DIRS "")
  set(RNGSSE2_LIBRARIES "")
endif()

MARK_AS_ADVANCED(RNGSSE2_INCLUDE_DIRS RNGSSE2_LIBRARIES)
