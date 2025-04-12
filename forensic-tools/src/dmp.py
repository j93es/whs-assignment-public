import re

def bytes_to_printable_str(byte_data):
    return ''.join(chr(b) if 0x20 <= b <= 0x7E else '.' for b in byte_data)

def find_pattern_in_dmp(file_path, preview_bytes=16):
    pattern = (
        b'\x64' +             # 0x64
        b'(.{6,8})' +         # 6~8 bytes
        b'\x40\x06' +         # 0x40 0x06
        b'.{18}' +            # 18 bytes
        b'\x5a\x0c\x00\x00'   # 0x5a 0x0c 0x00 0x00
    )

    with open(file_path, 'rb') as f:
        data = f.read()

    match = re.search(pattern, data, re.DOTALL)
    if not match:
        print("패턴을 찾을 수 없습니다.")
        return

    offset = match.start()
    end = match.end()
    follow_bytes = data[end:end + preview_bytes]

    hex_str = ' '.join(f"{b:02x}" for b in follow_bytes)
    char_str = bytes_to_printable_str(follow_bytes)

    print(f"hex:   {hex_str}")
    print(f"text:  {char_str}")

find_pattern_in_dmp("pid.708.dmp", preview_bytes=16)
