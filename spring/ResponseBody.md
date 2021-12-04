## 📌 RequestHandler - @ReponseBody

### 🟣 1. 콘텐트를 직접 리턴하기


- 🗸 리턴 값이 클라이언트에게 보내는 콘텐트라면 메서드 선언부에 @ResponseBody를 붙인다.

- 🗸 붙이지 않으면 프론트 컨트롤러는 view URL로 인식한다.

- 🗸 출력 콘텐트는 브라우저에서 기본으로 HTML로 간주한다.

- 🗸 단 한글은 ISO-8859-1 문자표에 정의된 코드가 아니기 때문에 클라이언트로 보낼 때 '?' 문자로 바꿔 보낸다.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping("h1")
  @ResponseBody
  public String handler1() {    
    return "<html><body><h1>minsungbyun && 변민성</h1></body></html>";
  }
}
```
결과
```java
minsungbyun && ???
```

Q. 한글 ?을 해결하려면 어떻게 해야할까?
### ✔️ 리턴되는 콘텐트의 MIME 타입과 charset을 지정하고 싶다면 어노테이션의 produces 프로퍼티에 설정해준다.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping(value = "h2", produces = "text/html;charset=UTF-8")
  @ResponseBody
  public String handler2() {
    return "<html><body><h1>minsungbyun && 변민성<h1></body></html>";
  }
}
```
결과
```java
minsungbyun && 변민성
```

### ✔️ HttpServletResponse에 대해 다음과 같이 콘텐트 타입을 설정해봐야 소용없다.


```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

 @GetMapping("h3")
  @ResponseBody
  public String handler3(HttpServletResponse response) {

    response.setContentType("text/html;charset=UTF-8");

    return "<html><body><h1>minsungbyun && 변민성<h1></body></html>";
  }
}
```
결과
```java
minsungbyun && ???
```

### ✔️ HttpEntity 객체 사용 - @ResponseBody 애노테이션을 붙이지 않아도 된다.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h4")
  public HttpEntity<String> handler4(HttpServletResponse response) {
   
    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>minsungbyun && 변민성<h1></body></html>");

    return entity;
}
```
결과
```java
minsungbyun && ???
```
- 🗸 이 경우에는 출력할 때 ISO-8859-1 문자표의 코드로 변환하여 출력한다. 그래서 한글은 ? 문자로 변환된다.

### ✔️ HttpEntity 객체 사용 - 한글을 제대로 출력하고 싶으면 위 애노테이션의 produces 속성에 콘텐트 타입을 지정한다.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping(value = "h5", produces = "text/html;charset=UTF-8")
  public HttpEntity<String> handler5(HttpServletResponse response) {
   
    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>minsungbyun && 변민성<h1></body></html>");

    return entity;
  }
}
```
결과
```java
minsungbyun && 변민성
```

### ✔️ ResponseEntity 객체 사용 - 응답 헤더에 직접 Content-Type을 설정하기

- 🗸 응답 상태 코드를 추가하기 편하다.

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h7")
  public ResponseEntity<String> handler7(HttpServletResponse response) {
    
    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/html;charset=UTF-8");

    // 임의의 응답 헤더를 추가
    headers.add("MIN-OK", "minsung");

    ResponseEntity<String> entity = new ResponseEntity<>(
        "<html><body><h1>mminsungbyun && 변민성<h1></body></html>",
        headers,
        HttpStatus.OK // 응답 상태 코드를 설정할 수 있다.
        );

    return entity;
  }

}
```
결과
```java
minsungbyun && 변민성
```

### ✔️ HttpEntity 객체 사용 - 응답 헤더에 직접 Content-Type을 설정하기

```java
@Controller
@RequestMapping("/c05_1")
public class Controller05_1 {

  @GetMapping("h6")
  public HttpEntity<String> handler6(HttpServletResponse response) {
   
    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/html;charset=UTF-8");

    HttpEntity<String> entity = new HttpEntity<>(
        "<html><body><h1>mminsungbyun && 변민성<h1></body></html>",
        headers);

    return entity;
  }

}
```
결과
```java
minsungbyun && 변민성
```
![응답헤더추가](https://user-images.githubusercontent.com/86590036/144701521-6d04ac3f-c6bb-41c0-a5a6-22af305bc029.PNG)


### 🟣 2. view URL 리턴하기, 리다이렉트, forward/include

#### ✔️ 1) 메서드 선언부에 @ResponseBody를 붙이지 않으면 프론트 컨트롤러는 view URL로 간주한다.

- 🗸 리턴 URL의 '/'는 웹 애플리케이션 루트를 의미한다.

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
결과
```java
해당 jsp로 이동하였습니다.
```

#### ✔️ 2) /WEB-INF 폴더에 있는 파일은 클라이언트에서 직접 실행을 요청할 수 없다.

- 🗸 MVC 패턴에서는 항상 Controller에 의해 View가 통제되어야 한다.

- 🗸 Controller를 경유하지 않고 View를 실행하게 해서는 안된다.
- 🗸 그래야 View에 대해 일관성 있는 제어가 가능하다

#### ✔️ view URL로 보내는 3가지 방법

1. String으로 보내기

```java
@GetMapping("h2")
  public String handler2() {
    return "/WEB-INF/jsp/c05_2.jsp";
  }

```
결과
```java
HTTP 상태 404 – 찾을 수 없음
타입 상태 보고

메시지 파일 [/WEB-INF/jsp/c05_2.jsp]을(를) 찾을 수 없습니다.

설명 Origin 서버가 대상 리소스를 위한 현재의 representation을 찾지 못했거나, 그것이 존재하는지를 밝히려 하지 않습니다.

Apache Tomcat/9.0.54
```

2. View로 보내기

```java
@GetMapping("h3")
  public View handler3() {
    return new JstlView("/WEB-INF/jsp/c05_2.jsp");
  }
```
3. ModelAndView로 보내기

```java
@GetMapping("h4")
  public ModelAndView handler4() {
    System.out.println("===> /app1/c05_2/h4");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("/WEB-INF/jsp/c05_2.jsp");
    return mv;
  }
```


#### ✔️ 3) redirect를 지정할 때는 URL 앞에 "redirect:" 접두어를 붙인다.

```java
@GetMapping("h5")
  public String handler5() {
    return "redirect:h4";
  }
```

#### ✔️ 4) forward를 지정할 때는 URL 앞에 "forward:" 접두어를 붙인다. && 인클루드를 지정할 때는 URL 앞에 "include:" 접두어를 붙인다.

```java
@GetMapping("h6")
  public String handler6() {
    return "forward:h4";
  }
```

### 🟣 3. RequestHandler에서 view 컴포넌트(JSP) 쪽에 데이터 전달하기

#### ✔️ ServletRequest에 담아서 보내기

```java
@Controller
@RequestMapping("/c05_3")
public class Controller05_3 {
     @GetMapping("h1")
  public String handler1(
      ServletRequest request) {

    // JSP가 꺼내 쓸 수 있도록 ServletRequest 객체에 직접 담는다.
    request.setAttribute("name", "민성");
    request.setAttribute("age", 28); // auto-boxing: int ===> Integer 객체
    request.setAttribute("working", true); // auto-boxing: boolean ===> Boolean 객체

    return "/WEB-INF/jsp/c05_3.jsp";
  }
}
```
결과
```java
값 꺼내기
name = 민성
age = 28
working = true
```

#### ✔️ Map에 담아서 보내기

- 🗸 아규먼트에 Map 타입의 변수를 선언하면 프론트 컨트롤러는 빈 맵 객체를 만들어 넘겨준다.
- 🗸 이 맵 객체의 용도는 JSP에 전달할 값을 담는 용이다.
- 🗸 맵 객체에 값을 담아 놓으면 프론트 컨트롤러가 JSP를 실행하기 전에 ServletRequest로 복사한다. 따라서 ServletRequest에 값을 담는 것과 같다.

```java
 @GetMapping("h2")
  public String handler2(Map<String,Object> map) {
    map.put("name", "민성");
    map.put("age", 28); // auto-boxing
    map.put("working", true); // auto-boxing

    return "/WEB-INF/jsp/c05_3.jsp";
  }
```
결과
```java
값 꺼내기
name = 민성
age = 28
working = true
```

#### ✔️ Model에 담아서 보내기
- 🗸 이 객체의 용도는 Map 객체와 같다.

```java
@GetMapping("h3")
  public String handler3(Model model) {

    model.addAttribute("name", "민성");
    model.addAttribute("age", 28); // auto-boxing
    model.addAttribute("working", true); // auto-boxing

    return "/WEB-INF/jsp/c05_3.jsp";
  }

```
결과
```java
값 꺼내기
name = 민성
age = 28
working = true
```

#### ✔️ ModelAndView 담아서 보내기

- 🗸 RequestHandler에서 ModelAndView 객체를 만들어 리턴한다.
- 🗸 이 객체의 용도는 Model과 view URL을 함께 리턴하는 것이다.

```java
@GetMapping("h4")
  public ModelAndView handler4() {

    ModelAndView mv = new ModelAndView();

    // JSP가 사용할 데이터를 담고
    mv.addObject("name", "민성");
    mv.addObject("age", 28); // auto-boxing
    mv.addObject("working", true); // auto-boxing

    // JSP 주소도 담는다.
    mv.setViewName("/WEB-INF/jsp/c05_3.jsp");

    return mv;
  }

```
결과
```java
값 꺼내기
name = 민성
age = 28
working = true
```