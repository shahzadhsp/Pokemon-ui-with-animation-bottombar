@echo off
"C:\\Users\\HP\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\groovy" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=24" ^
  "-DANDROID_PLATFORM=android-24" ^
  "-DANDROID_ABI=armeabi-v7a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a" ^
  "-DANDROID_NDK=C:\\Users\\HP\\AppData\\Local\\Android\\sdk\\ndk\\27.0.12077973" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\HP\\AppData\\Local\\Android\\sdk\\ndk\\27.0.12077973" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\HP\\AppData\\Local\\Android\\sdk\\ndk\\27.0.12077973\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\HP\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\New folder\\pokemon_ui\\android\\app\\build\\intermediates\\cxx\\Debug\\66603i66\\obj\\armeabi-v7a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\New folder\\pokemon_ui\\android\\app\\build\\intermediates\\cxx\\Debug\\66603i66\\obj\\armeabi-v7a" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BD:\\New folder\\pokemon_ui\\android\\app\\.cxx\\Debug\\66603i66\\armeabi-v7a" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli
