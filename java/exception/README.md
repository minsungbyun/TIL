### 1 .예외 처리 문법을 적용하기 전 - 리턴 값으로 오류 여부를 알릴 때의 문제점

```java
public class Calculator {

  public static int compute(String op, int a, int b) {
    switch (op) {
      case "+":
        return a + b;
      case "-":
        return a - b;
      case "*":
        return a * b;
      case "/":
        return a / b;
      case "%":
        return a % b;
      default:
        // 만약 유효한 연산자가 아닐 경우 계산 결과는?
        // => 보통 리턴 값으로 알린다.
        return -1;
    }
  }
}
```

```java
public class Exception1 {
  public static void main(String[] args) {

    int result = Calculator.compute("-", 6, 7);

    if (result == -1) {
      System.out.println("유효하지 않은 연산자입니다!");
    } else {
      System.out.println(result);
    }
  }
}
```

- 정상적인 계산 결과도 오류로 취급할 수 있다

### 2. 예외 처리 문법을 적용하기 전 - 리턴 값으로 오류를 알릴 때의 문제를 극복

```java
public class Exception2 {
  public static void main(String[] args) {

    int result = Calculator2.compute("#", 100, 200);


    if (result == -1212121212) {
      System.out.println("유효하지 않은 연산자입니다!");
    } else {
      System.out.println(result);
    }


    result = Calculator2.compute("-", 6, 7);
    if (result == -1212121212) {
      System.out.println("유효하지 않은 연산자입니다!");
    } else {
      System.out.println(result);
    }
  }
}
```

### 3. 던지는 예외 받기 - catch 블록의 순서

서브클래스 예외부터 받아라

[예1]

```java
public static void main(String[] args) {

    try {

      m(3);
      System.out.println("실행 성공!");

    } catch (IOException e) {

      System.out.println("IOException 발생");

    } catch (SQLException e) {
      System.out.println("SQLException 발생");

    } catch (RuntimeException e) {
      System.out.println("RuntimeException 발생");

    } catch (Exception e) {
      System.out.println("기타 Exception 발생");
    }
  }
```

[예2]

OR 연산자를 사용하여 여러 개의 예외를 묶어 받을 수 있다.
일반 메서드에는 적용되지 않는다.

```java
public static void main(String[] args) {

    try {

      m(1);

    } catch (RuntimeException | SQLException | IOException e) {

    } catch (Exception e) {

    }
  }

```

### 4. 예외 처리 후 마무리 작업 - finally 블록

정상적으로 실행하든, 아니면 예외가 발생하여 catch 블록을 실행하든
finally 블록은 무조건 실행한다.

try 에서 사용한 자원을 해제시키는 코드를 주로 둔다.
ex) 파일, DB 커넥션, 소켓 커넥션, 대량의 메모리

catch문 없이 finally를 적을 수 있다.

[예1]

```java
public static void main(String[] args) {
    try {
      m(3);
      System.out.println("try");

    } catch (RuntimeException | SQLException | IOException e) {
      System.out.println("catch 1");

    } catch (Exception e) {
      System.out.println("catch 2");

    } finally {

      System.out.println("finally");
    }
  }
```

[예2] 자원해제

보통 자원해제시키는 메서드의 이름이 "close()"이다

우리는 365일 24시간 내내 실행되는 서버쪽 프로그램을 개발하는 것이기 때문에, 항상 자원을 사용한 후 해제시키는 것을 습관적으로 해야 한다.

```java
public class Exam0620 {

  public static void main(String[] args) {
    Scanner keyScan = null;
    try {
      keyScan = new Scanner(System.in);

      System.out.print("입력> ");
      int value = keyScan.nextInt();
      System.out.println(value * value);

    } finally {

      keyScan.close();
      System.out.println("스캐너 자원 해제!");
    }
  }

}
```

### 4. try-with-resources - finally 블록 귀찮아

자원해제시키는 코드를 매번 finally 블록을 만들어 작성하기가 귀찮다!

=> try-with-resources 라는 문법을 사용하면
굳이 finally 블록에서 close()를 직접 호출할 필요가 없다.
자동으로 처리한다.

```java
try (java.lang.AutoCloseable 구현체) {...}

// 반드시 AutoCloseable 구현체이어야 한다.
//String s = "Hello"; // 컴파일 오류!

// 변수 선언만 올 수 있다.
//if (true) {} // 컴파일 오류!
```

```java
  try (Scanner keyScan = new Scanner(System.in); // OK!

  //FileReader 클래스도 java.lang.AutoCloseable 구현체이다.
        FileReader in = new FileReader("Hello.java")); // OK!

```

### 5. 사용자 정의 예외 만들기 - 예외 클래스 상속 받기

실무에서는 개발자에게 예외의 의미를 직관적으로 알 수 있도록
RuntimeException 같은 평범한, 의미가 모호한 이름의 클래스를 사용하지 않고 대신에 기존 예외를 상속 받아 의미있는 이름으로 서브 클래스를 정의한 다음에 그 예외 클래스를 사용한다.

목적 - 기존의 예외 클래스 기능을 확장하는것이 아닌, 클래스 이름만으로 의미를 전달한다.

예외보면 아 여기서 문제 생겼구나 바로 알 수 있음!

### 예외처리 문법의 등장이유

1. 리턴 값으로 예외상황을 알리는 방식의 한계극복

2. 예외가 발생하더라도 JVM을 멈추지 않고 계속 정상적으로 실행되게 만드는 문법

### 예외 처리 문법을 적용한 후 - 메서드가 던지는 예외 정보를 받는다.

```java
public class Exception3 {
  public static void main(String[] args) {
    String op = "#";
    int a = 100;
    int b = 200;


    try {

      int result = Calculator3.compute(op, a, b);
      System.out.println(result);

    } catch (RuntimeException e) {

      System.out.println(e.getMessage());

    }
  }
}
```

중간에서 예외를 try catch로 받지 않으면 그 다음으로 던져진다.
만약 메인마저 예외처리를 안한다면?
JVM에게 전달된다.

JVM이 예외를 받는다면 무조건 예외 정보를 출력한 후 프로그램을 종료한다.

JVM에게 예외가 전달되지 않게끔 하는 것이 중요하다.

#### 예외처리의 기본 개념

1. 예외를 던지는 것

```java
throw new RuntimeException("예외가 발생했습니다!");
```

2. 예외를 받는 것

```java
try {

} catch (RuntimeException e) {
  System.out.println(e.getMessage());
}
```

```
Throwable  - Error (시스템 오류, 개발자가 던져서는 안된다.)         ｜
          ｜
           - Exception (애플리케이션 오류)
```

```
Exception  - RuntimeException (메서드 선언부 표시 안해도 된다.)
           - IOException (메서드 선언부 표시 해야한다.)
           - SQLExcemption (메서드 선언부 표시 해야한다.)
           - ................

```

Throwable 계열의 예외를 던질 경우, 메서드 선언부에 어떤 예외를 던지는지 지정하지 않아도 된다.

예외를 던질 때 Throwable 클래스를 직접 사용하지 말고 그 하위 클래스를 사용하라

Exception 계열의 예외를 던질 경우, 반드시 메서드 선언부에 어떤 예외를 던지는지 지정해야 한다

Exception의 서브 클래스임에도 불구하고
RuntimeException 객체를 던질 경우,
메서드 선언부에 예외를 던진다고 표시하지 않아도 된다.

RuntimeException 계열의 예외는 굳이 throws 문장을 선언하지 않아도 되지만, 해당 클래스,메서드를 호출하는 개발자에게 어떤 예외가 발생할 수 있는지 명확하게 제시해주는 것이 유지보수에 도움이 되기 때문에 메서드 선언부에 발생되는 예외를 명시하는 것이 좋다.

main()에서 예외를 던진다면 용서받지 못할 코드가 된다.
main()은 최후의 보루로 try catch로 막아줘야한다.

#### 예외 처리 방법 1:

예외를 처리하고 싶지 않다면 상위 호출자에게 책임을 떠넘길 수 있다.

#### 예외 처리 방법 2:

try ~ catch 를 사용하여 코드 실행 중에 발생된 예외를 중간에 가로챈다.
