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



