## 📌 세션 다루기 - HttpSession 직접 사용하기

- 🗸 HttpSession 객체를 사용하려면 아규먼트로 받아야 한다.

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h1", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler1(HttpSession session) {
 
    session.setAttribute("name", "홍길동");
    session.setAttribute("age", "20");

    return "세션에 값을 보관했음!";
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
결과
```java
name=민성, age=28
```

- 🗸 세션 무효화시키기

```java
@Controller
@RequestMapping("/c03_1")
public class Controller03_1 {
  @GetMapping(value="h3", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler3(HttpSession session) {
   
    session.invalidate();

    return "세션을 무효화시켰음!";
  }
}
```
결과
```java
세션을 무효화시켰음!
```
```java
name=null, age=null
```

- 🗸 현재 페이지 컨트롤러의 @SessionAttributes 에 지정된 이름이 아니라면, 프론트 컨트롤러는 요청 파라미터에서 해당 이름의 값을 찾아 넘겨준다.
- 🗸 요청 파라미터에 해당 이름의 값이 없다면, 프론트 컨트롤러는 빈 문자열을 넘겨준다.

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
결과
```java
//@SessionAttributes의 이름을 설정하지 않았기 때문에 세션에 값이 들어있더라도 빈 문자열이 리턴된다.
name=, age=, name2=, age2=
```


## 📌 @SessionAttributes, @ModelAttribute


- 🗸 Model 객체에 값을 담으면 프론트 컨트롤러는 ServletRequest 보관소에 값을 옮긴다.
- 🗸 만약 @SessionAttributes 에서 지정한 이름의 값이라면 HttpSession 객체에도 보관된다.
- 🗸 @SessionAttributes에 등록되지 않은 이름의 값은 세션에 보관되지 않는다.

```java
@Controller
@RequestMapping("/c03_2")
@SessionAttributes({"name2","age2"})
public class Controller03_2 {

  @GetMapping(value="h1", produces="text/plain;charset=UTF-8")
  @ResponseBody
  public String handler1(Model model) {

    model.addAttribute("name2", "민성");
    model.addAttribute("age2", "28");

    model.addAttribute("tel2", "1111-2222");

    return "세션에 값 보관했음!";
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
결과
```java
name2=민성, age2=28, tel2=null
```

1. @ModelAttribute 에 지정된 이름이 @SessionAttributes에 있는 경우 

- 🗸 세션에 해당 값이 있으면 아규먼트에 넣어 준다.
- 🗸 세션에 해당 값이 없으면 예외가 발생한다.

2. @ModelAttribute 에 지정된 이름이 @SessionAttributes에 없는 경우 

- 🗸 요청 파라미터에 값이 있다면 그 값을 넣어준다.
- 🗸 요청 파라미터에 값이 없으면 아규먼트에 빈 문자열을 넣어 준다.
- 🗸 세션에 있어도 등록되지 않았기 때문에 꺼내지 않는다.

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
결과
```java
 @ModelAttribute("ss") String age3,를 넣으면 예외발생 그렇지 않으면

name2=민성, age2=28, tel2=
```
Q. 왜 name과 age에는 빈 문자열이 저장될까?

- 🗸 @ModelAttribute는 현재 페이지 컨트롤러의 @SessionAttributes에 지정된 이름에 한해서만 세션에서 값을 꺼낸다.  

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
결과
```java
1. @SessionAttributes({"name2","age2"})로 설정한 경우
name=, age=, name2=민성, age2=28

2. @SessionAttributes({"name","age","name2","age2"})로 설정한 경우
name=민성, age=28, name2=민성, age2=28
```


## 📌 세션의 값을 무효화시키는 방법


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
### 🟣 페이지 컨트롤러에 상관없이 모든 세션 값을 삭제할 때 

- 🗸 용도 : 세션 자체를 무효화시켜 다음에 요청이 들어 왔을 때 새로 세션을 만들게 한다.

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
결과
```java
name=null, age=null, name2=null, age2=null
```

### 🟣 현재 페이지 컨트롤러의 @SessionAttributes에 지정된 값만 무효화시키기

- 🗸 보통 페이지 컨트롤러는 서로 관련된 작업을 처리하는 RequestHandler를 정의한다.
    - 예) BoardController : add(), detail(), list(), update(), delete()
- 🗸 또는 트랜잭션과 관련된 작업을 처리하는 요청 핸들러를 두기도 한다.
- 🗸 이렇게 특정 작업에 관계된 RequestHandler가 작업하는 동안 공유할 데이터가 있다면 세션에 보관하면 편할 것이다.
- 🗸 작업이 완료되면 그 작업을 처리하는 동안 세션에 보관했던 데이터는 삭제해야 한다. 세션의 모든 데이터가 아니라 현재 페이지 컨트롤러가 보관한 데이터만 삭제하고 싶을 때 이 방식으로 처리하면 된다.

- 🗸 즉 세션을 그대로 유지한채로 이 페이지 컨트롤러에서 @SessionAttributes로 지정한 값만 무효화시킬 때 사용한다.

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
결과
```java
name=null, age=28, name2=null, age2=28
```