
##  ๐ ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ก๋ถํฐ ๋ฐ์ ์ ์๋ ํ๋ผ๋ฏธํฐ 

- PageController์ ๋ฉ์๋๋ฅผ ํธ์ถํ๋๋ฐ DispatcherServlet์ด ๋ฉ์๋๊ฐ ์ํ๋ ํ๋ผ๋ฏธํฐ๊ฐ ๋ญ์ง์ ๋ฐ๋ผ ๊ผฝ์์ค๋ค. 
๋ฉ์๋๊ฐ ๋ญ ๋ฆฌํดํ๋์ง์ ๋ฐ๋ผ ์ ์ ํ๊ฒ ์ฒ๋ฆฌํด์ค๋ค.

- return ๊ฐ์ ๋ฐ๋ผ์ ๊ทธ๋๋ก ํด๋ผ์ด์ธํธ์ ์๋ตํ  ์๋ต๋ฐ์ดํฐ๋ก ํ ์ง Jsp์ด๋ฆ์ด๋ผ๋ฉด Jsp๋ฅผ ์คํํด์ ์๋ตํ๋ค. 

- RequestHandler ์์ฒญ์ ๋ค๋ฃจ๋ ์

```java
 // ํ๋ก ํธ ์ปจํธ๋กค๋ฌ(DispatcherServlet)๋ก๋ถํฐ ๋ฐ๊ณ  ์ถ์ ๊ฐ์ด ์๋ค๋ฉด
  // ์์ฒญ ํธ๋ค๋ฌ๋ฅผ ์ ์ํ  ๋ ๋ฐ๊ณ  ์ถ์ ํ์์ ํ๋ผ๋ฏธํฐ๋ฅผ ์ ์ธํ๋ผ!
  // ๊ทธ๋ฌ๋ฉด ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๊ฐ ๋ฉ์๋๋ฅผ ํธ์ถํ  ๋ ํด๋น ํ์์ ๊ฐ์ ๋๊ฒจ์ค ๊ฒ์ด๋ค.

  // ServletContext๋ ์์กด ๊ฐ์ฒด๋ก ์ฃผ์ ๋ฐ์์ผ ํ๋ค.
  // ์์ฒญ ํธ๋ค๋ฌ์์ ํ๋ผ๋ฏธํฐ๋ก ๋ฐ์ ์ ์๋ค.

Map<String, Object> map
Model model

๋งต์ด๋ ๋ชจ๋ธ์ ๋ฐ์ดํฐ๋ฅผ ๋ด์์ ๋๊ฒจ์ฃผ๋ฉด DispatcherServlet์ ํด๋น ๋งต์ด๋ ๋ชจ๋ธ์ ๋ด๊ฒจ์ง ๋ฐ์ดํฐ๋ฅผ ๊บผ๋ด์  ServletRequest์ ์ฎ๊ฒจ๋ด๋๋ค.

์ฆ ServletRequest.setAttribute()์ ๊ฐ์

 ServletRequest.setAttribute()์ ํด๋์ค์์ ์ง์  ์ฐ๋ ์๊ฐ Servlet๊ธฐ์ ์ ์ข์๋๋ค. Servlet API ๊ธฐ์ ์ ์ข์์ ์ต์ํํ๊ธฐ์ํจ์ด๊ณ  ์ข์์ฑ์ด ์ต์ํ๋๋ค๋๊ฒ์ ์ ์ง๋ณด์ํ๊ธฐ ์ข๋ค๋ ๊ฒ์ด๋ค.

Servlet / Jsp๊ฐ ์์ด๋ ์คํ๊ฐ๋ฅํ๋ค๋์๋ฆฌ
```

ํด๋ผ์ด์ธํธ๊ฐ ๋ณด๋ธ ํ๋ผ๋ฏธํฐ ๊ฐ์ ๋ฐ๋ก ๋ฐ์ ์ ์๋ค.
์์ฒญ ํธ๋ค๋ฌ์ ํ๋ผ๋ฏธํฐ๋ก ์ ์ธํ๋ฉด ๋๋ค.
๋จ ํ๋ผ๋ฏธํฐ ์์ @RequestParam ์ ๋ธํ์ด์์ ๋ถ์ธ๋ค.
๊ทธ๋ฆฌ๊ณ  ํด๋ผ์ด์ธํธ๊ฐ ๋ณด๋ธ ํ๋ผ๋ฏธํฐ ์ด๋ฆ์ ์ง์ ํ๋ค.



## ๐ RequestHandler - @RequestParam
## ๐ RequestHandler - ๋๋ฉ์ธ ๊ฐ์ฒด(๊ฐ ๊ฐ์ฒด; Value Object)๋ก ์์ฒญ ํ๋ผ๋ฏธํฐ ๊ฐ ๋ฐ๊ธฐ

DispatcherServlet์ด ๋ฉ์๋์ ๊ฐ์ ๋๊ฒจ์ค ๋ ๋ณ์์ด๋ฆ๊ณผ ๊ฐ์ ํ๋ผ๋ฏธํฐ๊ฐ ์์ผ๋ฉด ๊ทธ ๊ฐ์ ๋๊ฒจ์ค๋ค

์์ฒญ ํธ๋ค๋ฌ์ ์๊ท๋จผํธ๊ฐ ๊ฐ ๊ฐ์ฒด๋ผ๋ฉด, ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ ๋ฉ์๋๋ฅผ ํธ์ถํ  ๋ ๊ฐ ๊ฐ์ฒด์ ์ธ์คํด์ค๋ฅผ ์์ฑํ ํ ์์ฒญ ํ๋ผ๋ฏธํฐ์ ์ผ์นํ๋ ํ๋กํผํฐ์ ๋ํด ๊ฐ์ ์ ์ฅํ๋ค. ๊ทธ๋ฆฌ๊ณ  ํธ์ถํ  ๋ ๋๊ฒจ์ค๋ค.

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
      
    // ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๊ฐ String ๊ฐ์ int๋ก ๋ณํํด ์ค๋ค.
      // ๋จ ๋ณํํ  ์ ์์ ๊ฒฝ์ฐ ์์ธ๊ฐ ๋ฐ์ํ๋ค.

      boolean auto,
      // ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๊ฐ String ๊ฐ์ boolean์ผ๋ก ๋ณํํด ์ค๋ค.
      // ๋จ ๋ณํํ  ์ ์์ ๊ฒฝ์ฐ ์์ธ๊ฐ ๋ฐ์ํ๋ค.
      // "true", "false"๋ ๋์๋ฌธ์ ๊ตฌ๋ถ์์ด true, false๋ก ๋ณํํด ์ค๋ค.
      // 1 ==> true, 0 ==> false ๋ก ๋ณํํด ์ค๋ค. ๊ทธ ์ธ ์ซ์๋ ์์ธ ๋ฐ์!

      Car car
      // ์๊ท๋จผํธ๊ฐ ๊ฐ ๊ฐ์ฒด์ด๋ฉด ์์ฒญ ํ๋ผ๋ฏธํฐ ์ค์์ ๊ฐ ๊ฐ์ฒด์ ํ๋กํผํฐ ์ด๋ฆ๊ณผ ์ผ์นํ๋
      // ํญ๋ชฉ์ ๋ํด ๊ฐ์ ๋ฃ์ด์ค๋ค.
      // ๊ฐ ๊ฐ์ฒด ์์ ๋ ๊ฐ ๊ฐ์ฒด๊ฐ ์์ ๋๋ OGNL ๋ฐฉ์์ผ๋ก ์์ฒญ ํ๋ผ๋ฏธํฐ ๊ฐ์
      // ์ง์ ํ๋ฉด ๋๋ค.
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

## ๐ ํ๋กํผํฐ ์๋ํฐ ์ฌ์ฉํ๊ธฐ

ํด๋ผ์ด์ธํธ๊ฐ ๋ณด๋ธ ์์ฒญ ํ๋ผ๋ฏธํฐ ๊ฐ(String ํ์)์
RequestHandler์ ์๊ท๋จผํธ ํ์(String, int, boolean ๋ฑ)์ ๊ฐ์ผ๋ก ๋ฐ๊ฟ ๋ primitive type์ ๋ํด์๋ง ์๋์ผ๋ก ๋ณํํด ์ค๋ค. ๊ทธ ์ธ์ ํ์์ ๋ํด์๋ ํ๋กํผํฐ ์๋ํฐ(ํ์ ๋ณํ๊ธฐ)๊ฐ ์์ผ๋ฉด ์์ธ๋ฅผ ๋ฐ์์ํจ๋ค.

### ๐ฃ ํด๋น ํ์ด์ง ์ปจํธ๋กค๋ฌ์์ ์ฌ์ฉํ  ํ๋กํผํฐ ์๋ํฐ ์ค์ ํ๋ ๋ฐฉ๋ฒ

ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๋ RequestHandler๋ฅผ ํธ์ถํ๊ธฐ ์ ์
๊ทธ ๋ฉ์๋๊ฐ ์ํ๋ ์๊ท๋จผํธ ๊ฐ์ ์ค๋นํด์ผ ํ๋ค.

๊ฐ ์๊ท๋จผํธ ๊ฐ์ ์ค๋นํ  ๋ @InitBinder๊ฐ ํ์๋ ๋ฉ์๋(RequestHandler๋ฅผ ์คํํ  ๋ ์ฌ์ฉํ  ๋๊ตฌ๋ฅผ ์ค๋นํ๋ ๋ฉ์๋)๋ฅผ ํธ์ถํ์ฌ ํ๋กํผํฐ ์๋ํฐ(๋ณํ๊ธฐ)๋ฅผ ์ค๋น์ํจ๋ค.

๊ทธ๋ฆฌ๊ณ  ์ด ์ค๋น๋ ๊ฐ ๋ณํ๊ธฐ(ํ๋กํผํฐ ์๋ํฐ)๋ฅผ ์ด์ฉํ์ฌ ํ๋ผ๋ฏธํฐ ๊ฐ์ RequestHandler์ ์๊ท๋จผํธ๊ฐ ์ํ๋ ํ์์ ๊ฐ์ ๋ฐ๊พผ๋ค.

RequestHandler์ ์๊ท๋จผํธ ๊ฐ์ ๋งํผ ์ด ๋ฉ์๋๋ฅผ ํธ์ถํ๋ค.
@InitBinder๊ฐ ํ์๋ ๋ฉ์๋์ ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ ์ฝ๋๋ฅผ ๋๋ค.



### ๐ฃ ํ๋กํผํฐ ์๋ํฐ(PropertyEditor)

- ๋ฌธ์์ด์ ํน์  ํ์์ ํ๋กํผํฐ์ ๊ฐ์ผ๋ก ๋ณํ์ํฌ ๋ ์ฌ์ฉํ๋ ์๋ํฐ์ด๋ค.

- PropertyEditor๋ฅผ ์ง์  ๊ตฌํํ๋ฉด ๋๋ฌด ๋ง์ ๋ฉ์๋๋ฅผ ์ค๋ฒ๋ผ์ด๋ฉ ํด์ผ ํ๊ธฐ ๋๋ฌธ์ ์๋ฐ์์๋ ๋์ฐ๋ฏธ ํด๋์ค์ธ PropertyEditorSupport ํด๋์ค๋ฅผ ์ ๊ณตํ๋ค. ์ด ํด๋์ค๋ PropertyEditor๋ฅผ ๋ฏธ๋ฆฌ ๊ตฌํํ์๋ค. ๋ฐ๋ผ์ ์ด ํด๋์ค๋ฅผ ์์ ๋ฐ์ ๊ฒ ๋ ๋ซ๋ค.

#### ๐ฃ ํ๋กํผํฐ ์๋ํฐ ๋ฑ๋ก
```java
 @InitBinder
  // => ๋ฉ์๋ ์ด๋ฆ์ ๋ง์๋๋ก.
  // => ์์ํ๋๋ฐ ํ์ํ ๊ฐ์ด ์๋ค๋ฉด ํ๋ผ๋ฏธํฐ๋ก ์ ์ธํ๋ผ.
  public void initBinder(WebDataBinder binder) {
   
    // ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ ค๋ฉด ๊ทธ ์ผ์ ์ํํ  ๊ฐ์ฒด(WebDataBinder)๊ฐ ํ์ํ๋ค.

    // WebDataBinder์ ํ๋กํผํฐ ์๋ํฐ ๋ฑ๋กํ๊ธฐ
    binder.registerCustomEditor(
        java.util.Date.class, // String์ Date ํ์์ผ๋ก ๋ฐ๊พธ๋ ์๋ํฐ์์ ์ง์ ํ๋ค.
        new DatePropertyEditor(); // ๋ฐ๊ฟ์ฃผ๋ ์ผ์ ํ๋ ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ค.
        );


    // WebDataBinder์ ํ๋กํผํฐ ์๋ํฐ ๋ฑ๋กํ๊ธฐ
    binder.registerCustomEditor(
        Car.class, // String์ Car ํ์์ผ๋ก ๋ฐ๊พธ๋ ์๋ํฐ์์ ์ง์ ํ๋ค.
        new CarPropertyEditor() // ๋ฐ๊ฟ์ฃผ๋ ์ผ์ ํ๋ ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ค.
        );

    //WebDataBinder์ ํ๋กํผํฐ ์๋ํฐ ๋ฑ๋กํ๊ธฐ
    binder.registerCustomEditor(
        Engine.class, // String์ Engine ํ์์ผ๋ก ๋ฐ๊พธ๋ ์๋ํฐ์์ ์ง์ ํ๋ค.
        new EnginePropertyEditor() // ๋ฐ๊ฟ์ฃผ๋ ์ผ์ ํ๋ ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ค.
        );
  }

```
#### ๐ฃ ํ๋กํผํฐ ์๋ํฐ ๋ง๋ค๊ธฐ
```java
class DatePropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
    
      try {

        // 1) String ==> java.util.Date
        // SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // Date date = format.parse(text); // String ===> java.util.Date
        // setValue(date); // ๋ด๋ถ์ ์ ์ฅ

        // 2) String ==> java.sql.Date
        setValue(java.sql.Date.valueOf(text));

      } catch (Exception e) {
        throw new IllegalArgumentException(e);
      }
    }

 // String ===> Car ํ๋กํผํฐ ์๋ํฐ ๋ง๋ค๊ธฐ
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

## ๐ ๊ธ๋ก๋ฒ ํ๋กํผํฐ ์๋ํฐ ์ ์ฉํ๊ธฐ

```java
// @ControllerAdvice
// => ํ์ด์ง ์ปจํธ๋กค๋ฌ๋ฅผ ์คํํ  ๋ ์ถฉ๊ณ ํ๋ ์ญํ ์ ์ํํ๋ค.

์ฆ ํ๋ก ํธ ์ปจํธ๋กค๋ฌ๊ฐ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ RequestHandler๋ฅผ ํธ์ถํ๊ธฐ ์ ์ ์ด ์ ๋ธํ์ด์์ด ๋ถ์ ํด๋์ค๋ฅผ ์ฐธ๊ณ ํ์ฌ ์ ์ ํ ๋ฉ์๋๋ฅผ ํธ์ถํ๋ค.
```

```java
@ControllerAdvice
public class GlobalControllerAdvice {

  // ์ด ํด๋์ค์ ํ๋กํผํฐ ์๋ํฐ๋ฅผ ๋ฑ๋กํ๋ @InitBinder ๋ฉ์๋๋ฅผ ์ ์ํ๋ค.
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

## ๐ RequestHandler - @RequestHeader