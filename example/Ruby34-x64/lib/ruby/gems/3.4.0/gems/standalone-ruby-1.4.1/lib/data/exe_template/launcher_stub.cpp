#include <iostream>
#include <cstdlib>

int main() {
    const char* command = "wscript.exe LAUNCHER_FILE";

    int result = system(command);
    return 0;
}
