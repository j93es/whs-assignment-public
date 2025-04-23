#include <windows.h>
#include <stdio.h>

void copy_to_clipboard(const char *text) {
    const size_t len = strlen(text) + 1;
    HGLOBAL hMem = GlobalAlloc(GMEM_MOVEABLE, len);
    if (!hMem) return;

    memcpy(GlobalLock(hMem), text, len);
    GlobalUnlock(hMem);

    if (OpenClipboard(NULL)) {
        EmptyClipboard();
        SetClipboardData(CF_TEXT, hMem);
        CloseClipboard();
        printf("Copyed\n");
    }
}

void paste_from_clipboard() {
    if (!OpenClipboard(NULL)) {
        return;
    }

    HANDLE hData = GetClipboardData(CF_TEXT);
    if (hData == NULL) {
        CloseClipboard();
        return;
    }

    char *pszText = (char *)GlobalLock(hData);
    if (pszText != NULL) {
        printf("[+] pasted text: %s\n", pszText);
        GlobalUnlock(hData);
    }
    CloseClipboard();
}

int main() {
    char text[100];

    printf("input text (max 99): ");
    scanf("%99s", text);
    
    copy_to_clipboard(text);

    Sleep(1000);

    paste_from_clipboard();

    return 0;
}