# Project: Standalone Ruby

![Project Banner](images/banner.jpg)

Project owner: Arda Tetik

- 🔗 **GitHub:** [Project Github Link](https://github.com/ardatetikbey/Standalone-Ruby)
- 🔗 **RubyGems:** [Project RubyGems Link](https://rubygems.org/gems/standalone-ruby)
- 🔗 **Contact:** ardatetikruby@gmail.com

![Language](https://img.shields.io/badge/language-Ruby-red) ![Version](https://img.shields.io/badge/version-1.3-red) ![Supported Platforms](https://img.shields.io/badge/platform-windows-blue) ![Status](https://img.shields.io/badge/status-in%20progress-yellow)

---
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> [Türkçe döküman](documents/turkish.md)
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>  [Deutsches Dokument](documents/deutsch.md)
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> [日本語文書](documents/japanese.md)

---

## Features

- It allows you to run your projects written with Ruby on Windows systems without the need for a Ruby installation.

---

## Logic

- This program takes the Ruby interpreter directory, the project folder, and the path to the project's main file. It places these values ​​appropriately in a starter file, optionally with a VBS or BAT extension, and copies the specified Ruby interpreter to the project directory. When the starter file is run, it opens the project's main file using the corresponding Ruby interpreter.

- You can look at sample folder.
  
---

## Use

## Install:

```bash
gem install standalone-ruby
```

## Example Command:

```bash
standalone-ruby -p "C:/Users/User/Desktop/PRJCT" -e launcher.exe -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher1.vbs -c 10
```

## Parameters

#### 1. `-p, --project PROJECT_PATH`
- Specifies the target Ruby project path. It checks if the given project path exists.

#### 2. `-r, --ruby RUBY_PATH`
- Designates the path to the Ruby interpreter. It checks if the given Ruby path exists and contains a 'bin' directory.

#### 3. `-m, --main MAIN_FILE`
- Designates the path of the projects main Ruby file. It checks if the specified Ruby file exists.

#### 4. `-l, --launcher LAUNCHER`
- Specifies the launcher file name, which can either be `.vbs` or `.bat`. It checks whether the launcher file exists and is of the correct type.

#### 5. `-c, --threads THREADS`
- Specifies the number of threads to use. The default value is 5. This parameter specifies the number of threads to use during the copying process of the Ruby interpreter.

#### 6. `-g, --gui`
- It should be used in projects that include visual interfaces.

#### 7. `-h, --help`
- Displays the help message.

---

## Notes

  - Make sure that the provided paths are valid and accessible from your system.  
  - The launcher file type must be either `.vbs` or `.bat` for Windows systems.  
  - The `threads` option can significantly impact performance during the copying process, so use it wisely based on your system’s capabilities.
  - Make sure that the Ruby interpreter you are using includes all the gem files for the project you will be running.
  - For more details, refer to the official [GitHub Repository](https://github.com/ardatetikbey/Standalone-Ruby).  

---

## To Do List
  - Exe Packaging Support: It will allow you to package your projects in a single exe file.
  - GUI Interface - A simple graphical user interface will be added to make it easier for users to operate.
  - Encrypted Ruby Execution - Ruby scripts will be encrypted for protection and will have an option to be decrypted and executed.
  - Cross-Platform Support - Support for running on Linux and macOS with similar functionality will be added.
  - Inno Setup EXE Support - Converting the launcher file created in the project output into a setup with the project files.

---

## License

- This project is licensed under the MIT License.

---

## Document Translator
- TrueHalo aka Ahmet Bahadır Bakır 
- Email: truesthalo@gmail.com
- Github: https://github.com/TrueHalo
