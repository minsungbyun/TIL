## ๐ORA-12514: listener does not currently know of service requested in connect descriptor

## ๐ฃ ์ค๋ฅ๋ฉ์ธ์ง

- ORA-12514: listener does not currently know of service requested in connect descriptor

- JUnit์ผ๋ก DB Connection์ ํ์คํธํ๋ ๋์ค ์๋ฌ๊ฐ ๋ฐ์ํ๋ค.

![์๋ฌ๋ด์ฉ](https://user-images.githubusercontent.com/86590036/148500770-85feb860-7d2b-4aa2-afc4-0b259baae2a1.jpg)

### < ์ค๋ฅ์ฝ๋ >

- OracleConnectionTest.java

![์ฝ๋](https://user-images.githubusercontent.com/86590036/148500772-49b409f5-4994-4a4e-86cd-edbf07a42bcd.jpg)

- dataSource.xml

![์๋ฌ ํด๊ฒฐ 1](https://user-images.githubusercontent.com/86590036/148500764-f5ed3c1e-3886-40ef-8bc7-5e413d71b72c.jpg)

## ๐ฃ ์์ธ

1. dataSource url์ SERVICE_NAME ๋ถ์ผ์น
2. Oracle Database url ์ ๋ณด ์คํ
3. logger ์ถ๋ ฅ ํฌ๋ฉง ์ค์

์ค๋ผํด์ SID, SERVICE_NAME์ ๋์๋ฌธ์๋ฅผ ๋ฐ๋์ ๊ตฌ๋ถํ์ฌ ๊ธฐ์ ํด์ผ ํ๋ค.

## ๐ฃ ํด๊ฒฐ์ฑ

1. dataSource url์ SERVICE_NAME ๋ถ์ผ์น

listener.ora ํ์ผ ํ์ธ
![listener](https://user-images.githubusercontent.com/86590036/148500755-208e5a3a-b5e2-4c7b-95e2-3cbfc47b5f47.jpg)

tnsnames.ora ํ์ผ ํ์ธ
![tnsnames](https://user-images.githubusercontent.com/86590036/148500759-bb98359f-bbd8-47c1-ba95-bc1f8024824b.jpg)

SqlDeveloper ํ์ธ
![์๋ฌ ํด๊ฒฐ 2](https://user-images.githubusercontent.com/86590036/148500767-ae3baaa6-e50d-47b2-b5ec-0d84763c4dd2.jpg)

2. Oracle Database url ์ ๋ณด ์คํ (์ฌ๊ธฐ์ ์ค์)

mysql์ url๋ฐฉ์๊ณผ ํ๊ฐ๋ ค์ ๋งจ๋ค์ DB์ด๋ฆ์ ์ ์ด๋ฒ๋ฆฌ๊ณ  ๋ง์๋ค

```java
Oracle Database url ์ ๋ณด
driver = oracle.jdbc.driver.OracleDriver
url = jdbc:oracle:driver_type:[username/password]@[//]host_name[:port][/XE]
```

![์๋ฌ ํด๊ฒฐ 1](https://user-images.githubusercontent.com/86590036/148500764-f5ed3c1e-3886-40ef-8bc7-5e413d71b72c.jpg)

ํด๊ฒฐํ ์ค ์์๋๋ฐ ??...

![๋ก๊ทธํฌ๋ฉง ์ค์](https://user-images.githubusercontent.com/86590036/148500762-e3b74717-e6ef-4929-aa0c-8f11958f03cf.jpg)

con ๊ฐ์ฒด๊ฐ ์๋์ด์จ๋ค. ๋ญ์ง..?
ํ์ธํด๋ณด๋

![๋ก๊ทธํฌ๋ฉง ์ค์2](https://user-images.githubusercontent.com/86590036/148500763-a067d04d-768c-429d-a671-114549b61717.jpg)

์์ฃผ ๋ฉ์ฒญํ ์ค์๋ฅผ ํ๋ค.

```java
logger.info(String msg);
logger.info(String format, Object arg);
```

2๋ฒ์งธ ๋ฐฉ๋ฒ์ ํด์ฃผ๋ ค๋ฉด ํฌ๋ฉงํ {}์ ์จ์ค์ผํ๋ค๋๊ฒ์ ์์๋ค.

![ํด๊ฒฐ](https://user-images.githubusercontent.com/86590036/148500773-c4630282-2303-4f2f-a1ab-05afa46f004d.jpg)

๊ตํ : ๊บผ์ง๋ถ๋ ๋ค์๋ณด์
