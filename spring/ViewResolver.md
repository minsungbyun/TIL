## 📌 기본 View Resolver 사용하기

### 🟣 ViewResolver란?
- 🗸 실행할 뷰를 찾는 일을 한다.
- 🗸 페이지 컨트롤러가 리턴한 뷰 이름에 해당하는 뷰 콤포넌트를 찾는 역할.

### 🟣 종류는?
- 🗸 ResourceBundleViewResolver
    - 🗸 *.properties 에서 뷰 이름에 해당하는 콤포넌트의 URL을 찾는다.
- 🗸 InternalResouceViewResolver
    - 🗸 미리 지정된 접두사, 접미사를 사용하여 뷰이름으로 콤포넌트의 URL을 완성해 URL을 지정하기 편리하다.
    - 🗸 교체 방법은 XML에서 설정하는 방법과 Java Config로 설정하는 방법이 있다.

### 🟣 실행과정    

1. 페이지 컨트롤러는 클라이언트가 요청한 작업을 실행한 후 그 결과를 출력할 뷰의 이름을 리턴한다.
2. 프론트 컨트롤러는 RequestHandler가 리턴한 URL을 ViewResolver에게 전달한다.
3. ViewResolver는 자신의 정책에 맞춰서 뷰 URL을 준비한다.
4. InternalResourceViewResolver의 경우 RequestHandler가 리턴한 URL 앞, 뒤에 접두사와 접미사를 붙여 JSP를 찾는다.
5. 프론트 컨트롤러는 ViewResolver가 준비한 URL을 가지고 View 객체를 통해 해당 URL의 자원을 실행한다.

### 🟣 참고사항
- 🗸 MVC 모델에서는 JSP는 뷰 콤포넌트로서 출력이라는 역할을 담당한다.
- 🗸 출력할 데이터를 준비하는 일은 페이지 컨트롤러가 담당한다.
- 🗸 JSP를 실행할 때는 항상 페이지 컨트롤러를 통해 실행해야 한다.
- 🗸 페이지 컨트롤러가 하는 일이 없어도 프로그래밍의 일관성을 위해 접 JSP을 요청하지 않고, 페이지 컨트롤러를 통해 요청해야 한다.
- 🗸 JSP 파일을 /WEB-INF 폴더 아래에 두는 것을 권장한다.


-  🗸 @ResponseBody - 뷰 이름을 리턴 할 때는 이 애노테이션을 붙이면 안된다.
- 🗸 기본 ViewResolver는 리턴 값으로 URL을 받아 웹 애플리케이션 디렉토리에서 JSP를 찾는다.
- 🗸 기본 ViewRosolver를 사용할 때는 뷰 이름을 리턴하지 않으면 오류 발생!

```java
@Controller
@RequestMapping("/c01_1")
public class Controller01_1 {
    @GetMapping("h1")
  public String handler1(Model model) {

    model.addAttribute("name", "민성");
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
    model.addAttribute("name", "민성2");
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

    map.put("name", "민성3");
    map.put("age", 28);

    return "/WEB-INF/jsp/c01_1.jsp";
  }
}
```

## 📌 기본 View Resolver 교체 - InternalResourceViewResolver 사용하기

- XML에서 설정하는 방법과 Java Config(@Bean)로 설정하는 방법으로 꼭 등록하고 사용하자.
- RequestHandler가 리턴한 URL 앞, 뒤에 접두사와 접미사를 붙여 JSP를 찾는다.
- RequestHandler가 뷰 이름을 리턴하지 않으면 RequestHandler의 URL을 뷰 이름으로 사용한다. 실무에서 많이 사용하는 방법이다.


### 🟣 Map 사용하기
```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h1")
  public String handler1(Map<String, Object> map) {

    map.put("name", "민성");
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
    map.put("name", "민성3");
    map.put("age", 28);

    return map;
  }
}
```
### 🟣 Model 사용하기
```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h2")
  public void handler2(Model model) {

    model.addAttribute("name", "민성2");
    model.addAttribute("age", 28);
  }

}
```
### 🟣 ModelAndView 사용하기
- 프론트 컨트롤러는 ModelAndView 객체에 보관되어 있는 값들을 ServletRequest 보관소로 옮기고, 설정된 뷰 이름을 ViewResolver에게 넘긴다.
- 뷰 이름을 지정하지 않으면 RequestHandler의 path를 ViewResolver에게 넘긴다.

```java
@Controller
@RequestMapping("/c01_2")
public class Controller01_2 {
 
  @GetMapping("h4")
  public ModelAndView handler4() {

    ModelAndView mv = new ModelAndView();
    mv.addObject("name", "민성3");
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
    mv.addObject("name", "민성3");
    mv.addObject("age", 28);

    return mv;
  }
}
```

## 📌 URL 에서 값 추출하기 - @PathVariable

-  🗸 REST API에서 값을 호출할 때 주로 많이 사용한다.
- 🗸 게시물 삭제를 할 때도 사용한다.
- 🗸 클라이언트로부터 값을 받는 일반적인 방법
    -  🗸 Query String 으로 받는다.

- 🗸 URL path에 값을 포함하여 전달할 수 있고, 그 값을 아규먼트로 받을 수 있다.   
- 🗸 URL path에 포함된 값을 받으려면 
    - => .../{변수명}/{변수명}
- 🗸 변수명과 아규먼트의 이름이 같다면, 변수명을 생략할 수 있다.    

### 방법 1
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
결과
```java
name=byun, age=28
```
### 방법 2
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
결과
```java
name=byun, age=28
```
### 방법 3
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
결과
```java
name=byun, age=28
```




