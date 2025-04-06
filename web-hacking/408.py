import socket
import time

host = 'webhacking.kr'   # 테스트할 서버 주소
port = 10022              # HTTP 기본 포트

# 소켓 생성 및 연결
s = socket.create_connection((host, port))
s.settimeout(5)  # 응답 대기시간 설정

try:
    # 헤더 일부만 전송
    s.sendall(b"POST / HTTP/1.1\r\n")
    s.sendall(f"Host: {host}\r\n".encode())
    s.sendall(b"Content-Length: 10\r\n")
    
    # 헤더 100초 동안 안 보내고 지연
    time.sleep(100)

    # 이제 나머지 바디 전송
    s.sendall(b"\r\n1234567890")  # 헤더 종료 후 바디 전송

    # 응답 받기
    response = b""
    while True:
        chunk = s.recv(4096)
        if not chunk:
            break
        response += chunk

    print(response.decode(errors='replace'))

except socket.timeout:
    print("서버 응답이 없거나 타임아웃이 발생했습니다.")
finally:
    s.close()
