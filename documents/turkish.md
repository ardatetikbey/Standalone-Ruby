# Project: Standalone Ruby

![Project Banner](images/banner.jpg)

- 🔗 **GitHub:** [Project Github Link](https://github.com/ardatetikbey/Standalone-Ruby)
- 🔗 **RubyGems:** [Project RubyGems Link](https://rubygems.org/gems/standalone-ruby)
- 🔗 **Contact:** ardatetikruby@gmail.com

![Language](https://img.shields.io/badge/language-Ruby-red) ![Version](https://img.shields.io/badge/version-1.1-red) ![Supported Platforms](https://img.shields.io/badge/platform-windows-blue) ![Status](https://img.shields.io/badge/status-in%20progress-yellow)

---

## Özellikler

- Windows sistemlerde Ruby kurulumuna ihtiyaç duymadan Ruby ile yazdığınız projelerinizi çalıştırabilmenize olanak sağlar.

---

## Program Mantığı

- Bu program, Ruby yorumlayıcısının dizinini, proje klasörünü ve projenin ana dosyasının yolunu alır. Bu değerleri, seçime bağlı olarak VBS veya BAT uzantılı başlatıcı dosyanın içine uygun şekilde yerleştirir ve belirtilen Ruby yorumlayıcısını proje dizinine kopyalar. Başlatıcı dosya çalıştırıldığında, ilgili Ruby yorumlayıcısını kullanarak projenin ana dosyasını açar.
  
---

## Kullanım

## Kurulum:

```bash
gem install standalone-ruby
```

## Örnek Kullanım:

```bash
standalone-ruby -p "C:/Users/User/Desktop/PRJCT" -r "C:/Users/User/Documents/Ruby34-x64" -m "C:/Users/User/Desktop/myproject/main.rb" -l launcher1.vbs -c 10
```

## Parametreler

#### 1. `-p, --project PROJECT_PATH`
- Hedef Ruby projesinin yolunu belirtir. Verilen proje yolunun varlığını kontrol eder.

#### 2. `-r, --ruby RUBY_PATH`
- Ruby yorumlayıcısının yolunu tanımlar. Verilen Ruby yolunun varlığını ve içinde 'bin' dizini olup olmadığını kontrol eder.

#### 3. `-m, --main MAIN_FILE`
- Projenin ana Ruby dosyasının yolunu belirtir. Verilen Ruby dosyasının varlığını kontrol eder.

#### 4. `-l, --launcher LAUNCHER`
- Çalıştırıcı dosyasının adını belirtir, bu dosya `.vbs` veya `.bat` formatlarında olabilir. Çalıştırıcı dosyasının varlığını ve uygun türde olduğunu kontrol eder.

#### 5. `-c, --threads THREADS`
- Kullanılacak thread sayısını belirtir. Varsayılan değer 5'tir. Bu parametre, Ruby yorumlayıcısının kopyalanma işlemi sırasında kullanılacak thread sayısını belirtir.

#### 6. `-g, --gui`
- Görsel arayüz içeren projelerde kullanılmalıdır.

#### 7. `-h, --help`
- Yardım mesajını görüntüler.

---

## Notlar

  - Sağlanan yolların geçerli ve sisteminizden erişilebilir olduğundan emin olun.  
  - Başlatıcı dosya türü Windows sistemleri için `.vbs` veya `.bat` olmalıdır.  
  - `threads` seçeneği kopyalama sürecinde performansı önemli ölçüde etkileyebilir, bu nedenle sisteminizin kapasitesine göre dikkatli kullanın.
  - Kullandığınız Ruby yorumlayıcısının çalıştıracağınız proje için bütün gem dosyalarını içerdiğinden emin olun.
  - Daha fazla ayrıntı için resmi [GitHub Deposu](https://github.com/ardatetikbey/Standalone-Ruby)'na bakın.  


---

## Yapılacaklar Listesi
 
  - Logger Desteği - Programın çalışmasını ve hata ayıklamayı kolaylaştırmak için loglama mekanizması eklenecek.
  - GUI Arayüzü - Kullanıcıların daha kolay işlem yapabilmesi için basit bir grafik arayüz geliştirilecek.
  - Şifrelenmiş Ruby Çalıştırma - Ruby betiklerini şifreleyerek koruma sağlanacak ve çözüp çalıştırma özelliği eklenecek.
  - Çapraz Platform Desteği - Linux ve macOS sistemlerinde benzer bir çalışma mantığı sunacak destek eklenmesi.
  - Özel Çalıştırıcı Dosya Biçimleri - .vbs ve .bat dışında alternatif çalıştırıcı dosya formatları eklenmesi.
  - Inno Setup EXE Desteği - Proje çıktısında oluşan başlatıcı dosyanın proje dosyalarıyla beraber bir setup haline getirilmesi.  


---

## Lisans

- Bu proje MIT Lisansı altında lisanslanmıştır.

