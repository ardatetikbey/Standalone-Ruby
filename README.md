# Project: Standalone Ruby

![Project Banner](images/banner.jpg)

---

## Özellikler / Features / Funktionen / 機能

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Windows sistemlerde Ruby kurulumuna ihtiyaç duymadan Ruby ile yazdığınız projelerinizi çalıştırabilmenize olanak sağlar.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> It allows you to run your projects written with Ruby on Windows systems without the need for a Ruby installation.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Es ermöglicht Ihnen, Ihre mit Ruby geschriebenen Projekte auf Windows-Systemen auszuführen, ohne dass eine Ruby-Installation erforderlich ist.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> これにより、Ruby をインストールしなくても、Windows システム上で Ruby で記述されたプロジェクトを実行できるようになります。

---

## Program Mantığı / Logic / Logik / 論理

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Bu program, Ruby yorumlayıcısının dizinini, proje klasörünü ve projenin ana dosyasının yolunu alır. Bu değerleri, seçime bağlı olarak VBS veya BAT uzantılı başlatıcı dosyanın içine uygun şekilde yerleştirir ve belirtilen Ruby yorumlayıcısını proje dizinine kopyalar. Başlatıcı dosya çalıştırıldığında, ilgili Ruby yorumlayıcısını kullanarak projenin ana dosyasını açar.
  
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/>This program takes the Ruby interpreter directory, the project folder, and the path to the project's main file. It places these values ​​appropriately in a starter file, optionally with a VBS or BAT extension, and copies the specified Ruby interpreter to the project directory. When the starter file is run, it opens the project's main file using the corresponding Ruby interpreter.
  
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Dieses Programm übernimmt das Ruby-Interpreterverzeichnis, den Projektordner und den Pfad zur Hauptdatei des Projekts. Es platziert diese Werte entsprechend in einer Starterdatei, optional mit einer VBS- oder BAT-Erweiterung, und kopiert den angegebenen Ruby-Interpreter in das Projektverzeichnis. Wenn die Startdatei ausgeführt wird, öffnet sie die Hauptdatei des Projekts mithilfe des zugehörigen Ruby-Interpreters.

- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> このプログラムは、Ruby インタープリター ディレクトリ、プロジェクト フォルダー、およびプロジェクトのメイン ファイルへのパスを受け取ります。これらの値をスターター ファイル（オプションで VBS または BAT 拡張子）に適切に配置し、指定された Ruby インタープリターをプロジェクト ディレクトリにコピーします。ランチャー ファイルが実行されると、関連付けられた Ruby インタープリターを使用してプロジェクトのメイン ファイルが開きます。

---

## Kullanım / Use / Verwenden / 使用するには

## Example Command:

```bash
ruby .\main.rb -p "C:/Users/User/Desktop/PRJCT" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher1.vbs -c 10
```

## Parameters

### 1. `-p, --project PROJECT_PATH`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Hedef Ruby proje yolunu belirtir. Verilen proje yolunun varlığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Specifies the target Ruby project path. It checks that the given project path exists.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

### 2. `-r, --ruby RUBY_PATH`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Ruby yorumlayıcısının yolunu tanımlar. Verilen Ruby yolunun varlığını ve içinde 'bin' dizini olup olmadığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Defines the path to the Ruby interpreter. It checks that the given Ruby path exists and contains a 'bin' directory.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

### 3. `-m, --main MAIN_FILE`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Projenin ana Ruby dosyasının yolunu belirtir. Verilen Ruby dosyasının varlığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Provides the path to the main Ruby file of the project. It ensures that the specified Ruby file exists.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

### 4. `-l, --launcher LAUNCHER`
- **English**: Specifies the launcher file name, which can either be `.vbs` or `.bat`. It ensures the launcher file exists and is of the correct type.
- **Turkish**: Çalıştırıcı dosyasının adını belirtir, bu dosya `.vbs` veya `.bat` olabilir. Çalıştırıcı dosyasının varlığını ve doğru türde olduğunu kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

### 5. `-c, --threads THREADS`
- **English**: Defines the number of threads to use. The default is 5. This parameter controls the number of threads used during the Ruby interpreter copy process and Rubocopy operations.
- **Turkish**: Kullanılacak thread sayısını belirtir. Varsayılan değer 5'tir. Bu parametre, Ruby yorumlayıcısının kopyalanma işlemi ve Rubocopy işlemleri sırasında kullanılacak thread sayısını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

### 6. `-h, --help`
- **English**: Displays the help message.
- **Turkish**: Yardım mesajını görüntüler.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/>
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/>

---

## Notes

- Make sure that the provided paths are valid and accessible from your system.
- The launcher file type must be either `.vbs` or `.bat` for Windows systems.
- The `threads` option can significantly impact the performance during the copying process, so use it wisely based on your system’s capabilities.
- For more details, refer to the official [GitHub Repository](https://github.com/ardatetikbey/Standalone-Ruby).

---

## Lisans / License / Lizenz / ライセンス

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Bu proje MIT Lisansı altında lisanslanmıştır.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> This project is licensed under the MIT License.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Dieses Projekt ist unter der MIT-Lizenz lizenziert.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> このプロジェクトはMITライセンスの下でライセンスされています。

🔗 **GitHub:** [Project Standalone-Ruby](https://github.com/ardatetikbey/Standalone-Ruby)
