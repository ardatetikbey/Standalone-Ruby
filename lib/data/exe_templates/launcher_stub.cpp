#include <windows.h>
#include <iostream>

int main() {
    const char* command = "wscript.exe LAUNCHER_FILE";

    STARTUPINFO si = {0};
    PROCESS_INFORMATION pi = {0};

    if (CreateProcess(
        NULL,
        const_cast<LPSTR>(command),
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
        std::cerr << "CreateProcess failed with error code: " << GetLastError() << std::endl;
    }

    return 0;
}
