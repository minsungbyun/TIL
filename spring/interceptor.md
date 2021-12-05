## 📌 인터셉터란?
- 🗸 프론트 컨트롤러와 페이지 컨트롤러 사이에 코드를 삽입하는 기술
- 🗸 프론트 컨트롤러와 뷰 컴포넌트 사이에 코드를 삽입하는 기술


- 🗸 관리자 페이지에 접근하기 전에 관리자 인증을 하는 용도로 활용될 수 있다.
-  Interceptor를 이용하여 로그인 처리
    - Controller가 실행되기 전 interceptor가 가로채서 미리 작성해두었던 XxxInterceptor 객체의 preHandle() 메서드가 실행되어 로그인 과정을 처리할 것
    - 컨트롤러에서 해당 URL을 처리하기 위한 메서드가 필요 없게 될 것
- 🗸 Servlet의 Filter와 그 역할이 유사한데, Filter와 Interceptor는 분명히 다르다.

### 🟣 인터셉터 배치하기
- 프론트 컨트롤러의 IoC 설정 파일에 배치 정보를 추가한다.

### 🟣 인터셉터 만들어보기

```java
public class Controller04_1_Interceptor1 implements HandlerInterceptor {
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    // 페이지 컨트롤러의 핸들러를 호출하기 전에 이 메서드가 먼저 호출된다.
    System.out.println("Interceptor1.preHandle()");

    // 다음 인터셉터나 페이지 컨트롤러를 계속 실행하고 싶다면 true를 리턴한다.
    // 여기서 요청 처리를 완료하고 싶다면 false를 리턴한다.
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // 페이지 컨트롤러의 핸들러가 리턴한 후 이 메서드가 호출된다.
    System.out.println("Interceptor1.postHandle()");
  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    // JSP를 실행한 후 이 메서드가 호출된다.
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
    System.out.println("c04_1.handler1() 호출");
    return "c04_1";
  }

  @GetMapping("a/h2")
  public String handler2() {
    System.out.println("c04_1.handler2() 호출");
    return "c04_1";
  }
  
 
  @GetMapping("b/h3")
  public String handler3() {
    System.out.println("c04_1.handler3() 호출");
    return "c04_1";
  }

}
```







## 📌 @SessionAttributes, @ModelAttribute
## 📌 세션의 값을 무효화시키는 방법
