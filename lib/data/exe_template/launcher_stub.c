#include <windows.h>

int main() {
    // VBS dosyasının yolu
    char command[] = "wscript.exe LAUNCHER_FILE";

    // CreateProcess için gerekli yapı
    STARTUPINFO si = {0};
    PROCESS_INFORMATION pi = {0};

    // CreateProcess fonksiyonu ile dış programı başlatıyoruz
    if (CreateProcess(
        NULL,        // Uygulama adı (NULL olduğu için command parametresi kullanılır)
        command,     // Çalıştırılacak komut
        NULL,        // Güvenlik özellikleri
        NULL,        // Güvenlik özellikleri
        FALSE,       // Ebeveynin girdisini paylaşma
        0,           // Çalıştırma bayrakları
        NULL,        // Çevre değişkenleri
        NULL,        // Çalıştırılacak dizin
        &si,         // Başlatma bilgisi
        &pi          // Süreç bilgisi
    )) {
        // Başarılıysa, sürecin tamamlanmasını bekleyelim
        WaitForSingleObject(pi.hProcess, INFINITE);

        // Sürecin bitişiyle ilgili bilgileri temizleyelim
        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
    } else {

    }

    return 0;
}
