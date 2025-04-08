# Project: Standalone Ruby

---

## Overview

- This program takes the Ruby interpreter directory, the project folder, and the path to the project's main file. The project uses the Ruby interpreter to create an exe file that opens the main project file.
- For a program output example you can take a look at in the example folder.
  
---

## Installation

```bash
gem install standalone-ruby
```

---

## Parameters

```
C:\Users\ardat>standalone-ruby -h
Standalone-Ruby v1.4.2 - Package your Ruby projects as exe!

Usage: standalone-ruby [-h] [-p PROJECT_PATH] [-r RUBY_PATH] [-m MAIN_FILE] [-l LAUNCHER] [-t TEMPLATE] [-e EXE_FILE] [-c THREADS] [-g] [-v]

Options:
  -p, --project PROJECT_PATH  Target Ruby project path.
      Ensures that the given project path exists. If not, an error is displayed.

  -r, --ruby RUBY_PATH        Path to the Ruby interpreter.
      Ensures that the given Ruby path exists and contains a 'bin' directory.

  -m, --main MAIN_FILE        Path to the main Ruby file of the project.
      Ensures that the specified Ruby file exists.

  -l, --launcher LAUNCHER     Launcher file name (either .vbs or .bat-cmd).
      Ensure the launcher file exists and is of the correct type (either .vbs or .bat-cmd).

  -t, --template TEMPLATE     Template file for launcher.
      Ensures that the specified template file exists.

  -e, --exe EXE_FILE           Name of the exe file to be used for output

  -c, --threads THREADS       Number of threads to use (default is 5).
      Determines the number of threads used during the Ruby interpreter copy process and for Rubocopy operations.
      A higher number of threads can speed up the process, but requires more system resources.

  -g, --gui                   This option allows the rubyw.exe file in the bin folder to be used.
      You can choose it for projects that include GUI.

  -h, --help                  Show this help message.

  -v, --version               Show program version.

Notes:
  - Make sure that the Ruby interpreter you are using includes all the gems required for the target project.
  - The Ruby interpreter uses Robocopy for copying, and the number of threads given affects the speed of this operation.

For more details, please visit the documentation at:
  https://github.com/ardatetikbey/Standalone-Ruby
```

---

## Examples

```bash
standalone-ruby -p "C:/Users/ardatetik/Desktop/project" -e "launcher.exe" -r "C:/Users/ardatetik/Documents/Ruby34-x64" -m "C:/Users/ardatetik/Desktop/myproject/main.rb" -l launcher1.exe -c 7 --gcc
standalone-ruby -p "C:/Users/ardatetik/Desktop/project" -e "launcher.exe" -r "C:/Users/ardatetik/Documents/Ruby34-x64" -m "C:/Users/ardatetik/Desktop/myproject/main.rb" -l launcher2.exe -c 8 --gui
```
  
---

## Notes

  - Make sure that the provided paths are valid and accessible from your system.  
  - The `threads` option can significantly impact performance during the copying process, so use it wisely based on your system’s capabilities.
  - Make sure that the Ruby interpreter you are using includes all the gem files for the project you will be running.
  - For more details, refer to the official [GitHub Repository](https://github.com/ardatetikbey/Standalone-Ruby).  
  - The location changes of the project directories might prevent the program from working.

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

## Document Translator
- TrueHalo aka Ahmet Bahadır Bakır
- Email: truesthalo@gmail.com
- Github: https://github.com/TrueHalo
