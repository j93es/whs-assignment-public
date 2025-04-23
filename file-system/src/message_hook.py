import frida
import sys

script_code = open("message_hook.js", encoding="utf-8").read()

session = frida.attach("notepad++.exe")
def on_message(message, data):
    if message["type"] == "send":
        print("[*] Message from script:", message["payload"])
    elif message["type"] == "error":
        print("[!] Error:", message["stack"])

script = session.create_script(script_code)
script.on('message', on_message)
script.load()
session.resume()
sys.stdin.read()
