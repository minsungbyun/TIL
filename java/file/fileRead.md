## 버퍼는 왜 사용하는 것인가?

버퍼(buffer) = 데이터 임시 저장 공간

### 데이터 읽기

데이터 읽기 시간 = average seek time + data transfer time

ex) 1000 바이트를 읽는다고 가정한다면?

1. 1바이트씩 1000번 읽기
2. 1000바이트씩 1번 읽기

1바이트를 여러 번 읽을 경우 매번 바이트의 위치를 찾아야 하기 때문에 평균 탐색시간이 누적되어 한 번에 1000 바이트를 읽는 것 보다 시간이 오래 걸린다.

그러면 한 번에 다 읽으면 되지 않나요?

메모리를 읽을 때 왕창 읽지 왜 깨작깨작 여러번에 걸쳐 읽냐? 하필 8192바이트씩말이지.. 다쓰면 또 다시 읽고

PC 처럼 소수의 프로그램이 동시에 실행될 때는 상관없지만,
서버처럼 데이터를 읽는 코드가 동시에 수천개에서 수십만개일 때는
아무리 작은 크기의 메모리라도 매우 많아지게 된다.

서버에서는 웹서버 운영체제 서버 네트워크 통신서버등 수많은 프로그램이 돌아간다. 그 프로그램도 메모리를 필요로 한다. 어느정도 여유 메모리 확보는 필요하다. 한 번에 왕창 데이터를 읽어버리면 감당이 안된다.

그래서 보통 8KB 정도의 버퍼 크기를 유지하고 있다.
(보통 실무에서는 버퍼를 사용할 때 8k , 16k가 기본이다)

=> 물론 프로그램의 용도나 목적에 따라 버퍼의 크기가 이보다 더 작아지거나
커질 수 있다.

버퍼를 사용하는 것과 아닌것은 하늘과 땅 차이다!

### 버퍼 사용 전 - 파일 복사 및 시간 측정

```java
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Exam0310 {

  public static void main(String[] args) throws Exception {
    FileInputStream in = new FileInputStream("temp/jls11.pdf");
    FileOutputStream out = new FileOutputStream("temp/jls11_2.pdf");

    int b;

    int count = 0;
    long startTime = System.currentTimeMillis(); // 밀리초

    while ((b = in.read()) != -1) {
      out.write(b);
      count++;
    }

    long endTime = System.currentTimeMillis();

    System.out.println(endTime - startTime);
    System.out.println(count);

    in.close();
    out.close();
  }
}

```

```java
28789  // 28초
3336294
```

### 버퍼 사용 후 - 파일 복사 및 시간 측정

```java
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Exam0320 {

  public static void main(String[] args) throws Exception {
    FileInputStream in = new FileInputStream("temp/jls11.pdf");
    FileOutputStream out = new FileOutputStream("temp/jls11_3.pdf");

    byte[] buf = new byte[8192]; // 보통 8KB 정도 메모리를 준비한다.
    int len = 0;

    long startTime = System.currentTimeMillis(); // 밀리초

    int count = 0;
    while ((len = in.read(buf)) != -1) {
      out.write(buf, 0, len);
      count++;
    }

    long endTime = System.currentTimeMillis();

    System.out.println(endTime - startTime);
    System.out.println(count);
    in.close();
    out.close();
  }
}
```

```java
6
408
```

### BufferedFileInputStream과 BufferedFileOutputStream을 사용하여 파일 복사 및 시간 측정

- 보통 close() 안에 flush() 가 오버라이딩 되어 있다.
- flush()는 바이트 배열 안에 있는 찌꺼기들 꺼내주는 역할

```java
public class Exam0330 {

  public static void main(String[] args) throws Exception {
    BufferedFileInputStream in = new BufferedFileInputStream("temp/jls11.pdf");
    BufferedFileOutputStream out = new BufferedFileOutputStream("temp/jls11_4.pdf");

    int b;

    long startTime = System.currentTimeMillis(); // 밀리초

    int count = 0;
    while ((b = in.read()) != -1) {
      out.write(b);
      count++;
    }

    // 아직 파일로 출력되지 않고 버퍼 남아 있는 데이터를
    // 마무리로 출력한다.
    // out.flush();

    long endTime = System.currentTimeMillis();

    System.out.println(endTime - startTime);
    System.out.println(count);
    in.close();
    out.close(); // close() 안에 flush() 가 오버라이딩 되어 있다.
  }
}
```

```java
16
3336294
```

### BufferedFileOutputStream 클래스

```java
import java.io.FileOutputStream;
import java.io.IOException;

public class BufferedFileOutputStream extends FileOutputStream {
  byte[] buf = new byte[8196];
  int cursor;

  public BufferedFileOutputStream(String filename) throws Exception {
    super(filename);
  }

  @Override
  public void write(int b) throws IOException {
    if (cursor == buf.length) { // 버퍼가 다차면
      super.write(buf); // 버퍼에 들어있는 데이터를 한 번에 출력한다.
      cursor = 0; // 다시 커서를 초기화시킨다.
    }

    // 1바이트 출력하라고 하면 일단 버퍼에 저장할 것이다.
    buf[cursor++] = (byte) b;
  }

  @Override
  public void write(byte[] buf) throws IOException {
    for (byte b : buf) {
      this.write(b & 0x000000ff);
    }
  }


  @Override
  public void close() throws IOException {
    this.flush();
    super.close();
  }


  @Override
  public void flush() throws IOException {
    if (cursor > 0) {
      this.write(buf, 0, cursor);
      cursor = 0;
    }
  }
}
```
