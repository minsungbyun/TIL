## ๐ ๊ธฐ๋ณธ View Resolver ์ฌ์ฉํ๊ธฐ

### ๐ฃ ViewResolver๋?
- ๐ธ ์คํํ  ๋ทฐ๋ฅผ ์ฐพ๋ ์ผ์ ํ๋ค.
- ๐ธ ํ์ด์ง ์ปจํธ๋กค๋ฌ๊ฐ ๋ฆฌํดํ ๋ทฐ ์ด๋ฆ์ ํด๋นํ๋ ๋ทฐ ์ฝคํฌ๋ํธ๋ฅผ ์ฐพ๋ ์ญํ .

### ๐ฃ ์ข๋ฅ๋?
- ๐ธ ResourceBundleViewResolver
    - ๐ธ *.properties ์์ ๋ทฐ ์ด๋ฆ์ ํด๋นํ๋ ์ฝคํฌ๋ํธ์ URL์ ์ฐพ๋๋ค.
- ๐ธ InternalResouceViewResolver
    - ๐ธ ๋ฏธ๋ฆฌ ์ง์ ๋ ์ ๋์ฌ, ์ ๋ฏธ์ฌ๋ฅผ ์ฌ์ฉํ์ฌ ๋ทฐ์ด๋ฆ์ผ๋ก ์ฝคํฌ๋ํธ์ URL์ ์์ฑํด URL์ ์ง์ ํ๊ธฐ ํธ๋ฆฌํ๋ค.
    - ๐ธ ๊ต์ฒด ๋ฐฉ๋ฒ์ XML์์ ์ค์ ํ๋ ๋ฐฉ๋ฒ๊ณผ Java Config๋ก ์ค์ ํ๋ ๋ฐฉ๋ฒ์ด ์๋ค.

### ๐ฃ ์คํ๊ณผ์     

1. ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ ํด๋ผ์ด์ธํธ๊ฐ ์์ฒญํ ์์์ ์คํํ ํ ๊ทธ ๊ฒฐ๊ณผ๋ฅผ ์ถ๋ ฅํ  ๋ทฐ์ ์ด๋ฆ์ ๋ฆฌํดํ๋ค.
2. ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ RequestHandler๊ฐ ๋ฆฌํดํ URL์ ViewResolver์๊ฒ ์ ๋ฌํ๋ค.
3. ViewResolver๋ ์์ ์ ์ ์ฑ์ ๋ง์ถฐ์ ๋ทฐ URL์ ์ค๋นํ๋ค.
4. InternalResourceViewResolver์ ๊ฒฝ์ฐ RequestHandler๊ฐ ๋ฆฌํดํ URL ์, ๋ค์ ์ ๋์ฌ์ ์ ๋ฏธ์ฌ๋ฅผ ๋ถ์ฌ JSP๋ฅผ ์ฐพ๋๋ค.
5. ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ViewResolver๊ฐ ์ค๋นํ URL์ ๊ฐ์ง๊ณ  View ๊ฐ์ฒด๋ฅผ ํตํด ํด๋น URL์ ์์์ ์คํํ๋ค.

### ๐ฃ ์ฐธ๊ณ ์ฌํญ
- ๐ธ MVC ๋ชจ๋ธ์์๋ JSP๋ ๋ทฐ ์ฝคํฌ๋ํธ๋ก์ ์ถ๋ ฅ์ด๋ผ๋ ์ญํ ์ ๋ด๋นํ๋ค.
- ๐ธ ์ถ๋ ฅํ  ๋ฐ์ดํฐ๋ฅผ ์ค๋นํ๋ ์ผ์ ํ์ด์ง ์ปจํธ๋กค๋ฌ๊ฐ ๋ด๋นํ๋ค.
- ๐ธ JSP๋ฅผ ์คํํ  ๋๋ ํญ์ ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ฅผ ํตํด ์คํํด์ผ ํ๋ค.
- ๐ธ ํ์ด์ง ์ปจํธ๋กค๋ฌ๊ฐ ํ๋ ์ผ์ด ์์ด๋ ํ๋ก๊ทธ๋๋ฐ์ ์ผ๊ด์ฑ์ ์ํด ์  JSP์ ์์ฒญํ์ง ์๊ณ , ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ฅผ ํตํด ์์ฒญํด์ผ ํ๋ค.
- ๐ธ JSP ํ์ผ์ /WEB-INF ํด๋ ์๋์ ๋๋ ๊ฒ์ ๊ถ์ฅํ๋ค.


-  ๐ธ @ResponseBody - ๋ทฐ ์ด๋ฆ์ ๋ฆฌํด ํ  ๋๋ ์ด ์ ๋ธํ์ด์์ ๋ถ์ด๋ฉด ์๋๋ค.
- ๐ธ ๊ธฐ๋ณธ ViewResolver๋ ๋ฆฌํด ๊ฐ์ผ๋ก URL์ ๋ฐ์ ์น ์ ํ๋ฆฌ์ผ์ด์ ๋๋ ํ ๋ฆฌ์์ JSP๋ฅผ ์ฐพ๋๋ค.
- ๐ธ ๊ธฐ๋ณธ ViewRosolver๋ฅผ ์ฌ์ฉํ  ๋๋ ๋ทฐ ์ด๋ฆ์ ๋ฆฌํดํ์ง ์์ผ๋ฉด ์ค๋ฅ ๋ฐ์!

```java
@Controller
@RequestMapping("/c01_1")
public class Controller01_1 {
    @GetMapping("h1")
  public String handler1(Model model) {

    model.addAttribute("name", "๋ฏผ์ฑ");
    model.addAttribute("age", 28);

    return "/jsp/c01_1.jsp";
  }
}
```

```java
@Controller
@RequestMapping("/c01_1")
public class Controller01_1 {
   @GetMapping("h2")
  public void handler2(Model model) {
    model.addAttribute("name", "๋ฏผ์ฑ2");
    model.addAttribute("age", 28);
  }
}
```

```java
@Controller
@RequestMapping("/c01_1")
public class Controller01_1 {
    @GetMapping("h3")
  public String handler3(Map<String, Object> map) {

    map.put("name", "๋ฏผ์ฑ3");
    map.put("age", 28);

    return "/WEB-INF/jsp/c01_1.jsp";
  }
}
```

## ๐ ๊ธฐ๋ณธ View Resolver ๊ต์ฒด - InternalResourceViewResolver ์ฌ์ฉํ๊ธฐ

- XML์์ ์ค์ ํ๋ ๋ฐฉ๋ฒ๊ณผ Java Config(@Bean)๋ก ์ค์ ํ๋ ๋ฐฉ๋ฒ์ผ๋ก ๊ผญ ๋ฑ๋กํ๊ณ  ์ฌ์ฉํ์.
- RequestHandler๊ฐ ๋ฆฌํดํ URL ์, ๋ค์ ์ ๋์ฌ์ ์ ๋ฏธ์ฌ๋ฅผ ๋ถ์ฌ JSP๋ฅผ ์ฐพ๋๋ค.
- RequestHandler๊ฐ ๋ทฐ ์ด๋ฆ์ ๋ฆฌํดํ์ง ์์ผ๋ฉด RequestHandler์ URL์ ๋ทฐ ์ด๋ฆ์ผ๋ก ์ฌ์ฉํ๋ค. ์ค๋ฌด์์ ๋ง์ด ์ฌ์ฉํ๋ ๋ฐฉ๋ฒ์ด๋ค.


### ๐ฃ Map ์ฌ์ฉํ๊ธฐ
```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h1")
  public String handler1(Map<String, Object> map) {

    map.put("name", "๋ฏผ์ฑ");
    map.put("age", 28);

    return "c01_2/h1";
    ///WEB-INF/jsp2/c01_1/h1.jsp
  }
}
```

```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h3")
  public Map<String, Object> handler3() {

    HashMap<String, Object> map = new HashMap<>();
    map.put("name", "๋ฏผ์ฑ3");
    map.put("age", 28);

    return map;
  }
}
```
### ๐ฃ Model ์ฌ์ฉํ๊ธฐ
```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h2")
  public void handler2(Model model) {

    model.addAttribute("name", "๋ฏผ์ฑ2");
    model.addAttribute("age", 28);
  }

}
```
### ๐ฃ ModelAndView ์ฌ์ฉํ๊ธฐ
- ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ModelAndView ๊ฐ์ฒด์ ๋ณด๊ด๋์ด ์๋ ๊ฐ๋ค์ ServletRequest ๋ณด๊ด์๋ก ์ฎ๊ธฐ๊ณ , ์ค์ ๋ ๋ทฐ ์ด๋ฆ์ ViewResolver์๊ฒ ๋๊ธด๋ค.
- ๋ทฐ ์ด๋ฆ์ ์ง์ ํ์ง ์์ผ๋ฉด RequestHandler์ path๋ฅผ ViewResolver์๊ฒ ๋๊ธด๋ค.

```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h4")
  public ModelAndView handler4() {

    ModelAndView mv = new ModelAndView();
    mv.addObject("name", "๋ฏผ์ฑ3");
    mv.addObject("age", 28);
    mv.setViewName("c01_2/h4");

    return mv;
  }

}
```
```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
 @GetMapping("h5")
  public ModelAndView handler5() {

    ModelAndView mv = new ModelAndView();
    mv.addObject("name", "๋ฏผ์ฑ3");
    mv.addObject("age", 28);

    return mv;
  }
}
```

## ๐ URL ์์ ๊ฐ ์ถ์ถํ๊ธฐ - @PathVariable

-  ๐ธ REST API์์ ๊ฐ์ ํธ์ถํ  ๋ ์ฃผ๋ก ๋ง์ด ์ฌ์ฉํ๋ค.
- ๐ธ ๊ฒ์๋ฌผ ์ญ์ ๋ฅผ ํ  ๋๋ ์ฌ์ฉํ๋ค.
- ๐ธ ํด๋ผ์ด์ธํธ๋ก๋ถํฐ ๊ฐ์ ๋ฐ๋ ์ผ๋ฐ์ ์ธ ๋ฐฉ๋ฒ
    -  ๐ธ Query String ์ผ๋ก ๋ฐ๋๋ค.

- ๐ธ URL path์ ๊ฐ์ ํฌํจํ์ฌ ์ ๋ฌํ  ์ ์๊ณ , ๊ทธ ๊ฐ์ ์๊ท๋จผํธ๋ก ๋ฐ์ ์ ์๋ค.   
- ๐ธ URL path์ ํฌํจ๋ ๊ฐ์ ๋ฐ์ผ๋ ค๋ฉด 
    - => .../{๋ณ์๋ช}/{๋ณ์๋ช}
- ๐ธ ๋ณ์๋ช๊ณผ ์๊ท๋จผํธ์ ์ด๋ฆ์ด ๊ฐ๋ค๋ฉด, ๋ณ์๋ช์ ์๋ตํ  ์ ์๋ค.    

### ๋ฐฉ๋ฒ 1
```java
@Controller
@RequestMapping("/c02_1")
public class Controller02_1 {
//.../c02_1?name=byun&age=28
  @GetMapping
  @ResponseBody
  public String handler1(String name, int age) {
       return String.format("name=%s, age=%d", name, age);
  }
}
```
๊ฒฐ๊ณผ
```java
name=byun, age=28
```
### ๋ฐฉ๋ฒ 2
```java
@Controller
@RequestMapping("/c02_1")
public class Controller02_1 {
//.../c02_1/byun/28
   @GetMapping("{name}/{age}")
  @ResponseBody
  public String handler2(
      /*
      @PathVariable("name") String name,
      @PathVariable("age") int age
       */
      @PathVariable String name,
      @PathVariable int age
      ) {
   
    return String.format("name=%s, age=%d", name, age);
  }
}
```
๊ฒฐ๊ณผ
```java
name=byun, age=28
```
### ๋ฐฉ๋ฒ 3
```java
@Controller
@RequestMapping("/c02_1")
public class Controller02_1 {
//.../c02_1/byun_28
  @GetMapping("{name}_{age}")
  @ResponseBody
  public String handler3(
      @PathVariable String name,
      @PathVariable int age
      ) {
    return String.format("name=%s, age=%d", name, age);
  }
}
```
๊ฒฐ๊ณผ
```java
name=byun, age=28
```




