const apiNames = [
  "SendMessageW",
  "PostMessageW",
  "DispatchMessageW",
  "GetMessageW",
  "PeekMessageW",
  "SetClipboardData",
  "GetClipboardData",
  "TranslateMessage",
];

function getMessageName(msg) {
  const id = msg.toInt32();
  const messageMap = {
    0x0111: "WM_COMMAND",
    0x0282: "WM_IME_CHAR",
    0x0401: "SCI_GETTEXT",
    0x07d3: "SCI_INSERTTEXT",
    0x0882: "SCI_COPY",
    0x0883: "SCI_PASTE",
    0x0885: "SCI_SETTEXT",
    0x1389: "SC_CP_UTF8",
  };

  return messageMap[id] || null; // "UNKNOWN (0x" + id.toString(16) + ")";
}

apiNames.forEach(function (name) {
  try {
    const addr = Module.getExportByName("user32.dll", name);
    Interceptor.attach(addr, {
      onEnter: function (args) {
        const hwnd = args[0];
        const msg = args[1];
        const msgName = getMessageName(msg);
        if (msgName == null) return;

        const wParam = args[2];
        const lParam = args[3];
        console.log("[*] " + name + " called");
        console.log("    HWND:    " + hwnd);
        console.log("    Msg:     " + msg + " (" + msgName + ")");
        console.log("    wParam:  " + wParam);
        console.log("    lParam:  " + lParam);
      },
    });
  } catch (e) {
    console.log("[-] Could not hook " + name + ": " + e);
  }
});
