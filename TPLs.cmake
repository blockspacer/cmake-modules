# Find third-party libraries

# Add TPL_DIR/include to modules directory for TPLs that provide cmake
# FIND_PACKAGE code, such as Trilinos
SET(CMAKE_PREFIX_PATH ${TPL_DIR} ${CMAKE_PREFIX_PATH})

#### MKL (optional)
find_library(MKL_INTERFACE_LIBRARY
             NAMES mkl_intel_ilp64
             PATHS $ENV{MKLROOT}/lib/intel64
                   $ENV{INTEL}/mkl/lib/intel64
             NO_DEFAULT_PATH)

find_library(MKL_SEQUENTIAL_LAYER_LIBRARY
             NAMES mkl_sequential
             PATHS $ENV{MKLROOT}/lib/intel64
                   $ENV{INTEL}/mkl/lib/intel64
             NO_DEFAULT_PATH)

#find_library(MKL_THREADED_LAYER_LIBRARY
#             NAMES mkl_intel_thread
#             PATHS $ENV{MKLROOT}/lib/intel64
#                   $ENV{INTEL}/mkl/lib/intel64
#             NO_DEFAULT_PATH)

find_library(MKL_CORE_LIBRARY
             NAMES mkl_core
             PATHS $ENV{MKLROOT}/lib/intel64
                   $ENV{INTEL}/mkl/lib/intel64
             NO_DEFAULT_PATH)

find_path(MKL_INCLUDE_PATH mkl.h
          $ENV{MKLROOT}/include
          $ENV{INTEL}/mkl/include
          NO_DEFAULT_PATH)

if (MKL_INTERFACE_LIBRARY AND
    MKL_SEQUENTIAL_LAYER_LIBRARY AND
    #MKL_THREADED_LAYER_LIBRARY AND
    MKL_CORE_LIBRARY)
  message(STATUS "Found MKL:")
  message(STATUS " * MKL_INTERFACE_LIBRARY: ${MKL_INTERFACE_LIBRARY}")
  message(STATUS " * MKL_SEQUENTIAL_LAYER_LIBRARY: ${MKL_SEQUENTIAL_LAYER_LIBRARY}")
  #message(STATUS " * MKL_THREADED_LAYER_LIBRARY: ${MKL_THREADED_LAYER_LIBRARY}")
  message(STATUS " * MKL_CORE_LIBRARY: ${MKL_CORE_LIBRARY}")
  set(HAS_MKL on)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DMKL_ILP64 -m64")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DMKL_ILP64 -m64")
else()
  message(WARNING "MKL NOT found: Intel MKL VSL RNGs will not be available")
  set(MKL_INTERFACE_LIBRARY "")
  set(MKL_SEQUENTIAL_LAYER_LIBRARY "")
  #set(MKL_THREADED_LAYER_LIBRARY "")
  set(MKL_CORE_LIBRARY "")
  set(HAS_MKL off)
endif()

#### TPLs we attempt to find on the system #####################################

#### Boost
if(NOT NO_SYSTEM_BOOST)
  set(BOOST_INCLUDEDIR ${TPL_DIR}/include) # prefer ours
  find_package(Boost REQUIRED)
endif()
if(Boost_FOUND)
  message(STATUS "Boost at ${Boost_INCLUDE_DIR} (include)")
  include_directories(${Boost_INCLUDE_DIR})
endif()

#### PStreams
set(PSTREAMS_ROOT ${TPL_DIR}) # prefer ours
find_package(PStreams REQUIRED)

#### Hypre
set(HYPRE_ROOT ${TPL_DIR}) # prefer ours
find_package(Hypre REQUIRED)

#### PugiXML
set(PUGIXML_ROOT ${TPL_DIR}) # prefer ours
find_package(pugixml REQUIRED)

#### BLAS/LAPACK library with LAPACKE C-interface
if (HAS_MKL)    # prefer Intel's MKL's BLAS/LAPACK if MKL is available
  message(STATUS "Found BLAS/LAPACK: ${MKL_INTERFACE_LIBRARY};${MKL_CORE_LIBRARY};${MKL_SEQUENTIAL_LAYER_LIBRARY} using via MKL's C-interface")
else()
  find_package(LAPACK REQUIRED)
  if(LAPACK_FOUND)
    # find C-interface
    find_path(LAPACKE_PATH lapacke.h DOC "C-interface to LAPACK")
    find_library(LAPACKE_LIB NAMES lapacke REQUIRED)
    message(STATUS "Found BLAS/LAPACK: ${LAPACK_LIBRARIES} using via C-interface ${LAPACKE_PATH}/lapacke.h and ${LAPACKE_LIB}")
  endif()
endif()

#### TPLs we always want ours ##################################################

#### Zoltan2 library
find_package(Zoltan2 REQUIRED)
if(Zoltan2_FOUND)
  message(STATUS "Found Zoltan2: ${Zoltan2_LIBRARY_DIRS}")
endif()

#### ExodusII library
find_package(SEACASExodus REQUIRED)
if(SEACASExodus_FOUND)
  message(STATUS "Found SEACASExodus: ${SEACASExodus_LIBRARY_DIRS}")
endif()
find_package(SEACASNemesis REQUIRED)
if(SEACASNemesis_FOUND)
  message(STATUS "Found SEACASNemesis: ${SEACASNemesis_LIBRARY_DIRS}")
endif()
find_package(SEACASExodiff REQUIRED)
if(SEACASExodiff_FOUND)
  message(STATUS "Found SEACASExodiff: ${SEACASExodiff_LIBRARY_DIRS}")
endif()

#### RNGSSE2 library
set(RNGSSE_LIBRARY "NOTFOUND")
find_library(RNGSSE_LIBRARY
             NAMES rngsse
             PATHS ${TPL_DIR}/lib
             NO_DEFAULT_PATH
             REQUIRED)

#### TestU01 library
set(TESTU01_LIBRARY "NOTFOUND")
find_library(TESTU01_LIBRARY
             NAMES testu01
             PATHS ${TPL_DIR}/lib
             NO_DEFAULT_PATH
             REQUIRED)
set(TESTU01_PROBDIST_LIBRARY "NOTFOUND")
find_library(TESTU01_PROBDIST_LIBRARY
             NAMES probdist
             PATHS ${TPL_DIR}/lib
             NO_DEFAULT_PATH
             REQUIRED)
set(TESTU01_MYLIB_LIBRARY "NOTFOUND")
find_library(TESTU01_MYLIB_LIBRARY
             NAMES mylib
             PATHS ${TPL_DIR}/lib
             NO_DEFAULT_PATH
             REQUIRED)
