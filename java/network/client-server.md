
### 📌 네트워크의 흐름

**LAN** 
**WAN**
**Gateway**
**Internet**
**NIC**


![네트워크 1](https://user-images.githubusercontent.com/86590036/135635525-0317459c-7ce6-4ad8-befe-1fa6a81129aa.jpg)

✔️ 비록 같은 컴퓨터일지라도 프로그램사이에 직접적으로 데이터를 전달할 수 없다.

✔️ NIC(Network Interface Card)을 통해서 데이터를 전달할 수 있다.

✔️ 외부의 다른 컴퓨터와 통신하기 위해서는 HUB를 통해 데이터 전달이 가능하며, 중앙 HUB를 지나 Gateway를 지나서 통신사를 거쳐 다른 컴퓨터와 통신할 수 있다.

![네트워크 2](https://user-images.githubusercontent.com/86590036/135635573-224844b4-20d4-43d0-8589-8d3e7a96b569.jpg)

![네트워크 3](https://user-images.githubusercontent.com/86590036/135635611-d2a280c7-a8f8-4a6e-a768-1bfa86d6c8bf.jpg)

### 📌 포트(Port)번호와 소켓(Socket)

✔️ 포트번호는 통신할 대상을 구분하기 위해 부여된 번호를 말한다. 

✔️ Client와 Server 모두 포트번호를 가지고 있다.

![네트워크 4](https://user-images.githubusercontent.com/86590036/135635646-d8dce6c4-c94d-4e5d-9a87-c2d261ae1fcd.jpg)

✔️ 자바에서 내부적으로 네트워크 통신을 가능하게 해주는 것이 바로 소켓이다.

✔️ Client에서 소켓을 만들며, Server에서도 소켓을 만드는데 Server는 Client와 달리 ServerSocket이 존재한다. 

✔️ 예를 들면 대표번호라고 생각하면 쉽다.
우리가 대표번호로 전화를 걸면 그 곳에서 나의 요청에 맞는 상담사를 연결해준다.

✔️ 소켓도 그와같이 서버소켓에 접속해서 서버소켓이 각각의 소켓을 생성해주고 그 소켓에 데이터를 전송하는 방식이다.

![네트워크 5](https://user-images.githubusercontent.com/86590036/135635672-b8ea7c2d-54fa-4fda-855c-cd1864ffbd13.jpg)


![네트워크 6](https://user-images.githubusercontent.com/86590036/135635710-1495ffdb-a34d-4a16-aafa-fa03c150e319.jpg)


![네트워크 7](https://user-images.githubusercontent.com/86590036/135635754-da7cd413-62ed-40ba-9cc0-0691414987a7.jpg)

### 📌 데이터를 전달하는 과정

✔️ ClientApp에서 Java 객체를 Serialize해서 JSON 문자열로 만들고 소켓으로 ServerApp으로 전달하며

✔️ ServerApp에서도 소켓으로 데이터를 받고 JSON 문자열을 deSerialize하여 Java 객체로 만들어 파일에 저장한다.

![네트워크 8](https://user-images.githubusercontent.com/86590036/135635816-b58b9fdd-0efb-49b2-b89b-6e4db15d50c9.jpg)
