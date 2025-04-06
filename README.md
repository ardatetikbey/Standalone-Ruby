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

## Logic

- This program takes the Ruby interpreter directory, the project folder, and the path to the project's main file. The project uses the Ruby interpreter to create an exe file that opens the main project file.
- For a program output example you can take a look at the screenshots in the sample folder.
  
---

## Use

## Install:

```bash
gem install standalone-ruby
```

## Example Command:

Console Projects:

```bash
standalone-ruby -p "C:/Users/User/Desktop/project" -e "launcher.exe" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher.exe -c 5
```

GUI Projects:

```bash
standalone-ruby -p "C:/Users/User/Desktop/project" -e "launcher.exe" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher.exe -c 5 --gui
```

## Parameters

#### 1. `-p, --project PROJECT_PATH`
- Specifies the target Ruby project path. It checks if the given project path exists.

#### 2. `-r, --ruby RUBY_PATH`
- Designates the path to the Ruby interpreter. It checks if the given Ruby path exists and contains a 'bin' directory.

#### 3. `-m, --main MAIN_FILE`
- Designates the path of the projects main Ruby file. It checks if the specified Ruby file exists.

#### 4. `-e, --exe EXE`
- Specifies the name of the exe file thats going to be created.

#### 5. `-l, --launcher LAUNCHER`
- Denfines the launcher file that the exe file will use to start the project. Using VBS is recommended.

#### 6. `-c, --threads THREADS`
- Specifies the number of threads to use. The default value is 5. This parameter specifies the number of threads to use during the copying process of the Ruby interpreter.

#### 7. `-g, --gui`
- It should be used in projects that include visual interfaces.

#### 8. `-h, --help`
- Displays the help message.

### 9. `--gcc`
- It uses GCC when creating an exe file. Make sure that GCC is installed on your computer. If GCC is not installed, it uses the TCC that is built into it.
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
