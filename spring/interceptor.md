## ๐ ์ธํฐ์ํฐ๋?
- ๐ธ ํ๋ก ํธ ์ปจํธ๋กค๋ฌ์ ํ์ด์ง ์ปจํธ๋กค๋ฌ ์ฌ์ด์ ์ฝ๋๋ฅผ ์ฝ์ํ๋ ๊ธฐ์ 
- ๐ธ ํ๋ก ํธ ์ปจํธ๋กค๋ฌ์ ๋ทฐ ์ปดํฌ๋ํธ ์ฌ์ด์ ์ฝ๋๋ฅผ ์ฝ์ํ๋ ๊ธฐ์ 


- ๐ธ ๊ด๋ฆฌ์ ํ์ด์ง์ ์ ๊ทผํ๊ธฐ ์ ์ ๊ด๋ฆฌ์ ์ธ์ฆ์ ํ๋ ์ฉ๋๋ก ํ์ฉ๋  ์ ์๋ค.
-  Interceptor๋ฅผ ์ด์ฉํ์ฌ ๋ก๊ทธ์ธ ์ฒ๋ฆฌ
    - Controller๊ฐ ์คํ๋๊ธฐ ์  interceptor๊ฐ ๊ฐ๋ก์ฑ์ ๋ฏธ๋ฆฌ ์์ฑํด๋์๋ XxxInterceptor ๊ฐ์ฒด์ preHandle() ๋ฉ์๋๊ฐ ์คํ๋์ด ๋ก๊ทธ์ธ ๊ณผ์ ์ ์ฒ๋ฆฌํ  ๊ฒ
    - ์ปจํธ๋กค๋ฌ์์ ํด๋น URL์ ์ฒ๋ฆฌํ๊ธฐ ์ํ ๋ฉ์๋๊ฐ ํ์ ์๊ฒ ๋  ๊ฒ
- ๐ธ Servlet์ Filter์ ๊ทธ ์ญํ ์ด ์ ์ฌํ๋ฐ, Filter์ Interceptor๋ ๋ถ๋ชํ ๋ค๋ฅด๋ค.

### ๐ฃ ์ธํฐ์ํฐ ๋ฐฐ์นํ๊ธฐ
- ํ๋ก ํธ ์ปจํธ๋กค๋ฌ์ IoC ์ค์  ํ์ผ์ ๋ฐฐ์น ์ ๋ณด๋ฅผ ์ถ๊ฐํ๋ค.

### ๐ฃ ์ธํฐ์ํฐ ๋ง๋ค์ด๋ณด๊ธฐ

```java
public class Controller04_1_Interceptor1 implements HandlerInterceptor {
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    // ํ์ด์ง ์ปจํธ๋กค๋ฌ์ ํธ๋ค๋ฌ๋ฅผ ํธ์ถํ๊ธฐ ์ ์ ์ด ๋ฉ์๋๊ฐ ๋จผ์  ํธ์ถ๋๋ค.
    System.out.println("Interceptor1.preHandle()");

    // ๋ค์ ์ธํฐ์ํฐ๋ ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ฅผ ๊ณ์ ์คํํ๊ณ  ์ถ๋ค๋ฉด true๋ฅผ ๋ฆฌํดํ๋ค.
    // ์ฌ๊ธฐ์ ์์ฒญ ์ฒ๋ฆฌ๋ฅผ ์๋ฃํ๊ณ  ์ถ๋ค๋ฉด false๋ฅผ ๋ฆฌํดํ๋ค.
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // ํ์ด์ง ์ปจํธ๋กค๋ฌ์ ํธ๋ค๋ฌ๊ฐ ๋ฆฌํดํ ํ ์ด ๋ฉ์๋๊ฐ ํธ์ถ๋๋ค.
    System.out.println("Interceptor1.postHandle()");
  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    // JSP๋ฅผ ์คํํ ํ ์ด ๋ฉ์๋๊ฐ ํธ์ถ๋๋ค.
    System.out.println("Interceptor1.afterCompletion()");
  }
}
```

```java
Controller 
@RequestMapping("/c04_1")
public class Controller04_1 {

  @GetMapping("h1")
  public String handler1() {
    System.out.println("c04_1.handler1() ํธ์ถ");
    return "c04_1";
  }

  @GetMapping("a/h2")
  public String handler2() {
    System.out.println("c04_1.handler2() ํธ์ถ");
    return "c04_1";
  }
  
 
  @GetMapping("b/h3")
  public String handler3() {
    System.out.println("c04_1.handler3() ํธ์ถ");
    return "c04_1";
  }

}
```







## ๐ @SessionAttributes, @ModelAttribute
## ๐ ์ธ์์ ๊ฐ์ ๋ฌดํจํ์ํค๋ ๋ฐฉ๋ฒ
