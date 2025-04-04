# Project: Standalone Ruby

![Project Banner](../images/banner.jpg)

- 🔗 **GitHub:** [Project Github Link](https://github.com/ardatetikbey/Standalone-Ruby)
- 🔗 **RubyGems:** [Project RubyGems Link](https://rubygems.org/gems/standalone-ruby)
- 🔗 **Contact:** ardatetikruby@gmail.com

---

## Funktionen

- Es ermöglicht Ihnen, Ihre mit Ruby geschriebenen Projekte auf Windows-Systemen auszuführen, ohne dass eine Ruby-Installation erforderlich ist.

---

## Logik

- Dieses Programm verwendet das Ruby-Interpreterverzeichnis, den Projektordner und den Pfad zur Hauptdatei des Projekts. Es platziert diese Werte entsprechend in einer Starterdatei, optional mit einer VBS- oder BAT-Erweiterung, und kopiert den angegebenen Ruby-Interpreter in das Projektverzeichnis. Wenn die Startdatei ausgeführt wird, öffnet sie die Hauptdatei des Projekts mithilfe des zugehörigen Ruby-Interpreters.

---

## Verwenden

## Installieren:

```bash
gem install standalone-ruby
```

## Beispielbefehl:

```bash
standalone-ruby -p "C:/Users/User/Desktop/PRJCT" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher1.vbs -c 10
```

## Parameter

#### 1. `-p, --project PROJECT_PATH`
- Gibt den Pfad zum Ziel-Ruby-Projekt an. Überprüft, ob der angegebene Projektpfad existiert.

#### 2. `-r, --ruby RUBY_PATH`
- Definiert den Pfad zum Ruby-Interpreter. Überprüft, ob der angegebene Ruby-Pfad existiert und ob er das Verzeichnis „bin“ enthält.

#### 3. `-m, --main MAIN_FILE`
- Gibt den Pfad zur Ruby-Hauptdatei des Projekts an. Überprüft, ob die angegebene Ruby-Datei vorhanden ist.

#### 4. `-l, --launcher LAUNCHER`
- Gibt den Namen der ausführbaren Datei an. Diese Datei kann „.vbs“ oder „.bat“ sein. Überprüft, ob die ausführbare Datei vorhanden ist und vom richtigen Typ ist.

#### 5. `-c, --threads THREADS`
- Gibt die Anzahl der zu verwendenden Threads an. Der Standardwert ist 5. Dieser Parameter gibt die Anzahl der Threads an, die während des Kopiervorgangs des Ruby-Interpreters verwendet werden sollen.

#### 6. `-g, --gui`
- Es sollte in Projekten verwendet werden, die visuelle Schnittstellen beinhalten.

#### 7. `-h, --help`
- Zeigt die Hilfemeldung an.

---

## Anmerkungen

  - Stellen Sie sicher, dass die angegebenen Pfade gültig und von Ihrem System zugänglich sind.  
  - Der Typ der Startdatei muss entweder `.vbs` oder `.bat` für Windows-Systeme sein.  
  - Die Option `threads` kann die Leistung während des Kopiervorgangs erheblich beeinflussen. Verwenden Sie sie daher entsprechend den Fähigkeiten Ihres Systems.
  - Stellen Sie sicher, dass der von Ihnen verwendete Ruby-Interpreter alle Gem-Dateien für das Projekt enthält, das Sie ausführen werden.
  - Weitere Details finden Sie im offiziellen [GitHub-Repository](https://github.com/ardatetikbey/Standalone-Ruby).  

---

## Aufgabenliste
  - Unterstützung für EXE-Paketierung: Sie können Ihre Projekte in einer einzigen EXE-Datei packen.
  - GUI-Oberfläche - Eine einfache grafische Benutzeroberfläche wird entwickelt, um den Benutzern die Durchführung von Aufgaben zu erleichtern.
  - Verschlüsselte Ruby-Ausführung - Ruby-Skripte werden zum Schutz verschlüsselt, und eine Entschlüsselungs- und Ausführungsfunktion wird hinzugefügt.
  - Cross-Platform-Unterstützung - Es wird Unterstützung hinzugefügt, um ähnliche Funktionen auf Linux- und macOS-Systemen bereitzustellen.
  - Konvertieren der in der Projektausgabe erstellten Launcher-Datei zusammen mit den Projektdateien in ein Setup.

---

## Lizenz

- Dieses Projekt ist unter der MIT-Lizenz lizenziert.
