## ๐ Uncaught ReferenceError : resources is not defined

---

## ๐ฃ ์ค๋ฅ๋ฉ์ธ์ง

- Uncaught ReferenceError : resources is not defined

- XMLHttpRequest()๋ฅผ ์ฌ์ฉํด์ json data๋ฅผ ๋ฐ์์ฌ๋ ค๋ ๋์ค ์๋ฌ๊ฐ ๋ฐ์ํ๋ค.

![์๋ฌ๋ฉ์ธ์ง1](https://user-images.githubusercontent.com/86590036/147816761-51723722-dc7c-4d85-80fe-a1c14ba775f3.jpg)

### < jsonํ์ผ ์์น >

![์๋ฌ๋ฉ์ธ์ง2](https://user-images.githubusercontent.com/86590036/147816760-5c4befe5-04f6-4917-b046-8f2a5bfd769c.jpg)

### < json data >

![์ ์ด์จ๋ฐ์ดํฐ](https://user-images.githubusercontent.com/86590036/147816845-a0f02861-d22e-446e-b269-f441ccfb6d06.jpg)

### < ์ค๋ฅ์ฝ๋ >

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

## ๐ฃ ์์ธ

- resources๊ฐ ์ ์๋์ด ์์ง ์๋ค? ํ์ผ๊ฒฝ๋ก๊ฐ ์๋ชป๋ ๊ฒ ๊ฐ์์ ๋ฐ๊พธ์ด๋ณด์๋ค.

ํ์ง๋ง ํด๋๋ฅผ ์ฎ๊ฒจ๋ด๋ ์ด๋ฆ์ ์ฒดํฌํด๋ด๋ ๊ฐ์ ์๋ฌ๊ฐ ๋ฐ์ํ์๋ค.
๊ณ์ ๋ฐ๊ฟ๋ณด๋ค๊ฐ 2๊ฐ์ง ํฐ ์ค์๋ฅผ ํ๋ค๋ ๊ฒ์ ๊นจ๋ฌ์๋ค.

1. open() url๋ถ๋ถ์ ""๋ฅผ ๋ถ์ด์ง ์์๋ค.
2. ๊ฒฝ๋ก์ค์  controller์ ๋์ผ ๊ฒฝ๋ก์ ๋ฐฐ์นํด์ผํ๋ค.

## ๐ฃ ํด๊ฒฐ์ฑ

- controller์ mapping์ด /home์ผ๋ก ๋์ด์๊ณ  jsp ๊ฒฝ๋ก๋ webapp๋ฐ์ resources ํด๋ ์์ ์๊ธฐ ๋๋ฌธ์ ํ ์นธ ๋๊ฐ์ resourecesํด๋๋ก ๋ค์ด๊ฐ์ค์ผํ๋ค.

- url๋ถ๋ถ์ "../resouces/json/sample.json"์ผ๋ก ์์ ํ๊ณ  ์๋ํ๋ ์ ์์ ์ผ๋ก ์๋๋์๋ค.

![์ ์ด์จ](https://user-images.githubusercontent.com/86590036/147817374-8938827f-afca-48ae-920c-637b6acc58ab.jpg)

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
