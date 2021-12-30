## 📌 STS서버실행 오류

---

## 🟣 오류메세지

- ClassNotFoundException : org.apache.catalina.startup.Bootstrap

![스프링 서버 실행 오류](https://user-images.githubusercontent.com/86590036/147757942-0d3cfded-0346-43af-b98e-02f7a6492121.jpg)

- Port 번호 겹침

![포트번호부재 1](https://user-images.githubusercontent.com/86590036/147759225-9206a0bc-4065-4793-8188-8776f20b4bf5.jpg)

## 🟣 원인

- 🗸 1. Bootstrap.zar 파일의 부재

- 🗸 2. Port번호 겹침

- 🗸 3. 서버 라이브러리 등록 문제

- 🗸 4. 서버 Publish(배치) 문제

## 🟣 해결책

첫 번째 문제를 겪고나서 다양한 시도를 많이 해보았다. 해결한 방법을 제시한 후에 이것저것 시도해봤던 방법들을 공유하려고 한다.

- ### 🗸 Bootstrap.zar 파일이 없으니 등록해보자!

에러 내용을 보면 Bootstrap 클래스를 찾을 수 없다고 한다. 그래서 톰캣 파일을 뒤져봤다.

처음에는 톰캣 파일의 lib 파일을 들어갔으나 찾을 수 없었다.

![해결책2](https://user-images.githubusercontent.com/86590036/147759779-4b3b6428-06d5-4727-b686-150a03d262d6.jpg)

다음으로 톰캣 파일의 bin 파일을 들어갔는데 맨 위에 있었다! 이를 프로젝트에 적용해보면 되겠다.

![해결책1](https://user-images.githubusercontent.com/86590036/147759703-eaf05620-1d48-4853-8e3f-7e8446102304.jpg)

- 프로젝트를 선택한 후 Build Path에 Configure Build Path에 들어가준다.

![해결책3](https://user-images.githubusercontent.com/86590036/147759926-1a35de98-5d57-4f47-baf5-c71654c30b62.jpg)

- BootStrap.jar를 추가해준다.

![해결책4](https://user-images.githubusercontent.com/86590036/147760086-b3056b3b-ccd5-4199-bd64-220e078742de.jpg)
![해결책5](https://user-images.githubusercontent.com/86590036/147760088-b53b2ea3-c182-4075-b91d-0ab14153597b.jpg)

- 서버를 실행해준다. 이 방법으로 해결했다.

- ### 🗸 서버를 라이브러리에 등록해본다.

이 방법은 아까 Build Path에 Configure Build Path에 들어가준다.

Add Library > Server Runtime > 본인 서버 선택 > Finish

![해결책6](https://user-images.githubusercontent.com/86590036/147760365-d08fdf37-0e1d-44fc-93d1-36032cd69346.jpg)
![해결책7](https://user-images.githubusercontent.com/86590036/147760367-5b558527-3506-439d-8c84-38a5d7a60845.jpg)

- ### 🗸 서버 Publish(배치)를 다시한다.

서버 갯수에 따라 tmp0 ~ tmpN 개의 폴더가 생성된다. 그리고 본인의 서버에 들어가서 wtpwebapps 폴더에 들어가는데 해당 폴더에 배치 폴더가 생성된다. ROOT이외에 본인의 프로젝트 폴더가 나오면 배치가 성공한 것이다.

![해결책9](https://user-images.githubusercontent.com/86590036/147760667-7d442763-9a52-41a6-ac5a-17a327021cca.jpg)
![해결책10](https://user-images.githubusercontent.com/86590036/147760668-08f81e85-acc2-44f8-a6e7-c989f40524df.jpg)
![해결책11](https://user-images.githubusercontent.com/86590036/147760669-1b3cd574-d346-4f56-b745-1c700443dbfc.jpg)

- ### 🗸 포트번호가 겹칠 때는 이렇게 해결하세요

cmd를 열고 netstat -ano라고 치고 에러 메세지에 겹치는 포트번호를 찾아서 kill해주면 된다.
그러면 해당 서버는 종료되고 다시 서버를 실행한다면 정상적으로 실행될 것이다.

![포트번호부재 1](https://user-images.githubusercontent.com/86590036/147760912-56e93afc-4daa-409d-9e78-914f29f02d6a.jpg)
![포트번호부재 2](https://user-images.githubusercontent.com/86590036/147760913-f2d87d57-df8b-4115-8e7e-a76eb867c626.jpg)
![포트번호부재 3](https://user-images.githubusercontent.com/86590036/147760916-f4729bd0-2625-4f88-911c-1bc2b99c4398.jpg)
