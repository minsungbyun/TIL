## 메서드의 정의
___
- 명령어를 기능 단위로 관리하기 쉽게 별도로 분리하여 묶어 놓은 것.
- 반복적으로 자주 사용하는 명령어를 재사용하기 쉽도록 별도로 분리하여 묶어 놓은 것.
- "코드를 관리하기 쉽고 재사용하기 쉽도록 기능 단위로 묶어 놓는 문법"

### 용어

 - 메서드명, 변수선언 : 메서드 시그너처(method signature)
 - 메서드 블록 : 메서드 몸체(method body)

## 메서드 종류?
 ___
 - 클래스 메서드
    - 클래스에 소속되어 있다.
    - 모든 인스턴스가 공유한다.
    - static이 붙는다.
 - 인스턴스 메서드
    - 특정 인스턴스에 대해 사용한다.
    - static이 붙지 않는다.

### 1. 명령어 블록을 실행할 때 값을 넘겨주지 않고 결과도 넘겨 받지 않는다.
 ```java
  void 메서드명() {
   문장1;
   문장2;
 }

 ```
 예시)
 ```java
 public class TestMethod {
  
  static void hello() {
    System.out.println("안녕하세요!");
    System.out.println("이 메서드는 어떤 값도 리턴하지 않습니다.");
  }

  public static void main(String[] args) {
    
    hello();
     System.out.println("hello() 실행 완료!");
  }
}

 ```
 실행결과
 ```java
안녕하세요!
이 메서드는 어떤 값도 리턴하지 않습니다.
hello() 실행 완료!

 ```

 ### 2. 명령어 블록을 실행할 때 값을 넘겨준다. 그러나 결과는 받지 않는다.
```java
 void 메서드명(변수선언1, 변수선언2, ...) {
   문장1;
   문장2;
 }

```
예시)
```java
public class TestMethod2 {
  static void hello(String name, int age) {
   
    System.out.printf("%d살 %s님 반갑습니다.\n", age, name);
  }

  public static void main(String[] args) {

    System.out.println("main()11111");
    hello("변민성", 28);
   

    System.out.println("main()22222");
    hello("000", 20);
  }
}
```
실행결과
```java
main()11111
28살 변민성님 반갑습니다.
main()22222
20살 000님 반갑습니다.
```
 
 ### 3. 명령어 블록을 실행할 때 값을 넘겨주지 않는다. 결과는 받는다.
 ```java
  리턴타입 메서드명() {
   문장1;
   문장2;
 }

 ```
 예시)
 ```java
 public class TestMethod3 {

  static String hello() {
 
    return "안녕하세요!"; 
  }

  public static void main(String[] args) {
.
    // String r = hello();
    // System.out.println(r);
    System.out.println(hello());

    hello(); // 값을 받는 변수가 없으면 리턴 값은 버려진다.
  }
}
 ```
 실행결과
 ```java
 안녕하세요!
 ```

 ### 4. 명령어 블록을 실행할 때 값을 넘겨주고 결과를 받는다.

```java
 리턴타입 메서드명(변수선언1, 변수선언2, ...) {
   문장1;
   문장2;
 }
```
예시)
```java
public class TestMethod4 {

  static String hello(String name, int age) {
    String retVal = String.format("%d살 %s님을 환영합니다!", age, name);
    return retVal;
  }

  public static void main(String[] args) {

   
    String r = hello("변민성", 28);
    System.out.println(r);

    // 리턴 값을 안 받아도 된다.
    hello("변민성", 28); // 리턴 값은 버려진다.
  }
}

```
실행결과
```java
28살 변민성님을 환영합니다!
```
## 가변 파라미터 vs 배열 파라미터
___

### 가변파라미터의 장점
- 0~n개의 아규먼트를 전달할 수 있다.
- 배열에 담아서 전달할 수 있다.

예시)
```java

public class TestParam1 {

  // 가변 파라미터
  static void hello(String... names) {
    for (int i = 0; i < names.length; i++) {
      System.out.printf("%s에 거주하는 주민분들 반갑습니다.\n", names[i]);
    }
  }

  // 배열 파라미터
  static void hello2(String[] names) {
    for (int i = 0; i < names.length; i++) {
      System.out.printf("%s에 거주하는 주민분들 반갑습니다.\n", names[i]);
    }
  }

  public static void main(String[] args) {

    // 가변 파라미터의 메서드를 호출할 때는
    // => 다음과 같이 낱개의 값을 여러 개 줄 수도 있고,
    hello("서울", "경기", "대구");
    System.out.println("-------------------");

    // => 또는 다음과 같이 배열에 담아서 전달할 수도 있다.
    String[] arr = {"서울", "경기", "대구", "창원"};

    hello(arr);
    System.out.println("-------------------");

    // 배열 파라미터의 메서드를 호출할 때는
    // => 가변 파라미터와 달리 낱개의 값을 여러 개 줄 수 없다!
    // => 오직 배열에 담아서 전달해야 한다.
    
    String[] arr2 = {"서울", "경기", "대구", "창원"};
    hello2(arr2);
    System.out.println("-------------------");
  }
}

```
실행결과
```java
서울에 거주하는 주민분들 반갑습니다.
경기에 거주하는 주민분들 반갑습니다.
대구에 거주하는 주민분들 반갑습니다.
-------------------
서울에 거주하는 주민분들 반갑습니다.
경기에 거주하는 주민분들 반갑습니다.
대구에 거주하는 주민분들 반갑습니다.
창원에 거주하는 주민분들 반갑습니다.
-------------------
서울에 거주하는 주민분들 반갑습니다.
경기에 거주하는 주민분들 반갑습니다.
대구에 거주하는 주민분들 반갑습니다.
창원에 거주하는 주민분들 반갑습니다.
-------------------

```

### 가변파라미터의 단점
1. 가변 파라미터는 여러 개 선언할 수 없다
    - 아규먼트의 시작과 끝을 구분할 수 없다.
```java
test("aaa", "bbb", "aaa@test.com", "bbb@test.com");
// 어느 값이 names 배열에 들어가고, 어느 값이 emails 배열에 들어가는가?
static void test1(String... names, String... emails) {} // 컴파일 오류!
static void test1(String[] names, String[] emails) {} // OK!
```
2. 중간에 다른 타입이 온다 하더라도 안된다.
```java
static void test2(String... names, int a, String... emails) {}// 컴파일 오류!
static void test2(String[] names, int a, String[] emails) {} // OK!
```
3. 가변 파라미터는 반드시 맨 끝에 와야 한다.
```java
static void test3(String... names, String a) {} // 컴파일 오류!
static void test3(boolean b, String... names, int a) {} // 컴파일 오류!
```

### 배열 파라미터의 장점
1. 배열 파라미터는 여러 개 선언할 수 있다.
2. 배열 파리미터는 순서에 상관 없다.
```java
public class TestParam2 {

  static void m2(int a, String... names) {} // OK!

  // 배열 파라미터는 여러 개 선언할 수 있다.
  static void x1(String[] names, String[] emails) {}

  // 배열 파리미터는 순서에 상관 없다.
  static void x2(String[] names, int a) {}

  public static void main(String[] args) {
    
  }
}

```

### 결론
- 가변 파라미터와 배열 파라미터를 경우에 따라 적절하게 활용하자 (장단점이 존재)
