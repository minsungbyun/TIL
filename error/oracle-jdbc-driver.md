## 📌ORA-12514: listener does not currently know of service requested in connect descriptor

## 🟣 오류메세지

- ORA-12514: listener does not currently know of service requested in connect descriptor

- JUnit으로 DB Connection을 테스트하는 도중 에러가 발생했다.

![에러내용](https://user-images.githubusercontent.com/86590036/148500770-85feb860-7d2b-4aa2-afc4-0b259baae2a1.jpg)

### < 오류코드 >

- OracleConnectionTest.java

![코드](https://user-images.githubusercontent.com/86590036/148500772-49b409f5-4994-4a4e-86cd-edbf07a42bcd.jpg)

- dataSource.xml

![에러 해결 1](https://user-images.githubusercontent.com/86590036/148500764-f5ed3c1e-3886-40ef-8bc7-5e413d71b72c.jpg)

## 🟣 원인

1. dataSource url의 SERVICE_NAME 불일치
2. Oracle Database url 정보 오타
3. logger 출력 포멧 실수

오라클의 SID, SERVICE_NAME은 대소문자를 반드시 구분하여 기술해야 한다.

## 🟣 해결책

1. dataSource url의 SERVICE_NAME 불일치

listener.ora 파일 확인
![listener](https://user-images.githubusercontent.com/86590036/148500755-208e5a3a-b5e2-4c7b-95e2-3cbfc47b5f47.jpg)

tnsnames.ora 파일 확인
![tnsnames](https://user-images.githubusercontent.com/86590036/148500759-bb98359f-bbd8-47c1-ba95-bc1f8024824b.jpg)

SqlDeveloper 확인
![에러 해결 2](https://user-images.githubusercontent.com/86590036/148500767-ae3baaa6-e50d-47b2-b5ec-0d84763c4dd2.jpg)

2. Oracle Database url 정보 오타 (여기서 실수)

mysql의 url방식과 햇갈려서 맨뒤에 DB이름을 적어버리고 말았다

```java
Oracle Database url 정보
driver = oracle.jdbc.driver.OracleDriver
url = jdbc:oracle:driver_type:[username/password]@[//]host_name[:port][/XE]
```

![에러 해결 1](https://user-images.githubusercontent.com/86590036/148500764-f5ed3c1e-3886-40ef-8bc7-5e413d71b72c.jpg)

해결한 줄 알았는데 ??...

![로그포멧 실수](https://user-images.githubusercontent.com/86590036/148500762-e3b74717-e6ef-4929-aa0c-8f11958f03cf.jpg)

con 객체가 안넘어온다. 뭐지..?
확인해보니

![로그포멧 실수2](https://user-images.githubusercontent.com/86590036/148500763-a067d04d-768c-429d-a671-114549b61717.jpg)

아주 멍청한 실수를 했다.

```java
logger.info(String msg);
logger.info(String format, Object arg);
```

2번째 방법을 해주려면 포멧팅 {}을 써줘야한다는것을 잊었다.

![해결](https://user-images.githubusercontent.com/86590036/148500773-c4630282-2303-4f2f-a1ab-05afa46f004d.jpg)

교훈 : 꺼진불도 다시보자
