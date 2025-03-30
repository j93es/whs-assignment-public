# PCAP 프로그래밍

PCAP API를 활용하여 PACKET의 정보를 출력하는 프로그램 작성하였습니다. TCP protocol만을 대상으로 Ethernet Header, IP Header, TCP Header, Application layer의 정보를 출력하는 프로그램을 구현하였습니다.

## Build

1. `ifconfig`를 통하여 타겟 이더넷 어뎁터의 정보를 찾기
2. `assignment.c`의 해당 부분을 타겟 이더넷 어뎁터의 정보로 바꾸기
   ```c
   handle = pcap_open_live("en0", BUFSIZ, 1, 1000, errbuf);
   ```
3. 다음의 명렁어로 컴파일
   ```sh
   gcc assignment.c -lpcap
   ```
