## ๐ ํ์ด์ง ์ปจํธ๋กค๋ฌ ๋ง๋๋ ๋ฐฉ๋ฒ

```java
@Controller // ๋๋ ์ด์ ๋ถํฐ ์ปจํธ๋กค๋ฌ์ผ
@RequestMapping("/c01_1") // ์ปจํธ๋กค๋ฌ์ URL์ ๋งคํํ์ง์
@RequestMapping // RequestHandler์ ์ด๋ธํ์ด์ : ์์ฒญ์ด ๋ค์ด์์ ๋ ํธ์ถ๋  ๋ฉ์๋์์ ํ์ํ๋ค.
@ResponseBody // ๋ฉ์๋์ ๋ฆฌํด ๊ฐ์ด ํด๋ผ์ด์ธํธ์๊ฒ ์ถ๋ ฅํ  ๋ด์ฉ์์ ํ์ํ๋ค. View ์ปดํฌ๋ํธ๋ก ๋ณด๋ผ๋ ค๋ฉด ๋นผ๋ฉด ๋จ
```

- ๐ธ  URL ํ ๊ฐ ๋น ํ ๊ฐ์ ํธ๋ค๋ฌ๋ง ์ฐ๊ฒฐํ  ์ ์๋ค.
- ๐ธ  ๊ฐ์ URL์ ๋ํด ๋ค๋ฅธ ๋ฉ์๋๋ฅผ ๋ ์ ์ํ๋ฉด ์คํ ์ค๋ฅ๊ฐ ๋ฐ์ํ๋ค.

```java
@Controller 
@RequestMapping("/c01_1") 
public class Controller01_1 {

  @RequestMapping 
  @ResponseBody 
  public String handler() {
    return "c01_1 -> handler()";
  }

  //@RequestMapping ์ฃผ์ ํ๋ฉด ์ค๋ฅ๋ฐ์!
  @ResponseBody
  public String handler2() {
    return "c01_1 -> handler2()";
  }
}
```

## ๐ ํ์ด์ง ์ปจํธ๋กค๋ฌ ๋ง๋๋ ๋ฐฉ๋ฒ - ํ ๊ฐ์ ํ์ด์ง ์ปจํธ๋กค๋ฌ์ ์ฌ๋ฌ ๊ฐ์ ์์ฒญ ํธ๋ค๋ฌ ๋๊ธฐ

- ๐ธ  ์์ฒญ์ด ๋ค์ด ์์ ๋ ํธ์ถ๋๋ ๋ฉ์๋๋ฅผ "RequestHandler" ๋ผ ๋ถ๋ฅธ๋ค.

๐ธ ํธ๋ค๋ฌ์์ URL์ ์ง์ ํ๋ ๋ฐฉ๋ฒ 1 - path ์ฌ์ฉ
```java
@Controller
public class Controller01_2 {

  @RequestMapping(path = {"/c01_2_h1"}) 
  @ResponseBody
  public String handler() {
    return "c01_2_h1";
  }
```

๐ธ ํธ๋ค๋ฌ์์ URL์ ์ง์ ํ๋ ๋ฐฉ๋ฒ 2 - value ์ฌ์ฉ
```java
@Controller
public class Controller01_2 {

  @RequestMapping(value = {"/c01_2_h2"}) 
  @ResponseBody
  public String handler2() {
    return "c01_2_h2";
  }
```

๐ธ ๋๋ ํ ๋ฆฌ ํ์์ผ๋ก ์ง์ ํ๋ ๋ฐฉ๋ฒ 1 - path, value ์๋ต
```java
@Controller
public class Controller01_2 {

  @RequestMapping({"/c01_2/h3"}) 
  @ResponseBody
  public String handler3() {
    return "/c01_2/h3";
  }
```

๐ธ ๋๋ ํ ๋ฆฌ ํ์์ผ๋ก ์ง์ ํ๋ ๋ฐฉ๋ฒ 2 - ์ค๊ดํธ ์๋ต
```java
@Controller
public class Controller01_2 {

  @RequestMapping("/c01_2/h4")
  @ResponseBody
  public String handler4() {
    return "/c01_2/h4";
  }
```

๐ธ ํ ๊ฐ์ RequestHandler์ ์ฌ๋ฌ ๊ฐ์ URL์ ๋งคํํ๋ ๋ฐฉ๋ฒ - ์ค๊ดํธ ์ฌ์ฉ
```java
@Controller
public class Controller01_2 {

  @RequestMapping({"/c01_2/h5", "/c01_2/h6", "/c01_2/h7"})
  @ResponseBody
  public String handler5() {
    return "/c01_2/h5,h6,h7";
```

## ๐ ํ์ด์ง ์ปจํธ๋กค๋ฌ ๋ง๋๋ ๋ฐฉ๋ฒ - ๊ธฐ๋ณธ URL๊ณผ ์์ธ URL์ ๋ถ๋ฆฌํ์ฌ ์ค์ ํ๊ธฐ

```java
@Controller
@RequestMapping("/c01_3") // ํธ๋ค๋ฌ์ ์ ์ฉ๋  ๊ธฐ๋ณธ URL์ ์ง์ ํ๋ค.
public class Controller01_3 {

  @RequestMapping("/h1") // ๊ธฐ๋ณธ URL์ ๋ค์ ๋ถ๋ ์์ธ URL. ์) /c01_3/h1
  @ResponseBody
  public String handler() {
    return "h1";
  }
```

```java
@Controller
@RequestMapping("/c01_3") // ํธ๋ค๋ฌ์ ์ ์ฉ๋  ๊ธฐ๋ณธ URL์ ์ง์ ํ๋ค.
public class Controller01_3 {

  @RequestMapping("h2") // ์์ /๋ฅผ ๋ถ์ฌ๋ ๋๊ณ  ์๋ตํด๋ ๋๋ค. ์) /c01_3/h2
  @ResponseBody
  public String handler2() {
    return "h2";
  }
```

```java
@Controller
@RequestMapping("/c01_3") // ํธ๋ค๋ฌ์ ์ ์ฉ๋  ๊ธฐ๋ณธ URL์ ์ง์ ํ๋ค.
public class Controller01_3 {

  @RequestMapping({"h3", "h4", "h5"})
  @ResponseBody
  public String handler3() {
    return "h5,h6,h7";
  }
```

