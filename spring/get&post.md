## 📌 GET, POST 구분하기

### 🟣 GET

- 🗸 첫 번째 방법 - @RequestMapping
```java
@Controller
@RequestMapping("/c02_1")
public class Controller02_1 {

  @RequestMapping(method = RequestMethod.GET) // GET 요청일 때만 호출된다.
  @ResponseBody
  public String handler1() {
    return "get";
  }
}
```

- 🗸 두 번째 방법 - @GetMapping
```java
@Controller
@RequestMapping("/c02_2")
public class Controller02_2 {

  @GetMapping 
  @ResponseBody
  public String handler1() {
    return "get";
  }
}
```

### 🟣 POST

- 🗸 첫 번째 방법 - @RequestMapping
```java
@Controller
@RequestMapping("/c02_1")
public class Controller02_1 {

  @RequestMapping(method = RequestMethod.POST) 
  @ResponseBody
  public String handler2() {
    return "post";
  }
}
```
- 🗸 두 번째 방법 - @PostMapping
```java
@Controller
@RequestMapping("/c02_2")
public class Controller02_2 {

  @PostMapping 
  @ResponseBody
  public String handler2() {
    return "post";
  }
}
```

## 📌RequestHandler를 구분하는 방법 - 파라미터 이름으로 구분하기 : params


```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {

  @GetMapping(params = "name")
  @ResponseBody
  public String handler1() {
    return "handler1";
  }
```

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {

  @GetMapping(params = {"age", "name"})
  @ResponseBody
  public String handler3() {
    return "handler3";
  }
```

## 📌RequestHandler를 구분하는 방법 - 요청 헤더 이름으로 구분하기

```java
@Controller
@RequestMapping("/c03_2")
public class Controller03_1 {

  @GetMapping(params = {"age", "name"})
  @ResponseBody
  public String handler3() {
    return "handler3";
  }
```

## 📌RequestHandler를 구분하는 방법 - Accept 요청 헤더의 값에 따라 구분하기

- 🗸 Accept 헤더란?
    - 🗸 HTTP 클라이언트(웹 브라우저)에서 서버에 요청할 때 받고자 하는 콘텐트의 타입을 알려준다.

### 🗸 1. text/plain
```java
@Controller
@RequestMapping("/c03_3")
public class Controller03_4 {

  @GetMapping(produces = "text/plain")
  @ResponseBody
  public String handler1() {
    return "handler1";
  }
```

### 🗸 2. text/html
```java
@Controller
@RequestMapping("/c03_3")
public class Controller03_4 {

  @GetMapping(produces = "text/html")
  @ResponseBody
  public String handler2() {
    return "handler2";
  }
```

### 🗸 3. application/json
```java
@Controller
@RequestMapping("/c03_3")
public class Controller03_4 {

  @GetMapping(produces = "application/json")
  @ResponseBody
  public String handler3() {
    return "handler3";
  }
```


## 📌RequestHandler를 구분하는 방법 - Content-Type 헤더의 값에 따라 구분하기

- 🗸 Content-Type 요청 헤더란?
    - 🗸 HTTP 클라이언트가 보내는 데이터의 콘텐트 타입이다.
    - 🗸 프론트 컨트롤러는 보내는 데이터의 타입에 따라 처리를 구분할 수 있다.

- 🗸 클라이언트가 POST로 요청할 때 보내는 데이터의 유형에 따라 호출될 메서드를 구분할 때 사용한다.
    - 🗸 <form> 태그에서 enctype 속성에 "mulpart/form-data"를 지정하면 해당 형식으로 서버에 값을 보낸다.

### 🗸 1. application/x-www-form-urlencoded
```java
@Controller
@RequestMapping("/c03_4")
public class Controller03_4 {

  @PostMapping(consumes = "application/x-www-form-urlencoded")
  @ResponseBody
  public String handler1() {
    return "handler1";
  }
```

### 🗸 2. multipart/form-data
```java
@Controller
@RequestMapping("/c03_4")
public class Controller03_4 {

  @PostMapping(consumes = "multipart/form-data")
  @ResponseBody
  public String handler2() {
    return "handler2";
  }
```

### 🗸 3. text/csv 
```java
@Controller
@RequestMapping("/c03_4")
public class Controller03_4 {

  @PostMapping(consumes = "text/csv")
  @ResponseBody
  public String handler3() {
    return "handler3";
  }
```

### 🗸 4. application/json
```java
@Controller
@RequestMapping("/c03_4")
public class Controller03_4 {

  @PostMapping(consumes = "application/json")
  @ResponseBody
  public String handler4() {
    return "handler4";
  }
```

## 📌 RequestHandler - @Cookie

```java
클라이언트가 보낸 쿠키 꺼내기

=> @CookieValue(쿠키명) 애노테이션을 RequestHandler의 아규먼트 앞에 붙인다.
```
```java
@Controller
@RequestMapping("/c04_7")
public class Controller04_7 {

  @GetMapping("h1")
  @ResponseBody
  public void handler1(
      PrintWriter out,
      HttpServletResponse response
      ) {
    // 이 메서드에서 쿠키를 클라이언트로 보낸다.
    try {
  
      response.addCookie(new Cookie("name1", "AB가각"));
      response.addCookie(new Cookie("name2", URLEncoder.encode("AB가각", "UTF-8")));
      response.addCookie(new Cookie("name3", "HongKildong"));
      response.addCookie(new Cookie("age", "30"));
      response.addCookie(new Cookie("default", null));

    } catch (Exception e) {
      e.printStackTrace();
    }

    out.println("send cookie!");
  }

  @GetMapping(value = "h2", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String handler2(
      @CookieValue(value = "name1", required = false) String name1,
      @CookieValue(value = "name2", defaultValue = "") String name2,
      @CookieValue(value = "name3", defaultValue = "홍길동") String name3,
      @CookieValue(value = "age", defaultValue = "0") int age, // String ===> int 자동 변환
      @CookieValue(value = "default", defaultValue = "11111") int defaultValueTest
      ) throws Exception {

    System.out.println("name1 쿠키 => " + name1);
    System.out.println("name2 쿠키 => " + name2);
    System.out.println("name3 쿠키 => " + name3);
    System.out.println("age 쿠키 => " + age);
    System.out.println("defaultValueTest 쿠키 => " + defaultValueTest);
     }
}

```
```java
name1 쿠키 => AB가각
name2 쿠키 => ABê°ê°
name3 쿠키 => HongKildong
age 쿠키 => 30
defaultValueTest 쿠키 => 11111
```



