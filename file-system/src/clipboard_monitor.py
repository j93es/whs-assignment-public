import frida
import sys

session = frida.attach("notepad++.exe")
# session = frida.attach(15064)

with open("clipboard_monitor.js", "r", encoding="utf-8") as f:
    script = session.create_script(f.read())

def on_message(message, data):
    print(message)

script.on("message", on_message)
script.load()
print("[*] Frida clipboard monitoring started. Press Ctrl+C to exit.")
sys.stdin.read()