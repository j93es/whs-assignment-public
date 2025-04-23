const clipboardAPIs = [
  "OpenClipboard",
  "CloseClipboard",
  "EmptyClipboard",
  "SetClipboardData",
  "GetClipboardData",
];

clipboardAPIs.forEach(function (api) {
  try {
    const addr = Module.getExportByName("user32.dll", api);
    Interceptor.attach(addr, {
      onEnter: function (args) {
        console.log("[*] " + api + " called");
        if (api === "SetClipboardData") {
          console.log("    → Format: " + args[0]);
          console.log("    → hMem  : " + args[1]);
        }
        if (api === "GetClipboardData") {
          console.log("    → Format: " + args[0]);
        }
      },
    });
  } catch (err) {
    console.log("[-] Failed to hook " + api + ": " + err);
  }
});
