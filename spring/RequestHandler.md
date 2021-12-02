
##  📌 프론트 컨트롤러로부터 받을 수 있는 파라미터 

- PageController의 메서드를 호출하는데 DispatcherServlet이 메서드가 원하는 파라미터가 뭔지에 따라 꼽아준다. 
메서드가 뭘 리턴하는지에 따라 적절하게 처리해준다.

- return 값에 따라서 그대로 클라이언트에 응답할 응답데이터로 할지 Jsp이름이라면 Jsp를 실행해서 응답한다. 

- RequestHandler 요청을 다루는 자

```java
 // 프론트 컨트롤러(DispatcherServlet)로부터 받고 싶은 값이 있다면
  // 요청 핸들러를 정의할 때 받고 싶은 타입의 파라미터를 선언하라!
  // 그러면 프론트 컨트롤러가 메서드를 호출할 때 해당 타입의 값을 넘겨줄 것이다.

  // ServletContext는 의존 객체로 주입 받아야 한다.
  // 요청 핸들러에서 파라미터로 받을 수 없다.

Map<String, Object> map
Model model

맵이나 모델에 데이터를 담아서 넘겨주면 DispatcherServlet은 해당 맵이나 모델에 담겨진 데이터를 꺼내서  ServletRequest에 옮겨담는다.

즉 ServletRequest.setAttribute()와 같음

 ServletRequest.setAttribute()을 클래스에서 직접 쓰는 순간 Servlet기술에 종속된다. Servlet API 기술에 종속을 최소화하기위함이고 종속성이 최소화된다는것은 유지보수하기 좋다는 것이다.

Servlet / Jsp가 없어도 실행가능하다는소리
```

클라이언트가 보낸 파라미터 값을 바로 받을 수 있다.
요청 핸들러의 파라미터로 선언하면 된다.
단 파라미터 앞에 @RequestParam 애노테이션을 붙인다.
그리고 클라이언트가 보낸 파라미터 이름을 지정한다.



## 📌 RequestHandler - @RequestParam
## 📌 RequestHandler - 도메인 객체(값 객체; Value Object)로 요청 파라미터 값 받기

DispatcherServlet이 메서드에 값을 넘겨줄 때 변수이름과 같은 파라미터가 있으면 그 값을 넘겨준다

요청 핸들러의 아규먼트가 값 객체라면, 프론트 컨트롤러는 메서드를 호출할 때 값 객체의 인스턴스를 생성한 후 요청 파라미터와 일치하는 프로퍼티에 대해 값을 저장한다. 그리고 호출할 때 넘겨준다.

```java
@Controller
@RequestMapping("/c04_3")
public class Controller04_3 {
 
  @GetMapping("h1")
  @ResponseBody
  public void handler1(
      PrintWriter out,
      String model,
      String maker,
      @RequestParam(defaultValue = "100") int capacity,
      
    // 프론트 컨트롤러가 String 값을 int로 변환해 준다.
      // 단 변환할 수 없을 경우 예외가 발생한다.

      boolean auto,
      // 프론트 컨트롤러가 String 값을 boolean으로 변환해 준다.
      // 단 변환할 수 없을 경우 예외가 발생한다.
      // "true", "false"는 대소문자 구분없이 true, false로 변환해 준다.
      // 1 ==> true, 0 ==> false 로 변환해 준다. 그 외 숫자는 예외 발생!

      Car car
      // 아규먼트가 값 객체이면 요청 파라미터 중에서 값 객체의 프로퍼티 이름과 일치하는
      // 항목에 대해 값을 넣어준다.
      // 값 객체 안에 또 값 객체가 있을 때는 OGNL 방식으로 요청 파라미터 값을
      // 지정하면 된다.
      ) {

    out.printf("model=%s\n", model);
    out.printf("maker=%s\n", maker);
    out.printf("capacity=%s\n", capacity);
    out.printf("auto=%s\n", auto);
    out.printf("car=%s\n", car);
  }

}
```

```java
// http:localhost:8080/c04_3/h1?model=sonata&maker=hyundai&capacity=5&auto=true&engine.model=ok&engine.cc=1980&engine.valve=16

model=sonata
maker=hyundai
capacity=5
auto=true
car=Car [model=sonata, maker=hyundai, auto=true, capacity=5, createdDate=null, engine=Engine [model=ok, cc=1980, valve=16]]
```

## 📌 프로퍼티 에디터 사용하기

클라이언트가 보낸 요청 파라미터 값(String 타입)을
RequestHandler의 아규먼트 타입(String, int, boolean 등)의 값으로 바꿀 때 primitive type에 대해서만 자동으로 변환해 준다. 그 외의 타입에 대해서는 프로퍼티 에디터(타입 변환기)가 없으면 예외를 발생시킨다.

### 🟣 해당 페이지 컨트롤러에서 사용할 프로퍼티 에디터 설정하는 방법

프론트 컨트롤러는 RequestHandler를 호출하기 전에
그 메서드가 원하는 아규먼트 값을 준비해야 한다.

각 아규먼트 값을 준비할 때 @InitBinder가 표시된 메서드(RequestHandler를 실행할 때 사용할 도구를 준비하는 메서드)를 호출하여 프로퍼티 에디터(변환기)를 준비시킨다.

그리고 이 준비된 값 변환기(프로퍼티 에디터)를 이용하여 파라미터 값을 RequestHandler의 아규먼트가 원하는 타입의 값을 바꾼다.

RequestHandler의 아규먼트 개수 만큼 이 메서드를 호출한다.
@InitBinder가 표시된 메서드에 프로퍼티 에디터를 등록하는 코드를 둔다.



### 🟣 프로퍼티 에디터(PropertyEditor)

- 문자열을 특정 타입의 프로퍼터의 값으로 변환시킬 때 사용하는 에디터이다.

- PropertyEditor를 직접 구현하면 너무 많은 메서드를 오버라이딩 해야 하기 때문에 자바에서는 도우미 클래스인 PropertyEditorSupport 클래스를 제공한다. 이 클래스는 PropertyEditor를 미리 구현하였다. 따라서 이 클래스를 상속 받은 것 더 낫다.

#### 🟣 프로퍼티 에디터 등록
```java
 @InitBinder
  // => 메서드 이름은 마음대로.
  // => 작업하는데 필요한 값이 있다면 파라미터로 선언하라.
  public void initBinder(WebDataBinder binder) {
   
    // 프로퍼티 에디터를 등록하려면 그 일을 수행할 객체(WebDataBinder)가 필요하다.

    // WebDataBinder에 프로퍼티 에디터 등록하기
    binder.registerCustomEditor(
        java.util.Date.class, // String을 Date 타입으로 바꾸는 에디터임을 지정한다.
        new DatePropertyEditor(); // 바꿔주는 일을 하는 프로퍼티 에디터를 등록한다.
        );


    // WebDataBinder에 프로퍼티 에디터 등록하기
    binder.registerCustomEditor(
        Car.class, // String을 Car 타입으로 바꾸는 에디터임을 지정한다.
        new CarPropertyEditor() // 바꿔주는 일을 하는 프로퍼티 에디터를 등록한다.
        );

    //WebDataBinder에 프로퍼티 에디터 등록하기
    binder.registerCustomEditor(
        Engine.class, // String을 Engine 타입으로 바꾸는 에디터임을 지정한다.
        new EnginePropertyEditor() // 바꿔주는 일을 하는 프로퍼티 에디터를 등록한다.
        );
  }

```
#### 🟣 프로퍼티 에디터 만들기
```java
class DatePropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
    
      try {

        // 1) String ==> java.util.Date
        // SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // Date date = format.parse(text); // String ===> java.util.Date
        // setValue(date); // 내부에 저장

        // 2) String ==> java.sql.Date
        setValue(java.sql.Date.valueOf(text));

      } catch (Exception e) {
        throw new IllegalArgumentException(e);
      }
    }

 // String ===> Car 프로퍼티 에디터 만들기
  class CarPropertyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
      String[] values = text.split(",");

      Car car = new Car();
      car.setModel(values[0]);
      car.setCapacity(Integer.parseInt(values[1]));
      car.setAuto(Boolean.parseBoolean(values[2]));
      car.setCreatedDate(java.sql.Date.valueOf(values[3]));

      setValue(car);
    }
  }

```

## 📌 글로벌 프로퍼티 에디터 적용하기

```java
// @ControllerAdvice
// => 페이지 컨트롤러를 실행할 때 충고하는 역할을 수행한다.

즉 프론트 컨트롤러가 페이지 컨트롤러의 RequestHandler를 호출하기 전에 이 애노테이션이 붙은 클래스를 참고하여 적절한 메서드를 호출한다.
```

```java
@ControllerAdvice
public class GlobalControllerAdvice {

  // 이 클래스에 프로퍼티 에디터를 등록하는 @InitBinder 메서드를 정의한다.
  @InitBinder
  public void initBinder(WebDataBinder binder) {

    DatePropertyEditor propEditor = new DatePropertyEditor();
    binder.registerCustomEditor(java.util.Date.class, propEditor);

    binder.registerCustomEditor(Car.class, new CarPropertyEditor());

    binder.registerCustomEditor(Engine.class, new EnginePropertyEditor());
  }

  class DatePropertyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
      try {
        // String ==> java.util.Date
        // SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // Date date = format.parse(text);
        // setValue(date);

        // String ==> java.sql.Date
        setValue(java.sql.Date.valueOf(text));

      } catch (Exception e) {
        throw new IllegalArgumentException(e);
      }
    }
  }

  class CarPropertyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
      String[] values = text.split(",");

      Car car = new Car();
      car.setModel(values[0]);
      car.setCapacity(Integer.parseInt(values[1]));
      car.setAuto(Boolean.parseBoolean(values[2]));
      car.setCreatedDate(java.sql.Date.valueOf(values[3]));

      setValue(car);
    }
  }

    class EnginePropertyEditor extends PropertyEditorSupport {
      @Override
      public void setAsText(String text) throws IllegalArgumentException {
        String[] values = text.split(",");
  
        Engine engine = new Engine();
        engine.setModel(values[0]);
        engine.setCc(Integer.parseInt(values[1]));
        engine.setValve(Integer.parseInt(values[1]));
  
        setValue(engine);
      }
    }
}
```

## 📌 RequestHandler - @RequestHeader