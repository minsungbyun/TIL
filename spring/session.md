## ๐ ์ธ์ ๋ค๋ฃจ๊ธฐ - HttpSession ์ง์  ์ฌ์ฉํ๊ธฐ

- ๐ธ HttpSession ๊ฐ์ฒด๋ฅผ ์ฌ์ฉํ๋ ค๋ฉด ์๊ท๋จผํธ๋ก ๋ฐ์์ผ ํ๋ค.

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h1", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler1(HttpSession session) {
 
    session.setAttribute("name", "ํ๊ธธ๋");
    session.setAttribute("age", "20");

    return "์ธ์์ ๊ฐ์ ๋ณด๊ดํ์!";
  }
}
```


```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h2", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler2(HttpSession session) {
  
    return String.format("name=%s, age=%s",
        session.getAttribute("name"),
        session.getAttribute("age"));
  }
}
```
๊ฒฐ๊ณผ
```java
name=๋ฏผ์ฑ, age=28
```

- ๐ธ ์ธ์ ๋ฌดํจํ์ํค๊ธฐ

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h3", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler3(HttpSession session) {
   
    session.invalidate();

    return "์ธ์์ ๋ฌดํจํ์์ผฐ์!";
  }
}
```
๊ฒฐ๊ณผ
```java
์ธ์์ ๋ฌดํจํ์์ผฐ์!
```
```java
name=null, age=null
```

- ๐ธ ํ์ฌ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ @SessionAttributes ์ ์ง์ ๋ ์ด๋ฆ์ด ์๋๋ผ๋ฉด, ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ์์ฒญ ํ๋ผ๋ฏธํฐ์์ ํด๋น ์ด๋ฆ์ ๊ฐ์ ์ฐพ์ ๋๊ฒจ์ค๋ค.
- ๐ธ ์์ฒญ ํ๋ผ๋ฏธํฐ์ ํด๋น ์ด๋ฆ์ ๊ฐ์ด ์๋ค๋ฉด, ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ๋น ๋ฌธ์์ด์ ๋๊ฒจ์ค๋ค.

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h4", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler4(
     
      @ModelAttribute("name") String name,
      @ModelAttribute("age") String age,
      @ModelAttribute("name2") String name2,
      @ModelAttribute("age2") String age2) {

    return String.format("name=%s, age=%s, name2=%s, age2=%s",
        name, age, name2, age2);
  }
}
```
๊ฒฐ๊ณผ
```java
//@SessionAttributes์ ์ด๋ฆ์ ์ค์ ํ์ง ์์๊ธฐ ๋๋ฌธ์ ์ธ์์ ๊ฐ์ด ๋ค์ด์๋๋ผ๋ ๋น ๋ฌธ์์ด์ด ๋ฆฌํด๋๋ค.
name=, age=, name2=, age2=
```


## ๐ @SessionAttributes, @ModelAttribute


- ๐ธ Model ๊ฐ์ฒด์ ๊ฐ์ ๋ด์ผ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ServletRequest ๋ณด๊ด์์ ๊ฐ์ ์ฎ๊ธด๋ค.
- ๐ธ ๋ง์ฝ @SessionAttributes ์์ ์ง์ ํ ์ด๋ฆ์ ๊ฐ์ด๋ผ๋ฉด HttpSession ๊ฐ์ฒด์๋ ๋ณด๊ด๋๋ค.
- ๐ธ @SessionAttributes์ ๋ฑ๋ก๋์ง ์์ ์ด๋ฆ์ ๊ฐ์ ์ธ์์ ๋ณด๊ด๋์ง ์๋๋ค.

```java
@Controller
@RequestMapping("/c03_2")
@SessionAttributes({"name2","age2"})
public class Controller03_2 {

  @GetMapping(value="h1", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler1(Model model) {

    model.addAttribute("name2", "๋ฏผ์ฑ");
    model.addAttribute("age2", "28");

    model.addAttribute("tel2", "1111-2222");

    return "์ธ์์ ๊ฐ ๋ณด๊ดํ์!";
  }
}
```

```java
@Controller
@RequestMapping("/c03_2")
@SessionAttributes({"name2","age2"})
public class Controller03_2 {

 @GetMapping(value="h2", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler2(HttpSession session) {
    return String.format("name2=%s, age2=%s, tel2=%s", 
        session.getAttribute("name2"),
        session.getAttribute("age2"),
        session.getAttribute("tel2"));
  }
}
```
๊ฒฐ๊ณผ
```java
name2=๋ฏผ์ฑ, age2=28, tel2=null
```

1. @ModelAttribute ์ ์ง์ ๋ ์ด๋ฆ์ด @SessionAttributes์ ์๋ ๊ฒฝ์ฐ 

- ๐ธ ์ธ์์ ํด๋น ๊ฐ์ด ์์ผ๋ฉด ์๊ท๋จผํธ์ ๋ฃ์ด ์ค๋ค.
- ๐ธ ์ธ์์ ํด๋น ๊ฐ์ด ์์ผ๋ฉด ์์ธ๊ฐ ๋ฐ์ํ๋ค.

2. @ModelAttribute ์ ์ง์ ๋ ์ด๋ฆ์ด @SessionAttributes์ ์๋ ๊ฒฝ์ฐ 

- ๐ธ ์์ฒญ ํ๋ผ๋ฏธํฐ์ ๊ฐ์ด ์๋ค๋ฉด ๊ทธ ๊ฐ์ ๋ฃ์ด์ค๋ค.
- ๐ธ ์์ฒญ ํ๋ผ๋ฏธํฐ์ ๊ฐ์ด ์์ผ๋ฉด ์๊ท๋จผํธ์ ๋น ๋ฌธ์์ด์ ๋ฃ์ด ์ค๋ค.
- ๐ธ ์ธ์์ ์์ด๋ ๋ฑ๋ก๋์ง ์์๊ธฐ ๋๋ฌธ์ ๊บผ๋ด์ง ์๋๋ค.

```java
@Controller
@RequestMapping("/c03_2")
@SessionAttributes({"name2","age2"})
public class Controller03_2 {

 @GetMapping(value="h3", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler3(
      
      @ModelAttribute("name2") String name2,
      @ModelAttribute("age2") String age2,
      // @ModelAttribute("ss") String age3,

      @ModelAttribute("tel2") String tel2) {

    return String.format("name2=%s, age2=%s, tel2=%s", 
        name2, age2, tel2);
  }
}
```
๊ฒฐ๊ณผ
```java
 @ModelAttribute("ss") String age3,๋ฅผ ๋ฃ์ผ๋ฉด ์์ธ๋ฐ์ ๊ทธ๋ ์ง ์์ผ๋ฉด

name2=๋ฏผ์ฑ, age2=28, tel2=
```
Q. ์ name๊ณผ age์๋ ๋น ๋ฌธ์์ด์ด ์ ์ฅ๋ ๊น?

- ๐ธ @ModelAttribute๋ ํ์ฌ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ @SessionAttributes์ ์ง์ ๋ ์ด๋ฆ์ ํํด์๋ง ์ธ์์์ ๊ฐ์ ๊บผ๋ธ๋ค.  

```java
@Controller
@RequestMapping("/c03_2")
@SessionAttributes({"name2","age2"})
public class Controller03_2 {

 @GetMapping(value="h4", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler4(
      
      @ModelAttribute("name") String name,
      @ModelAttribute("age") String age,

      @ModelAttribute("name2") String name2,
      @ModelAttribute("age2") String age2) {

    return String.format("name=%s, age=%s, name2=%s, age2=%s", 
        name, age, name2, age2);
  }

}
```
๊ฒฐ๊ณผ
```java
1. @SessionAttributes({"name2","age2"})๋ก ์ค์ ํ ๊ฒฝ์ฐ
name=, age=, name2=๋ฏผ์ฑ, age2=28

2. @SessionAttributes({"name","age","name2","age2"})๋ก ์ค์ ํ ๊ฒฝ์ฐ
name=๋ฏผ์ฑ, age=28, name2=๋ฏผ์ฑ, age2=28
```


## ๐ ์ธ์์ ๊ฐ์ ๋ฌดํจํ์ํค๋ ๋ฐฉ๋ฒ


```java
@Controller
@RequestMapping("/c03_3")
@SessionAttributes({"name","name2"})
public class Controller03_3 {

 @GetMapping(value = "h1", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String handler1(HttpSession session) {
    return String.format("name=%s, age=%s, name2=%s, age2=%s",
        session.getAttribute("name"),
        session.getAttribute("age"),
        session.getAttribute("name2"),
        session.getAttribute("age2"));
  }
}
```
### ๐ฃ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ ์๊ด์์ด ๋ชจ๋  ์ธ์ ๊ฐ์ ์ญ์ ํ  ๋ 

- ๐ธ ์ฉ๋ : ์ธ์ ์์ฒด๋ฅผ ๋ฌดํจํ์์ผ ๋ค์์ ์์ฒญ์ด ๋ค์ด ์์ ๋ ์๋ก ์ธ์์ ๋ง๋ค๊ฒ ํ๋ค.

```java
@Controller
@RequestMapping("/c03_3")
@SessionAttributes({"name","name2"})
public class Controller03_3 {

 GetMapping(value = "h2", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String handler2(HttpSession session) {
    
    session.invalidate();
    
    return "session.invalidate()";
  }
}
```
๊ฒฐ๊ณผ
```java
name=null, age=null, name2=null, age2=null
```

### ๐ฃ ํ์ฌ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ @SessionAttributes์ ์ง์ ๋ ๊ฐ๋ง ๋ฌดํจํ์ํค๊ธฐ

- ๐ธ ๋ณดํต ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ ์๋ก ๊ด๋ จ๋ ์์์ ์ฒ๋ฆฌํ๋ RequestHandler๋ฅผ ์ ์ํ๋ค.
    - ์) BoardController : add(), detail(), list(), update(), delete()
- ๐ธ ๋๋ ํธ๋์ญ์๊ณผ ๊ด๋ จ๋ ์์์ ์ฒ๋ฆฌํ๋ ์์ฒญ ํธ๋ค๋ฌ๋ฅผ ๋๊ธฐ๋ ํ๋ค.
- ๐ธ ์ด๋ ๊ฒ ํน์  ์์์ ๊ด๊ณ๋ RequestHandler๊ฐ ์์ํ๋ ๋์ ๊ณต์ ํ  ๋ฐ์ดํฐ๊ฐ ์๋ค๋ฉด ์ธ์์ ๋ณด๊ดํ๋ฉด ํธํ  ๊ฒ์ด๋ค.
- ๐ธ ์์์ด ์๋ฃ๋๋ฉด ๊ทธ ์์์ ์ฒ๋ฆฌํ๋ ๋์ ์ธ์์ ๋ณด๊ดํ๋ ๋ฐ์ดํฐ๋ ์ญ์ ํด์ผ ํ๋ค. ์ธ์์ ๋ชจ๋  ๋ฐ์ดํฐ๊ฐ ์๋๋ผ ํ์ฌ ํ์ด์ง ์ปจํธ๋กค๋ฌ๊ฐ ๋ณด๊ดํ ๋ฐ์ดํฐ๋ง ์ญ์ ํ๊ณ  ์ถ์ ๋ ์ด ๋ฐฉ์์ผ๋ก ์ฒ๋ฆฌํ๋ฉด ๋๋ค.

- ๐ธ ์ฆ ์ธ์์ ๊ทธ๋๋ก ์ ์งํ์ฑ๋ก ์ด ํ์ด์ง ์ปจํธ๋กค๋ฌ์์ @SessionAttributes๋ก ์ง์ ํ ๊ฐ๋ง ๋ฌดํจํ์ํฌ ๋ ์ฌ์ฉํ๋ค.

```java
@Controller
@RequestMapping("/c03_3")
@SessionAttributes({"name","name2"})
public class Controller03_3 {

 @GetMapping(value = "h3", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String handler3(SessionStatus status) {
    
    status.setComplete();
   
    return "status.setComplete()";
  }
}
```
๊ฒฐ๊ณผ
```java
name=null, age=28, name2=null, age2=28
```