# Purpose of this file:
I write all my commonly faced problems here, so that when I eventually encounter these problems again, I can come here and just figure out the solution


## CUDA Related

- ### error: parameter packs not expanded with ‘...’:
    So for this one, the issue is that the NVCC compiler goes through with trying to compile everything by itself, including the C++ part of the code, which may not be properly fleshed out in the Clang backend it uses or something. Also, it may be a problem with the implementation of parameter expansion introduced after C++ 11 Standard in G++-11, so it completely messes up there. The solution is to first tell NVCC to not compile the C++ part by itself, and secondly to use g++-10 instead of 11, which does not face this issue. In cmake, you can do this by simply adding:

  ```cmake
  target_compile_options(<Target Name> PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-x=cu -ccbin=g++-10>)
  ```

  **Note**: You'll have to seperately install gcc-10 and g++-10 for this to work!


  ## CMake Related

  - ### Installing the latest version of CMake:
    So, by default, Ubuntu installs an old version of cmake, which may not be compatible with things like DPC++ etc.
    To solve this, follow this guide:
            ```https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line```
