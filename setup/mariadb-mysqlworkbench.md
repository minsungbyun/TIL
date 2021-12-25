## 📌 MariaDB와 MySQL Workbench 연동시키기 
___

- 🗸 MariaDB에 이미 만들어놓은 DB가 있다고 가정하고 말씀드리겠습니다.

## 🟣 준비 

- 🗸 해당 링크를 클릭해서 [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)를 다운받아주세요

![1번](https://user-images.githubusercontent.com/86590036/147380746-c205aebd-6e7e-4f8f-a62b-c621a29a53c4.JPG)


- 🗸 제일 최신 버전이 8.0.27 버전인데 왜 8.0.26 버전을 다운받을까? 
    - 🗸 나중에 발생하게 될 연결관련 이슈를 해결하기 위함 

![2번](https://user-images.githubusercontent.com/86590036/147380786-b507c197-3be6-4160-978a-4d3afb9b0b4c.JPG)

- 🗸 다운로드를 누르고 해당 절차에 따라 next 눌러서 설치해주시면 됩니다.

- 🗸 설치가 완료된다면 실행시켜주세요

![3번](https://user-images.githubusercontent.com/86590036/147380882-2e367c13-b692-47a3-a308-38e11428d266.jpg)

- 🗸 Database > Manage Connection을 눌러주세요

![4번](https://user-images.githubusercontent.com/86590036/147380924-3c845e12-cc3b-43d9-9ff3-b4b630bf4593.jpg)

- 🗸 SSL > If available이나 no를 눌러주세요

![5번](https://user-images.githubusercontent.com/86590036/147380987-2adc6327-75d9-479a-aa8b-5d37eadde405.jpg)

![6번](https://user-images.githubusercontent.com/86590036/147380988-53e77780-9fc8-4b82-aa8f-a519fd3572e9.jpg)

- 🗸 Test Connection을 눌러 테스트도 진행해봅니다.

![9번](https://user-images.githubusercontent.com/86590036/147381112-80661857-30d8-4e4f-b588-7804fc57cec2.jpg)

![10번](https://user-images.githubusercontent.com/86590036/147381204-906da875-49a5-47c9-9e96-bd7e56ce61d6.jpg)

- 🗸 1. Hostname에는 엔드포인트를 입력하고 포트번호를 입력합니다. 
- 🗸 2. Username을 입력합니다.
- 🗸 3. Store in Vault를 눌러 rds 데이터베이스 비밀번호도 입력합니다.
- 🗸 4. 테스트 해봅니다.
- 🗸 5. OK버튼을 눌러 마무리 해줍니다.

![11번](https://user-images.githubusercontent.com/86590036/147381273-ee6d6910-e323-493b-802d-7ef5f6ed0acd.jpg)


## 🟣 Cannot Connect to Database Server 에러

![8번](https://user-images.githubusercontent.com/86590036/147381034-3d7a9243-d145-40d2-b58f-f323b4401035.jpg)

- 🗸 위와 같은 에러가 발생하시는 분들은 8.0.26 버전을 다운받아서 진행하시면 됩니다.

- 🗸 8.0.27 버전부터 SSL 하위 메뉴인 USE SSL에서 If available와 no가 사라졌습니다. 그래서 한 단계 밑인 8.0.26 버전을 다운받으라고 한거죠.


## 🟣 MariaDB 포트번호 변경하기

- 🗸 파일탐색기 > MariaDB > data에 있는 my.ini파일을 클릭합니다.

![12번](https://user-images.githubusercontent.com/86590036/147381342-fdb98a27-2ae5-4643-9e66-6de1e1afcf58.jpg)

- 🗸 메모장에 있는 포트번호를 변경해줍니다.

![13번](https://user-images.githubusercontent.com/86590036/147381381-8dc32dde-c12d-4d40-8841-a36a53e53964.jpg)


- 🗸 서비스를 재실행합니다.

![14번](https://user-images.githubusercontent.com/86590036/147381412-20f02f0b-c4e1-4b7d-883f-e876b2932535.jpg)

- 🗸 끝!!!
