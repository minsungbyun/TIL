## 📌 Uncaught ReferenceError : resources is not defined

---

## 🟣 오류메세지

- Uncaught ReferenceError : resources is not defined

- XMLHttpRequest()를 사용해서 json data를 받아올려는 도중 에러가 발생했다.

![에러메세지1](https://user-images.githubusercontent.com/86590036/147816761-51723722-dc7c-4d85-80fe-a1c14ba775f3.jpg)

### < json파일 위치 >

![에러메세지2](https://user-images.githubusercontent.com/86590036/147816760-5c4befe5-04f6-4917-b046-8f2a5bfd769c.jpg)

### < json data >

![제이슨데이터](https://user-images.githubusercontent.com/86590036/147816845-a0f02861-d22e-446e-b269-f441ccfb6d06.jpg)

### < 오류코드 >

```javascript
<script type="text/javascript">

    document.querySelector('button').addEventListener('click', () => {
      const xhr = new XMLHttpRequest();
      xhr.addEventListener('readystatechange',() => {
        if (xhr.readyState == xhr.DONE) {
          if (xhr.status == 200 || xhr.status == 201) {
            console.log(xhr.response);
          }
        }
      });
      xhr.open('GET', resources/json/sample.json, true);
      xhr.send();
    });

  </script>
```

## 🟣 원인

- resources가 정의되어 있지 않다? 파일경로가 잘못된 것 같아서 바꾸어보았다.

하지만 폴더를 옮겨봐도 이름을 체크해봐도 같은 에러가 발생하였다.
계속 바꿔보다가 2가지 큰 실수를 했다는 것을 깨달았다.

1. open() url부분에 ""를 붙이지 않았다.
2. 경로설정 controller와 동일 경로에 배치해야한다.

## 🟣 해결책

- controller의 mapping이 /home으로 되어있고 jsp 경로는 webapp밑에 resources 폴더 안에 있기 때문에 한 칸 나가서 resoureces폴더로 들어가줘야한다.

- url부분을 "../resouces/json/sample.json"으로 수정하고 작동하니 정상적으로 작동되었다.

![제이슨](https://user-images.githubusercontent.com/86590036/147817374-8938827f-afca-48ae-920c-637b6acc58ab.jpg)

HomeController.java

```java
@Controller
@RequestMapping("/home")
public class HomeController {

    private static Logger logger = LogManager.getLogger(HomeController.class);

    @RequestMapping(value = "json", method = RequestMethod.GET)
	public String main() {

    	logger.info("home controller start!!");

		return "jsonTest";

	}
}

```

jsonTest.jsp

```javascript
<script type="text/javascript">

    document.querySelector('button').addEventListener('click', () => {
      const xhr = new XMLHttpRequest();
      xhr.addEventListener('readystatechange',() => {
        if (xhr.readyState == xhr.DONE) {
          if (xhr.status == 200 || xhr.status == 201) {
            console.log(xhr.response);
          }
        }
      });
      xhr.open('GET', "../resources/json/sample.json", true);
      xhr.send();
    });

  </script>
```
