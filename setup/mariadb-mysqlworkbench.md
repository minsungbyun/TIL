## ๐ MariaDB์ MySQL Workbench ์ฐ๋์ํค๊ธฐ 
___

- ๐ธ MariaDB์ ์ด๋ฏธ ๋ง๋ค์ด๋์ DB๊ฐ ์๋ค๊ณ  ๊ฐ์ ํ๊ณ  ๋ง์๋๋ฆฌ๊ฒ ์ต๋๋ค.

## ๐ฃ ์ค๋น 

- ๐ธ ํด๋น ๋งํฌ๋ฅผ ํด๋ฆญํด์ [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)๋ฅผ ๋ค์ด๋ฐ์์ฃผ์ธ์

![1๋ฒ](https://user-images.githubusercontent.com/86590036/147380746-c205aebd-6e7e-4f8f-a62b-c621a29a53c4.JPG)


- ๐ธ ์ ์ผ ์ต์  ๋ฒ์ ์ด 8.0.27 ๋ฒ์ ์ธ๋ฐ ์ 8.0.26 ๋ฒ์ ์ ๋ค์ด๋ฐ์๊น? 
    - ๐ธ ๋์ค์ ๋ฐ์ํ๊ฒ ๋  ์ฐ๊ฒฐ๊ด๋ จ ์ด์๋ฅผ ํด๊ฒฐํ๊ธฐ ์ํจ 

![2๋ฒ](https://user-images.githubusercontent.com/86590036/147380786-b507c197-3be6-4160-978a-4d3afb9b0b4c.JPG)

- ๐ธ ๋ค์ด๋ก๋๋ฅผ ๋๋ฅด๊ณ  ํด๋น ์ ์ฐจ์ ๋ฐ๋ผ next ๋๋ฌ์ ์ค์นํด์ฃผ์๋ฉด ๋ฉ๋๋ค.

- ๐ธ ์ค์น๊ฐ ์๋ฃ๋๋ค๋ฉด ์คํ์์ผ์ฃผ์ธ์

![3๋ฒ](https://user-images.githubusercontent.com/86590036/147380882-2e367c13-b692-47a3-a308-38e11428d266.jpg)

- ๐ธ Database > Manage Connection์ ๋๋ฌ์ฃผ์ธ์

![4๋ฒ](https://user-images.githubusercontent.com/86590036/147380924-3c845e12-cc3b-43d9-9ff3-b4b630bf4593.jpg)

- ๐ธ SSL > If available์ด๋ no๋ฅผ ๋๋ฌ์ฃผ์ธ์

![5๋ฒ](https://user-images.githubusercontent.com/86590036/147380987-2adc6327-75d9-479a-aa8b-5d37eadde405.jpg)

![6๋ฒ](https://user-images.githubusercontent.com/86590036/147380988-53e77780-9fc8-4b82-aa8f-a519fd3572e9.jpg)

- ๐ธ Test Connection์ ๋๋ฌ ํ์คํธ๋ ์งํํด๋ด๋๋ค.

![9๋ฒ](https://user-images.githubusercontent.com/86590036/147381112-80661857-30d8-4e4f-b588-7804fc57cec2.jpg)

![10๋ฒ](https://user-images.githubusercontent.com/86590036/147381204-906da875-49a5-47c9-9e96-bd7e56ce61d6.jpg)

- ๐ธ 1. Hostname์๋ ์๋ํฌ์ธํธ๋ฅผ ์๋ ฅํ๊ณ  ํฌํธ๋ฒํธ๋ฅผ ์๋ ฅํฉ๋๋ค. 
- ๐ธ 2. Username์ ์๋ ฅํฉ๋๋ค.
- ๐ธ 3. Store in Vault๋ฅผ ๋๋ฌ rds ๋ฐ์ดํฐ๋ฒ ์ด์ค ๋น๋ฐ๋ฒํธ๋ ์๋ ฅํฉ๋๋ค.
- ๐ธ 4. ํ์คํธ ํด๋ด๋๋ค.
- ๐ธ 5. OK๋ฒํผ์ ๋๋ฌ ๋ง๋ฌด๋ฆฌ ํด์ค๋๋ค.

![11๋ฒ](https://user-images.githubusercontent.com/86590036/147381273-ee6d6910-e323-493b-802d-7ef5f6ed0acd.jpg)


## ๐ฃ Cannot Connect to Database Server ์๋ฌ

![8๋ฒ](https://user-images.githubusercontent.com/86590036/147381034-3d7a9243-d145-40d2-b58f-f323b4401035.jpg)

- ๐ธ ์์ ๊ฐ์ ์๋ฌ๊ฐ ๋ฐ์ํ์๋ ๋ถ๋ค์ 8.0.26 ๋ฒ์ ์ ๋ค์ด๋ฐ์์ ์งํํ์๋ฉด ๋ฉ๋๋ค.

- ๐ธ 8.0.27 ๋ฒ์ ๋ถํฐ SSL ํ์ ๋ฉ๋ด์ธ USE SSL์์ If available์ no๊ฐ ์ฌ๋ผ์ก์ต๋๋ค. ๊ทธ๋์ ํ ๋จ๊ณ ๋ฐ์ธ 8.0.26 ๋ฒ์ ์ ๋ค์ด๋ฐ์ผ๋ผ๊ณ  ํ๊ฑฐ์ฃ .


## ๐ฃ MariaDB ํฌํธ๋ฒํธ ๋ณ๊ฒฝํ๊ธฐ

- ๐ธ ํ์ผํ์๊ธฐ > MariaDB > data์ ์๋ my.iniํ์ผ์ ํด๋ฆญํฉ๋๋ค.

![12๋ฒ](https://user-images.githubusercontent.com/86590036/147381342-fdb98a27-2ae5-4643-9e66-6de1e1afcf58.jpg)

- ๐ธ ๋ฉ๋ชจ์ฅ์ ์๋ ํฌํธ๋ฒํธ๋ฅผ ๋ณ๊ฒฝํด์ค๋๋ค.

![13๋ฒ](https://user-images.githubusercontent.com/86590036/147381381-8dc32dde-c12d-4d40-8841-a36a53e53964.jpg)


- ๐ธ ์๋น์ค๋ฅผ ์ฌ์คํํฉ๋๋ค.

![14๋ฒ](https://user-images.githubusercontent.com/86590036/147381412-20f02f0b-c4e1-4b7d-883f-e876b2932535.jpg)

- ๐ธ ๋!!!
