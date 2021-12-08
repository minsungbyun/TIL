## 📌 페이지 컨트롤러 만드는 방법

```java
@Controller // 너는 이제부터 컨트롤러야
@RequestMapping("/c01_1") // 컨트롤러에 URL을 매핑하지요
@RequestMapping // RequestHandler의 어노테이션 : 요청이 들어왔을 때 호출될 메서드임을 표시한다.
@ResponseBody // 메서드의 리턴 값이 클라이언트에게 출력할 내용임을 표시한다. View 컴포넌트로 보낼려면 빼면 됨
```

- 🗸  URL 한 개 당 한 개의 핸들러만 연결할 수 있다.
- 🗸  같은 URL에 대해 다른 메서드를 또 정의하면 실행 오류가 발생한다.

```java
@Controller 
@RequestMapping("/c01_1") 
public class Controller01_1 {

  @RequestMapping 
  @ResponseBody 
  public String handler() {
    return "c01_1 -> handler()";
  }

  //@RequestMapping 주석 풀면 오류발생!
  @ResponseBody
  public String handler2() {
    return "c01_1 -> handler2()";
  }
}
```

## 📌 페이지 컨트롤러 만드는 방법 - 한 개의 페이지 컨트롤러에 여러 개의 요청 핸들러 두기

- 🗸  요청이 들어 왔을 때 호출되는 메서드를 "RequestHandler" 라 부른다.

🗸 핸들러에서 URL을 지정하는 방법 1 - path 사용
```java
@Controller
public class Controller01_2 {

  @RequestMapping(path = {"/c01_2_h1"}) 
  @ResponseBody
  public String handler() {
    return "c01_2_h1";
  }
```

🗸 핸들러에서 URL을 지정하는 방법 2 - value 사용
```java
@Controller
public class Controller01_2 {

  @RequestMapping(value = {"/c01_2_h2"}) 
  @ResponseBody
  public String handler2() {
    return "c01_2_h2";
  }
```

🗸 디렉토리 형식으로 지정하는 방법 1 - path, value 생략
```java
@Controller
public class Controller01_2 {

  @RequestMapping({"/c01_2/h3"}) 
  @ResponseBody
  public String handler3() {
    return "/c01_2/h3";
  }
```

🗸 디렉토리 형식으로 지정하는 방법 2 - 중괄호 생략
```java
@Controller
public class Controller01_2 {

  @RequestMapping("/c01_2/h4")
  @ResponseBody
  public String handler4() {
    return "/c01_2/h4";
  }
```

🗸 한 개의 RequestHandler에 여러 개의 URL을 매핑하는 방법 - 중괄호 사용
```java
@Controller
public class Controller01_2 {

  @RequestMapping({"/c01_2/h5", "/c01_2/h6", "/c01_2/h7"})
  @ResponseBody
  public String handler5() {
    return "/c01_2/h5,h6,h7";
```

## 📌 페이지 컨트롤러 만드는 방법 - 기본 URL과 상세 URL을 분리하여 설정하기

```java
@Controller
@RequestMapping("/c01_3") // 핸들러에 적용될 기본 URL을 지정한다.
public class Controller01_3 {

  @RequestMapping("/h1") // 기본 URL에 뒤에 붙는 상세 URL. 예) /c01_3/h1
  @ResponseBody
  public String handler() {
    return "h1";
  }
```

```java
@Controller
@RequestMapping("/c01_3") // 핸들러에 적용될 기본 URL을 지정한다.
public class Controller01_3 {

  @RequestMapping("h2") // 앞에 /를 붙여도 되고 생략해도 된다. 예) /c01_3/h2
  @ResponseBody
  public String handler2() {
    return "h2";
  }
```

```java
@Controller
@RequestMapping("/c01_3") // 핸들러에 적용될 기본 URL을 지정한다.
public class Controller01_3 {

  @RequestMapping({"h3", "h4", "h5"})
  @ResponseBody
  public String handler3() {
    return "h5,h6,h7";
  }
```

