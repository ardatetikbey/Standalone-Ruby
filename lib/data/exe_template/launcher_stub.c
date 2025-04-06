#include <windows.h>

int main() {
    char command[] = "wscript.exe LAUNCHER_FILE";

    STARTUPINFO si = {0};
    PROCESS_INFORMATION pi = {0};

    if (CreateProcess(
        NULL,
        command,
        NULL,
        NULL,
        FALSE,
        0,
        NULL,
        NULL,
        &si,
        &pi
    )) {
        WaitForSingleObject(pi.hProcess, INFINITE);

        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
    } else {

    }

    return 0;
}
