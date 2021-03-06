## ๐ RequestHandler - @ReponseBody

### ๐ฃ 1. ์ฝํํธ๋ฅผ ์ง์  ๋ฆฌํดํ๊ธฐ


- ๐ธ ๋ฆฌํด ๊ฐ์ด ํด๋ผ์ด์ธํธ์๊ฒ ๋ณด๋ด๋ ์ฝํํธ๋ผ๋ฉด ๋ฉ์๋ ์ ์ธ๋ถ์ @ResponseBody๋ฅผ ๋ถ์ธ๋ค.

- ๐ธ ๋ถ์ด์ง ์์ผ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ view URL๋ก ์ธ์ํ๋ค.

- ๐ธ ์ถ๋ ฅ ์ฝํํธ๋ ๋ธ๋ผ์ฐ์ ์์ ๊ธฐ๋ณธ์ผ๋ก HTML๋ก ๊ฐ์ฃผํ๋ค.

- ๐ธ ๋จ ํ๊ธ์ ISO-8859-1 ๋ฌธ์ํ์ ์ ์๋ ์ฝ๋๊ฐ ์๋๊ธฐ ๋๋ฌธ์ ํด๋ผ์ด์ธํธ๋ก ๋ณด๋ผ ๋ '?' ๋ฌธ์๋ก ๋ฐ๊ฟ ๋ณด๋ธ๋ค.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping("h1")
  @ResponseBody
  public String handler1() {    
    return "<html><body><h1>minsungbyun && ๋ณ๋ฏผ์ฑ</h1></body></html>";
  }
}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ???
```

Q. ํ๊ธ ?์ ํด๊ฒฐํ๋ ค๋ฉด ์ด๋ป๊ฒ ํด์ผํ ๊น?
### โ๏ธ ๋ฆฌํด๋๋ ์ฝํํธ์ MIME ํ์๊ณผ charset์ ์ง์ ํ๊ณ  ์ถ๋ค๋ฉด ์ด๋ธํ์ด์์ produces ํ๋กํผํฐ์ ์ค์ ํด์ค๋ค.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping(value = "h2", produces = "text/html;charset=UTF-8")
  @ResponseBody
  public String handler2() {
    return "<html><body><h1>minsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>";
  }
}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ๋ณ๋ฏผ์ฑ
```

### โ๏ธ HttpServletResponse์ ๋ํด ๋ค์๊ณผ ๊ฐ์ด ์ฝํํธ ํ์์ ์ค์ ํด๋ด์ผ ์์ฉ์๋ค.


```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping("h3")
  @ResponseBody
  public String handler3(HttpServletResponse response) {

    response.setContentType("text/html;charset=UTF-8");

    return "<html><body><h1>minsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>";
  }
}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ???
```

### โ๏ธ HttpEntity ๊ฐ์ฒด ์ฌ์ฉ - @ResponseBody ์ ๋ธํ์ด์์ ๋ถ์ด์ง ์์๋ ๋๋ค.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h4")
  public HttpEntity<String> handler4(HttpServletResponse response) {
   
    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>minsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>");

    return entity;
}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ???
```
- ๐ธ ์ด ๊ฒฝ์ฐ์๋ ์ถ๋ ฅํ  ๋ ISO-8859-1 ๋ฌธ์ํ์ ์ฝ๋๋ก ๋ณํํ์ฌ ์ถ๋ ฅํ๋ค. ๊ทธ๋์ ํ๊ธ์ ? ๋ฌธ์๋ก ๋ณํ๋๋ค.

### โ๏ธ HttpEntity ๊ฐ์ฒด ์ฌ์ฉ - ํ๊ธ์ ์ ๋๋ก ์ถ๋ ฅํ๊ณ  ์ถ์ผ๋ฉด ์ ์ ๋ธํ์ด์์ produces ์์ฑ์ ์ฝํํธ ํ์์ ์ง์ ํ๋ค.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping(value = "h5", produces = "text/html;charset=UTF-8")
  public HttpEntity<String> handler5(HttpServletResponse response) {
   
    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>minsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>");

    return entity;
  }
}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ๋ณ๋ฏผ์ฑ
```

### โ๏ธ ResponseEntity ๊ฐ์ฒด ์ฌ์ฉ - ์๋ต ํค๋์ ์ง์  Content-Type์ ์ค์ ํ๊ธฐ

- ๐ธ ์๋ต ์ํ ์ฝ๋๋ฅผ ์ถ๊ฐํ๊ธฐ ํธํ๋ค.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h7")
  public ResponseEntity<String> handler7(HttpServletResponse response) {
    
    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/html;charset=UTF-8");

    // ์์์ ์๋ต ํค๋๋ฅผ ์ถ๊ฐ
    headers.add("MIN-OK", "minsung");

    ResponseEntity<String> entity = new ResponseEntity<>(
        "<html><body><h1>mminsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>",
        headers,
        HttpStatus.OK // ์๋ต ์ํ ์ฝ๋๋ฅผ ์ค์ ํ  ์ ์๋ค.
        );

    return entity;
  }

}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ๋ณ๋ฏผ์ฑ
```

### โ๏ธ HttpEntity ๊ฐ์ฒด ์ฌ์ฉ - ์๋ต ํค๋์ ์ง์  Content-Type์ ์ค์ ํ๊ธฐ

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h6")
  public HttpEntity<String> handler6(HttpServletResponse response) {
   
    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/html;charset=UTF-8");

    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>mminsungbyun && ๋ณ๋ฏผ์ฑ<h1></body></html>",
        headers);

    return entity;
  }

}
```
๊ฒฐ๊ณผ
```java
minsungbyun && ๋ณ๋ฏผ์ฑ
```
![์๋ตํค๋์ถ๊ฐ](https://user-images.githubusercontent.com/86590036/144701521-6d04ac3f-c6bb-41c0-a5a6-22af305bc029.PNG)


### ๐ฃ 2. view URL ๋ฆฌํดํ๊ธฐ, ๋ฆฌ๋ค์ด๋ ํธ, forward/include

#### โ๏ธ 1) ๋ฉ์๋ ์ ์ธ๋ถ์ @ResponseBody๋ฅผ ๋ถ์ด์ง ์์ผ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ view URL๋ก ๊ฐ์ฃผํ๋ค.

- ๐ธ ๋ฆฌํด URL์ '/'๋ ์น ์ ํ๋ฆฌ์ผ์ด์ ๋ฃจํธ๋ฅผ ์๋ฏธํ๋ค.

```java
@Controller
@RequestMapping("/c05_2")
public class Controller05_2 {
    @GetMapping("h1")
  public String handler1() {
    return "/jsp/c05_2.jsp";
  }
}
```
๊ฒฐ๊ณผ
```java
ํด๋น jsp๋ก ์ด๋ํ์์ต๋๋ค.
```

#### โ๏ธ 2) /WEB-INF ํด๋์ ์๋ ํ์ผ์ ํด๋ผ์ด์ธํธ์์ ์ง์  ์คํ์ ์์ฒญํ  ์ ์๋ค.

- ๐ธ MVC ํจํด์์๋ ํญ์ Controller์ ์ํด View๊ฐ ํต์ ๋์ด์ผ ํ๋ค.

- ๐ธ Controller๋ฅผ ๊ฒฝ์ ํ์ง ์๊ณ  View๋ฅผ ์คํํ๊ฒ ํด์๋ ์๋๋ค.
- ๐ธ ๊ทธ๋์ผ View์ ๋ํด ์ผ๊ด์ฑ ์๋ ์ ์ด๊ฐ ๊ฐ๋ฅํ๋ค

#### โ๏ธ view URL๋ก ๋ณด๋ด๋ 3๊ฐ์ง ๋ฐฉ๋ฒ

1. String์ผ๋ก ๋ณด๋ด๊ธฐ

```java
@GetMapping("h2")
  public String handler2() {
    return "/WEB-INF/jsp/c05_2.jsp";
  }

```
๊ฒฐ๊ณผ
```java
HTTP ์ํ 404 โ ์ฐพ์ ์ ์์
ํ์ ์ํ ๋ณด๊ณ 

๋ฉ์์ง ํ์ผ [/WEB-INF/jsp/c05_2.jsp]์(๋ฅผ) ์ฐพ์ ์ ์์ต๋๋ค.

์ค๋ช Origin ์๋ฒ๊ฐ ๋์ ๋ฆฌ์์ค๋ฅผ ์ํ ํ์ฌ์ representation์ ์ฐพ์ง ๋ชปํ๊ฑฐ๋, ๊ทธ๊ฒ์ด ์กด์ฌํ๋์ง๋ฅผ ๋ฐํ๋ ค ํ์ง ์์ต๋๋ค.

Apache Tomcat/9.0.54
```

2. View๋ก ๋ณด๋ด๊ธฐ

```java
@GetMapping("h3")
  public View handler3() {
    return new JstlView("/WEB-INF/jsp/c05_2.jsp");
  }
```
3. ModelAndView๋ก ๋ณด๋ด๊ธฐ

```java
@GetMapping("h4")
  public ModelAndView handler4() {
    System.out.println("===> /app1/c05_2/h4");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("/WEB-INF/jsp/c05_2.jsp");
    return mv;
  }
```


#### โ๏ธ 3) redirect๋ฅผ ์ง์ ํ  ๋๋ URL ์์ "redirect:" ์ ๋์ด๋ฅผ ๋ถ์ธ๋ค.

```java
@GetMapping("h5")
  public String handler5() {
    return "redirect:h4";
  }
```

#### โ๏ธ 4) forward๋ฅผ ์ง์ ํ  ๋๋ URL ์์ "forward:" ์ ๋์ด๋ฅผ ๋ถ์ธ๋ค. && ์ธํด๋ฃจ๋๋ฅผ ์ง์ ํ  ๋๋ URL ์์ "include:" ์ ๋์ด๋ฅผ ๋ถ์ธ๋ค.

```java
@GetMapping("h6")
  public String handler6() {
    return "forward:h4";
  }
```

### ๐ฃ 3. RequestHandler์์ view ์ปดํฌ๋ํธ(JSP) ์ชฝ์ ๋ฐ์ดํฐ ์ ๋ฌํ๊ธฐ

#### โ๏ธ ServletRequest์ ๋ด์์ ๋ณด๋ด๊ธฐ

```java
@Controller
@RequestMapping("/c05_3")
public class Controller05_3 {
     @GetMapping("h1")
  public String handler1(
      ServletRequest request) {

    // JSP๊ฐ ๊บผ๋ด ์ธ ์ ์๋๋ก ServletRequest ๊ฐ์ฒด์ ์ง์  ๋ด๋๋ค.
    request.setAttribute("name", "๋ฏผ์ฑ");
    request.setAttribute("age", 28); // auto-boxing: int ===> Integer ๊ฐ์ฒด
    request.setAttribute("working", true); // auto-boxing: boolean ===> Boolean ๊ฐ์ฒด

    return "/WEB-INF/jsp/c05_3.jsp";
  }
}
```
๊ฒฐ๊ณผ
```java
๊ฐ ๊บผ๋ด๊ธฐ
name = ๋ฏผ์ฑ
age = 28
working = true
```

#### โ๏ธ Map์ ๋ด์์ ๋ณด๋ด๊ธฐ

- ๐ธ ์๊ท๋จผํธ์ Map ํ์์ ๋ณ์๋ฅผ ์ ์ธํ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ๋น ๋งต ๊ฐ์ฒด๋ฅผ ๋ง๋ค์ด ๋๊ฒจ์ค๋ค.
- ๐ธ ์ด ๋งต ๊ฐ์ฒด์ ์ฉ๋๋ JSP์ ์ ๋ฌํ  ๊ฐ์ ๋ด๋ ์ฉ์ด๋ค.
- ๐ธ ๋งต ๊ฐ์ฒด์ ๊ฐ์ ๋ด์ ๋์ผ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๊ฐ JSP๋ฅผ ์คํํ๊ธฐ ์ ์ ServletRequest๋ก ๋ณต์ฌํ๋ค. ๋ฐ๋ผ์ ServletRequest์ ๊ฐ์ ๋ด๋ ๊ฒ๊ณผ ๊ฐ๋ค.

```java
 @GetMapping("h2")
  public String handler2(Map<String,Object> map) {
    map.put("name", "๋ฏผ์ฑ");
    map.put("age", 28); // auto-boxing
    map.put("working", true); // auto-boxing

    return "/WEB-INF/jsp/c05_3.jsp";
  }
```
๊ฒฐ๊ณผ
```java
๊ฐ ๊บผ๋ด๊ธฐ
name = ๋ฏผ์ฑ
age = 28
working = true
```

#### โ๏ธ Model์ ๋ด์์ ๋ณด๋ด๊ธฐ
- ๐ธ ์ด ๊ฐ์ฒด์ ์ฉ๋๋ Map ๊ฐ์ฒด์ ๊ฐ๋ค.

```java
@GetMapping("h3")
  public String handler3(Model model) {

    model.addAttribute("name", "๋ฏผ์ฑ");
    model.addAttribute("age", 28); // auto-boxing
    model.addAttribute("working", true); // auto-boxing

    return "/WEB-INF/jsp/c05_3.jsp";
  }

```
๊ฒฐ๊ณผ
```java
๊ฐ ๊บผ๋ด๊ธฐ
name = ๋ฏผ์ฑ
age = 28
working = true
```

#### โ๏ธ ModelAndView ๋ด์์ ๋ณด๋ด๊ธฐ

- ๐ธ RequestHandler์์ ModelAndView ๊ฐ์ฒด๋ฅผ ๋ง๋ค์ด ๋ฆฌํดํ๋ค.
- ๐ธ ์ด ๊ฐ์ฒด์ ์ฉ๋๋ Model๊ณผ view URL์ ํจ๊ป ๋ฆฌํดํ๋ ๊ฒ์ด๋ค.

```java
@GetMapping("h4")
  public ModelAndView handler4() {

    ModelAndView mv = new ModelAndView();

    // JSP๊ฐ ์ฌ์ฉํ  ๋ฐ์ดํฐ๋ฅผ ๋ด๊ณ 
    mv.addObject("name", "๋ฏผ์ฑ");
    mv.addObject("age", 28); // auto-boxing
    mv.addObject("working", true); // auto-boxing

    // JSP ์ฃผ์๋ ๋ด๋๋ค.
    mv.setViewName("/WEB-INF/jsp/c05_3.jsp");

    return mv;
  }

```
๊ฒฐ๊ณผ
```java
๊ฐ ๊บผ๋ด๊ธฐ
name = ๋ฏผ์ฑ
age = 28
working = true
```