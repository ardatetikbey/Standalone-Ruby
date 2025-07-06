# Project: Standalone Ruby

---

## Overview

- Convert your Ruby projects to exe files!
- For a program output example you can take a look at in the [example](https://github.com/ardatetikbey/Standalone-Ruby/tree/main/example) folder.

---

## Installation

```bash
gem install standalone-ruby
```

---

## Parameters

```
Standalone-Ruby - Make Ruby independent!

Usage: standalone-ruby [--help] [--project-path PROJECT_PATH] [--ruby-path RUBY_PATH] [--main-file MAIN_FILE] [--launcher LAUNCHER] [--gui]
                       [--threads THREADS] [--resource-file resource_file] [--gcc] [--version]

Example: standalone-ruby --main-file MAIN_FILE_PATH --project-path PROJECT_PATH

Required Options:
  --project-path PROJECT_PATH
      Target Ruby project path.

  --main-file MAIN_FILE
      Path to the main Ruby file of the project.

Extra Options:
  --ruby RUBY_PATH
      Path to the Ruby interpreter.

  --threads THREADS
      Number of threads to use (default is 5). Determines the number of threads used during the Ruby interpreter
      copy process and for Robocopy operations. A higher number of threads can speed up the process, but requires more system resources.

  --resource-file RESOURCE_FILE
      Resource file (.rc) for the exe file to be created. Only possible with MinGW.

  --help
      Show this help message and exit.

  --version
      Show program version and exit.

  --gcc
      Use GCC compiler for exe file.

  --gui
      This option allows the rubyw.exe file in the bin folder to be used.
      You can choose it for projects that include GUI.

Notes:
  - Make sure that the Ruby interpreter you are using includes all the gems required for the target project.
  - The Ruby interpreter uses Robocopy for copying, and the number of threads given affects the speed of this operation.

For more details, please visit the documentation at:
  https://github.com/ardatetikbey/Standalone-Ruby
```

---

## Usage

### Basic Usage
You can obtain an .exe file with the following command:

```bash
standalone-ruby --project-path C:\Users\ardat\Desktop\example --main-file C:\Users\ardat\Desktop\example\main.rb
```

### Detailed Usage
We will use the GCC compiler in detailed usage. Please make sure that MinGW is installed on your computer.

```bash
standalone-ruby --ruby-path C:\Ruby34-x64 --project-path C:\Users\ardat\Desktop\example --main-file C:\Users\ardat\Desktop\example\main.rb --gcc --resource-file C:\Users\ardat\Desktop\C\program.rc
```

To create a .exe file with a custom icon, you need to use GCC.

Add the value defined by the --resource-file parameter to the top of the .rc file, as in the example:

Example:

```
#include <windows.h>

1 ICON "C:\\Users\\arda\\Desktop\\test.ico"  // Your ICON path

1 VERSIONINFO
 FILEVERSION 1,0,0,0
 PRODUCTVERSION 1,0,0,0
 BEGIN
   BLOCK "StringFileInfo"
   BEGIN
     BLOCK "040904B0"
     BEGIN
       VALUE "CompanyName", "ArdaTetik\0"
       VALUE "FileDescription", "MyProgram\0"
       VALUE "FileVersion", "1.0.0.0\0"
       VALUE "ProductName", "MyProgram\0"
     END
   END
 END

```

---

## Notes

- Make sure that the Ruby interpreter you are using includes all the gem files for the project you will be running.
- Make sure that the provided paths are valid and accessible from your system.
- The `threads` option can significantly impact performance during the copying process, so use it wisely based on your system’s capabilities.
- The location changes of the project directories might prevent the program from working.
- Although it is very rare, some antiviruses can detect the exe files as viruses. This is not my fault,
  you may encounter such results when converting dynamic languages ​​to exe. I have solved most of this problem.

---

## To Do List

- Packaged One-File Exe Support - The output of the exe file will be able to used as a single file.
- CLI Support - Support will be added for the programs that take parametres from the command line.
- Zip Packaging - Zip packaging support will be added to decrease the size of the output.
- Encrypted Ruby Execution - Ruby scripts will be encrypted for protection and will have an option to be decrypted and executed.

---

## License

- This project is licensed under the MIT License.

---
