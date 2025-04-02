# Project: Standalone Ruby

![Project Banner](images/banner.jpg)

- 🔗 **GitHub:** [Project Github Link](https://github.com/ardatetikbey/Standalone-Ruby)
- 🔗 **RubyGems:** [Project RubyGems Link](https://rubygems.org/gems/standalone-ruby)
- 🔗 **Contact:** ardatetikruby@gmail.com

  ![Version](https://img.shields.io/badge/version-1.1-red)

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
  
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Dieses Programm verwendet das Ruby-Interpreterverzeichnis, den Projektordner und den Pfad zur Hauptdatei des Projekts. Es platziert diese Werte entsprechend in einer Starterdatei, optional mit einer VBS- oder BAT-Erweiterung, und kopiert den angegebenen Ruby-Interpreter in das Projektverzeichnis. Wenn die Startdatei ausgeführt wird, öffnet sie die Hauptdatei des Projekts mithilfe des zugehörigen Ruby-Interpreters.

- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> このプログラムは、Ruby インタープリター ディレクトリ、プロジェクト フォルダー、およびプロジェクトのメイン ファイルへのパスを受け取ります。これらの値をスターター ファイル（オプションで VBS または BAT 拡張子）に適切に配置し、指定された Ruby インタープリターをプロジェクト ディレクトリにコピーします。ランチャー ファイルが実行されると、関連付けられた Ruby インタープリターを使用してプロジェクトのメイン ファイルが開きます。

---

## Kullanım / Use / Verwenden / 使用するには

## Install:

```bash
gem install standalone-ruby
```

## Example Command:

```bash
standalone-ruby -p "C:/Users/User/Desktop/PRJCT" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher1.vbs -c 10
```

## Parametreler / Parameters / Parameter / パラメータ

#### 1. `-p, --project PROJECT_PATH`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Hedef Ruby projesinin yolunu belirtir. Verilen proje yolunun varlığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Specifies the target Ruby project path. It checks that the given project path exists.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Gibt den Pfad zum Ziel-Ruby-Projekt an. Überprüft, ob der angegebene Projektpfad existiert.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> ターゲット Ruby プロジェクトへのパスを指定します。指定されたプロジェクト パスが存在するかどうかを確認します。

#### 2. `-r, --ruby RUBY_PATH`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Ruby yorumlayıcısının yolunu tanımlar. Verilen Ruby yolunun varlığını ve içinde 'bin' dizini olup olmadığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Defines the path to the Ruby interpreter. It checks that the given Ruby path exists and contains a 'bin' directory.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Definiert den Pfad zum Ruby-Interpreter. Überprüft, ob der angegebene Ruby-Pfad existiert und ob er das Verzeichnis „bin“ enthält.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> Ruby インタープリターへのパスを定義します。指定された Ruby パスが存在するかどうか、またそこに 'bin' ディレクトリが含まれているかどうかを確認します。

#### 3. `-m, --main MAIN_FILE`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Projenin ana Ruby dosyasının yolunu belirtir. Verilen Ruby dosyasının varlığını kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Provides the path to the main Ruby file of the project. It ensures that the specified Ruby file exists.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Gibt den Pfad zur Ruby-Hauptdatei des Projekts an. Überprüft, ob die angegebene Ruby-Datei vorhanden ist.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> プロジェクトのメイン Ruby ファイルのパスを指定します。指定された Ruby ファイルの存在を確認します。

#### 4. `-l, --launcher LAUNCHER`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Çalıştırıcı dosyasının adını belirtir, bu dosya `.vbs` veya `.bat` formatlarında olabilir. Çalıştırıcı dosyasının varlığını ve uygun türde olduğunu kontrol eder.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Specifies the launcher file name, which can either be `.vbs` or `.bat`. It checks whether the launcher file exists and is of the correct type.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Gibt den Namen der ausführbaren Datei an. Diese Datei kann „.vbs“ oder „.bat“ sein. Überprüft, ob die ausführbare Datei vorhanden ist und vom richtigen Typ ist.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> 実行可能ファイルの名前を指定します。このファイルは `.vbs` または `.bat` にすることができます。実行可能ファイルが存在し、正しいタイプであることを確認します。

#### 5. `-c, --threads THREADS`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Kullanılacak thread sayısını belirtir. Varsayılan değer 5'tir. Bu parametre, Ruby yorumlayıcısının kopyalanma işlemi sırasında kullanılacak thread sayısını belirtir.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Specifies the number of threads to use. The default value is 5. This parameter specifies the number of threads to use during the copy operation of the Ruby interpreter.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Gibt die Anzahl der zu verwendenden Threads an. Der Standardwert ist 5. Dieser Parameter gibt die Anzahl der Threads an, die während des Kopiervorgangs des Ruby-Interpreters verwendet werden sollen.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> 使用するスレッドの数を指定します。デフォルト値は 5 です。このパラメータは、Ruby インタープリタのコピー プロセス中に使用されるスレッドの数を指定します。

#### 6. `-g, --gui`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Görsel arayüz içeren projelerde kullanılmalıdır.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> It should be used in projects that include visual interfaces.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Es sollte in Projekten verwendet werden, die visuelle Schnittstellen beinhalten.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> ビジュアル インターフェースを含むプロジェクトで使用する必要があります。

#### 6. `-h, --help`
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Yardım mesajını görüntüler.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> Displays the help message.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Zeigt die Hilfemeldung an.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> ヘルプメッセージを表示します。

---

## Notlar / Notes / Anmerkungen / ノート

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> **Program Notları**  
  - Sağlanan yolların geçerli ve sisteminizden erişilebilir olduğundan emin olun.  
  - Başlatıcı dosya türü Windows sistemleri için `.vbs` veya `.bat` olmalıdır.  
  - `threads` seçeneği kopyalama sürecinde performansı önemli ölçüde etkileyebilir, bu nedenle sisteminizin kapasitesine göre dikkatli kullanın.
  - Kullandığınız Ruby yorumlayıcısının çalıştıracağınız proje için bütün gem dosyalarını içerdiğinden emin olun.
  - Daha fazla ayrıntı için resmi [GitHub Deposu](https://github.com/ardatetikbey/Standalone-Ruby)'na bakın.  

- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> **Program Notes**  
  - Make sure that the provided paths are valid and accessible from your system.  
  - The launcher file type must be either `.vbs` or `.bat` for Windows systems.  
  - The `threads` option can significantly impact performance during the copying process, so use it wisely based on your system’s capabilities.
  - Make sure that the Ruby interpreter you are using includes all the gem files for the project you will be running.
  - For more details, refer to the official [GitHub Repository](https://github.com/ardatetikbey/Standalone-Ruby).  

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> **Programmanmerkungen**  
  - Stellen Sie sicher, dass die angegebenen Pfade gültig und von Ihrem System zugänglich sind.  
  - Der Typ der Startdatei muss entweder `.vbs` oder `.bat` für Windows-Systeme sein.  
  - Die Option `threads` kann die Leistung während des Kopiervorgangs erheblich beeinflussen. Verwenden Sie sie daher entsprechend den Fähigkeiten Ihres Systems.
  - Stellen Sie sicher, dass der von Ihnen verwendete Ruby-Interpreter alle Gem-Dateien für das Projekt enthält, das Sie ausführen werden.
  - Weitere Details finden Sie im offiziellen [GitHub-Repository](https://github.com/ardatetikbey/Standalone-Ruby).  

- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> **プログラムの注意事項**  
  - 指定されたパスが有効であり、システムからアクセス可能であることを確認してください。  
  - ランチャーファイルの種類は、Windows システムでは `.vbs` または `.bat` である必要があります。  
  - `threads` オプションはコピー処理中のパフォーマンスに大きな影響を与える可能性があるため、システムの能力に応じて適切に使用してください。
  - 使用している Ruby インタープリターに、実行するプロジェクトのすべての gem ファイルが含まれていることを確認してください。
  - 詳細については、公式の [GitHub リポジトリ](https://github.com/ardatetikbey/Standalone-Ruby) を参照してください。
    
---

## Yapılacaklar / To Do List / やるべきこと

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> **Yapılacaklar**  
  - Logger Desteği - Programın çalışmasını ve hata ayıklamayı kolaylaştırmak için loglama mekanizması eklenecek.
  - GUI Arayüzü - Kullanıcıların daha kolay işlem yapabilmesi için basit bir grafik arayüz geliştirilecek.
  - Şifrelenmiş Ruby Çalıştırma - Ruby betiklerini şifreleyerek koruma sağlanacak ve çözüp çalıştırma özelliği eklenecek.
  - Çapraz Platform Desteği - Linux ve macOS sistemlerinde benzer bir çalışma mantığı sunacak destek eklenmesi.
  - Özel Çalıştırıcı Dosya Biçimleri - .vbs ve .bat dışında alternatif çalıştırıcı dosya formatları eklenmesi.
  - Inno Setup EXE Desteği - Proje çıktısında oluşan başlatıcı dosyanın proje dosyalarıyla beraber bir setup haline getirilmesi.  

- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> **To-Do List** 
  - Logger Support - A logging mechanism will be added to facilitate debugging and monitoring the program’s operation.
  - GUI Interface - A simple graphical user interface will be developed to make it easier for users to operate.
  - Encrypted Ruby Execution - Ruby scripts will be encrypted for protection and will have an option to be decrypted and executed.
  - Cross-Platform Support - Support for running on Linux and macOS with similar functionality will be added.
  - Custom Execution File Formats - Alternative execution file formats will be introduced beyond .vbs and .bat.
  - Inno Setup EXE Support - Converting the launcher file created in the project output into a setup along with the project files.

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> **Aufgabenliste**
  - Logger-Unterstützung - Ein Logging-Mechanismus wird hinzugefügt, um die Programmausführung und das Debuggen zu erleichtern.
  - GUI-Oberfläche - Eine einfache grafische Benutzeroberfläche wird entwickelt, um den Benutzern die Durchführung von Aufgaben zu erleichtern.
  - Verschlüsselte Ruby-Ausführung - Ruby-Skripte werden zum Schutz verschlüsselt, und eine Entschlüsselungs- und Ausführungsfunktion wird hinzugefügt.
  - Cross-Platform-Unterstützung - Es wird Unterstützung hinzugefügt, um ähnliche Funktionen auf Linux- und macOS-Systemen bereitzustellen.
  - Benutzerdefinierte Launcher-Dateiformate - Es werden alternative Launcher-Dateiformate hinzugefügt, außer .vbs und .bat.
  - Konvertieren der in der Projektausgabe erstellten Launcher-Datei zusammen mit den Projektdateien in ein Setup.
  
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> **やることリスト**
  - ロガーサポート - プログラムの実行とデバッグを容易にするためにロギングメカニズムが追加されます。
  - GUIインターフェース - ユーザーがより簡単に作業を行えるようにシンプルなグラフィカルインターフェースが開発されます。
  - 暗号化されたRuby実行 - Rubyスクリプトが保護のために暗号化され、復号化して実行する機能が追加されます。
  - クロスプラットフォームサポート - LinuxおよびmacOSシステムで同様の機能が提供されるサポートが追加されます。
  - カスタムランチャーファイル形式 - .vbsおよび.bat以外の代替ランチャーファイル形式が追加されます。
  - プロジェクト出力で作成されたランチャー ファイルをプロジェクト ファイルとともにセットアップに変換します。
    
---

## Lisans / License / Lizenz / ライセンス

- <img src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg" width="20"/> Bu proje MIT Lisansı altında lisanslanmıştır.
- <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="20"/> This project is licensed under the MIT License.
- <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg" width="20"/> Dieses Projekt ist unter der MIT-Lizenz lizenziert.
- <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" width="20"/> このプロジェクトはMITライセンスの下でライセンスされています。
