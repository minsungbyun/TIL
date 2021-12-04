## 📌 RequestHandler - multipart/form-data 형식의 파라미터 값 받기

```java
// 클라이언트가 멀티파트 형식으로 전송한 데이터를 꺼내기
  1. Servlet API에서 제공하는 Part를 사용하거나
  2. Spring에서 제공하는 MultipartFile 타입의 아규먼트를 선언하면 된다.
  
  // 주의!
   1. DispatcherServlet을 web.xml을 통해 배치했다면, <multipart-config/> 태그를 추가해야 한다.

   2. WebApplicationInitializer를 통해 DispatcherServlet을 배치했다면,
  App1WebApplicationInitializer 클래스를 참고하라!
```

```java
// config 파일
public class App1WebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class<?>[] {RootConfig.class};
  }

  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class<?>[] {App1Config.class};
  }

  @Override
  protected String[] getServletMappings() {
    //  DispatcherServlet에 대해 URL 매핑 정보를 리턴한다.
    return new String[] {"/app1/*"};
  }

  @Override
  protected String getServletName() {
    // DistpatcherServlet의 이름을 리턴한다.
    return "app1";
  }
}
```
### 🟣 1. Servlet API - Part

```java
 @PostMapping(value = "h1", produces = "text/html;charset=UTF-8")
  @ResponseBody
  public String handler1(
      String name,
      int age,
      Part photo // Servlet API의 객체
      ) throws Exception {

    String filename = null;
    if (photo.getSize() > 0) {
      filename = UUID.randomUUID().toString();
      String path = sc.getRealPath("/html/app1/" + filename);
      photo.write(path);
    }

    return "<html><head><title>c04_8/h1</title></head><body>" + "<h1>업로드 결과</h1>" + "<p>이름:" + name
        + "</p>" + "<p>나이:" + age + "</p>" +
        // 현재 URL이 다음과 같기 때문에 업로드 이미지의 URL을 이 경로를 기준으로 계산해야 한다.
        // http://localhost:8080/java-spring-webmvc/app1/c04_8/h1
        //
        (filename != null ? "<p><img src='../../html/app1/" + filename + "'></p>" : "")
        + "</body></html>";
  }
```

### 🟣 2. Spring API - MultipartFile

- MultipartFile로 멀티파트 데이터를 받으려면,
Spring WebMVC 설정에서 MultipartResolver 객체를 등록해야 한다.

```java
@PostMapping(value = "h2", produces = "text/html;charset=UTF-8")
  @ResponseBody
  public String handler2(//
      String name, //
      @RequestParam(defaultValue = "0") int age, //
      MultipartFile photo // Spring API의 객체
      ) throws Exception {

    String filename = null;
    if (!photo.isEmpty()) {
      filename = UUID.randomUUID().toString();
      String path = sc.getRealPath("/html/app1/" + filename);
      photo.transferTo(new File(path));
    }

    return "<html><head><title>c04_8/h2</title></head><body>" + "<h1>업로드 결과</h1>" + "<p>이름:" + name
        + "</p>" + "<p>나이:" + age + "</p>" +
        // 현재 URL이 다음과 같기 때문에 업로드 이미지의 URL을 이 경로를 기준으로 계산해야 한다.
        // http://localhost:8080/java-spring-webmvc/app1/c04_8/h2
        //
        (filename != null ? "<p><img src='../../html/app1/" + filename + "'></p>" : "")
        + "</body></html>";
  }
```

### 🟣 3. Spring API - MultipartFile[]

```java
@PostMapping(value = "h3", produces = "text/html;charset=UTF-8")
  @ResponseBody
  public String handler3(//
      String name, //
      int age, //
      // 같은 이름으로 전송된 여러 개의 파일은 배열로 받으면 된다.
      MultipartFile[] photo //
      ) throws Exception {

    StringWriter out0 = new StringWriter();
    PrintWriter out = new PrintWriter(out0);
    out.println("<html><head><title>c04_8/h3</title></head><body>");
    out.println("<h1>업로드 결과</h1>");
    out.printf("<p>이름:%s</p>\n", name);
    out.printf("<p>나이:%s</p>\n", age);

    for (MultipartFile f : photo) {
      if (!f.isEmpty()) {
        String filename = UUID.randomUUID().toString();
        String path = sc.getRealPath("/html/app1/" + filename);
        f.transferTo(new File(path));
        out.printf("<p><img src='../../html/app1/%s'></p>\n", filename);
      }
    }
    out.println("</body></html>");

    return out0.toString();
  }
}

```
### 🟣 html

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c04_8</title>
</head>
<body>

<h1>파일 업로드 하기</h1>

<form action="../../app1/c04_8/h1" method="post" 
      enctype="multipart/form-data">
이름: <input type="text" name="name" value="kim"><br>
나이: <input type="text" name="age" value="20"><br>
사진: <input type="file" name="photo"><br>
<button>c04_8/h1 실행</button>
</form>
<hr>

<form action="../../app1/c04_8/h2" method="post" 
      enctype="multipart/form-data">
이름: <input type="text" name="name" value="kim"><br>
나이: <input type="text" name="age" value="20"><br>
사진: <input type="file" name="photo"><br>
<button>c04_8/h2 실행</button>
</form>
<hr>

<form action="../../app1/c04_8/h3" method="post" 
      enctype="multipart/form-data">
이름: <input type="text" name="name" value="kim"><br>
나이: <input type="text" name="age" value="20"><br>
사진: <input type="file" name="photo"><br>
사진: <input type="file" name="photo"><br>
사진: <input type="file" name="photo"><br>
<button>c04_8/h3 실행</button>
</form>
<hr>
</body>
</html>
```

![파일 업로드](https://user-images.githubusercontent.com/86590036/144699694-3acc22be-36c8-4c5b-8d3e-eb1d28d7bb4d.PNG)

## 📌 RequestHandler - @RequestBody : 클라이언트가 보낸 데이터를 한 덩어리로 받기

```java
클라이언트가 보낸 데이터를 통째로 받기

=> request handler의 아규먼트 앞에 @RequestBody를 붙이면 된다.
```

```java
@Controller 
@RequestMapping("/c04_9")
public class Controller04_9 {

  @PostMapping(value="h1", produces="text/html;charset=UTF-8") 
  @ResponseBody 
  public String handler1(
      String name,
      int age,
      @RequestBody String data
      ) throws Exception {
    
    StringWriter out0 = new StringWriter();
    PrintWriter out = new PrintWriter(out0);
    out.println("<html><head><title>c04_9/h1</title></head><body>");
    out.println("<h1>결과</h1>");
    out.printf("<p>이름:%s</p>\n", name);
    out.printf("<p>나이:%s</p>\n", age);
    out.printf("<p>통데이터:%s</p>\n", data);
    out.println("</body></html>");
    return out0.toString();
  }
}
```
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c04_9</title>
</head>
<body>

<h1>데이터 전송</h1>

<form action="../../app1/c04_9/h1" method="post">
이름: <input type="text" name="name" value="kim"><br>
나이: <input type="text" name="age" value="20"><br>
<button>c04_9/h1 실행</button>
</form>
<hr>

</body>
</html>
```

결과 
```java
이름:minsung
나이:28
통데이터:name=minsung&age=28
```