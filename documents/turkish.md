# Project: Standalone Ruby

![Project Banner](../images/banner.jpg)

- 🔗 **GitHub:** [Project Github Link](https://github.com/ardatetikbey/Standalone-Ruby)
- 🔗 **RubyGems:** [Project RubyGems Link](https://rubygems.org/gems/standalone-ruby)
- 🔗 **Contact:** ardatetikruby@gmail.com

---

## Program Mantığı

- Bu program, Ruby yorumlayıcısının dizinini, proje klasörünü ve projenin ana dosyasının yolunu alır. Proje içerisine bu Ruby yorumlayıcısını kullanarak ana proje dosyasını açan bir exe dosyası oluşturur.
- Örnek program çıktısı için sample klasöründe bulunan ekran resimlerine bakabilirsiniz.
---

## Kullanım

## Kurulum:

```bash
gem install standalone-ruby
```

## Örnek Kullanım:

```bash
standalone-ruby -p "C:/Users/User/Desktop/project" -e "launcher.exe" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher.exe -c 5
```

```bash
standalone-ruby -p "C:/Users/User/Desktop/project" -e "launcher.exe" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher.exe -c 5 --gui
```

## Parametreler

#### 1. `-p, --project PROJECT_PATH`
- Hedef Ruby projesinin yolunu belirtir. Verilen proje yolunun varlığını kontrol eder.

#### 2. `-r, --ruby RUBY_PATH`
- Ruby yorumlayıcısının yolunu tanımlar. Verilen Ruby yolunun varlığını ve içinde 'bin' dizini olup olmadığını kontrol eder.

#### 3. `-m, --main MAIN_FILE`
- Projenin ana Ruby dosyasının yolunu belirtir. Verilen Ruby dosyasının varlığını kontrol eder.

#### 4. `-e, --exe EXE_FILE`
-  Oluşturulacak exe dosyasının ismini belirler.

#### 4. `-l, --launcher LAUNCHER`
-  Exe dosyasının projeyi başlatmak için kullanacağı başlatıcı dosyayı tanımlar. VBS kullanılması önerilir.

#### 6. `-c, --threads THREADS`
- Kullanılacak thread sayısını belirtir. Varsayılan değer 5'tir. Bu parametre, Ruby yorumlayıcısının kopyalanma işlemi sırasında kullanılacak thread sayısını belirtir.

#### 7. `-g, --gui`
- Görsel arayüz içeren projelerde kullanılmalıdır.

#### 8. `-h, --help`
- Yardım mesajını görüntüler.

---

## Notlar
  - Sağlanan yolların geçerli ve sisteminizden erişilebilir olduğundan emin olun.  
  - `threads` seçeneği kopyalama sürecinde performansı önemli ölçüde etkileyebilir, bu nedenle sisteminizin kapasitesine göre dikkatli kullanın.
  - Kullandığınız Ruby yorumlayıcısının çalıştıracağınız proje için bütün gem dosyalarını içerdiğinden emin olun.
  - Daha fazla ayrıntı için resmi [GitHub Deposu](https://github.com/ardatetikbey/Standalone-Ruby)'na bakın.
  - Proje dizininde yapılacak konum değişiklikleri programın çalışmasını etkileyebilir.

---

## Yapılacaklar Listesi
  - Tek Exe Dosyası - Çıktı olarak alınan exe dosyası tek bir dosya olarak kullanılabilecek.
  - CLI Desteği - Konut satırı üzerinden parametre alan programlar için destek eklenecek.
  - Zip Paketleme - Çıktı boyutunun azaltılması için dosya sıkıştırma desteği eklenecek.
  - Şifrelenmiş Ruby Çalıştırma - Ruby betiklerini şifreleyerek koruma sağlanacak ve çözüp çalıştırma özelliği eklenecek.


---

## Lisans

- Bu proje MIT Lisansı altında lisanslanmıştır.