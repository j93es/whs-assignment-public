# 가상머신과 네트워크 연결

해당 과제는 두개의 Ubuntu 가상 환경을 구축하고, 네트워크 연결을 설계하는 것입니다. 요구사항은 다음과 같습니다.

- Ubuntu1은 enp0s1은 NAT과 연결되어있고, enp0s3는 내부 네트워크를 통하여 Ubuntu2의 요청을 NAT으로 포트포워딩
- Ubuntu2는 enp0s2를 통하여 Ubuntu1을 게이트웨이로 외부망과 연결
- Ubuntu1에서 `ping 8.8.8.8`, Ubuntu2에서 `traceroute 8.8.8.8`을 실행한 결과를 제출
