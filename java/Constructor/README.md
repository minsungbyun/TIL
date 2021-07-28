## 도데체 생성자(Constructor)는 왜 쓸까?

---

- 생성자란 ?
  - 인스턴스를 생성한 후 재대로 쓸 수 있도록 `유효한 값으로 초기화` 시키는 일을하는 메서드다.
  - 인스턴스가 배열이 필요하다면 배열 주소를 넣어넣고 다른 인스턴스를 사용해야한다면 주소를 받아서 넣는 그런 일을한다.
  - 변수를 쓰기전에 유효한 값으로 초기화를 시켜놔야하는 경우에 쓴다.
  - 인스턴스 필드는 생성자의 첫 부분으로 들어간다.

```java
// Object()가 생성자이다
Object obj = new Object();
```

지금까지 new 클래스명()으로만 알고 있었는데 이 부분이 생성자를 나타낸다는 것!

### 모든 클래스는 1개 이상의 생성자를 가지고 있다.

- 자바에서는 모든 클래스에 최소 1개 이상의 생성자가 있다. 생략되어 보이지 않을 뿐이다.
- 기본 생성자와 파라미터가 있는 생성자로 나뉜다.
- 생성자의 이름은 클래스명과 같다.

[기본 생성자]

```java
Constructor() {
  // 생성자를 만들지 않으면 컴파일러가 자동으로 생성해준다.
}

```

[파라미터가 있는 생성자]

```java
Constructor(int a, String b, Adress adress) {
  // 인스턴스 필드를 초기화하는 역할을 한다.
  this.a = a;
  this.b = b;
  this.adress = adress;
}
```

[생성자에 대한 부분은 API를 참고]
![java 11 api](https://user-images.githubusercontent.com/86590036/127268024-fb611b00-f690-4a2f-b6be-92454e3ebf31.JPG)

- 남이 만든 클래스에 생성자를 사용할 때 메뉴얼을 보고 적절한 생성자를 선택해서 사용하라

- deprecated = 권장하지 않는다.

### 만약 생성자의 접근 권한이 없다면?

- 생성자가 있다하더라도 접근 권한이 없다면,
  생성자를 호출할 수 없다.
- 이런 경우 new 명령으로 인스턴스를 생성할 수 없다.

```java
// Calendar 클래스의 생성자는 protected로 접근이 제한되어 있기 때문에 다른 패키지에서 직접 생성자를 호출할 수 없다.
//Calendar c = new Calendar(); // 컴파일 오류!

// 오늘 날짜 및 시간 정보를 저장한 객체를 만들어 리턴한다.
    Calendar c = Calendar.getInstance();
```

### 코드로 알아보는 생성자 컴파일 과정

현재 ProjectHandler 에서 MemberHandler의 메서드를 사용하기 위해 생성자로 초기화 하는 과정이다.

여기서 1번의 코드와 2번의 코드가 같을까? 다를까?

[1번]

```java
public class ProjectHandler {

  static final int MAX_LENGTH = 5;

  Project[] projects = new Project[MAX_LENGTH];
  int size = 0;

  MemberHandler memberHandler;

  public ProjectHandler(MemberHandler memberHandler) {
    this.memberHandler = memberHandler;
  }

.... 생략
```

[2번]

```java
public class ProjectHandler {

  static final int MAX_LENGTH = 5;

  Project[] projects;
  int size;

  MemberHandler memberHandler;

  public ProjectHandler(MemberHandler memberHandler) {
    projects = new Project[MAX_LENGTH];
     size = 0;
    this.memberHandler = memberHandler;
  }
.... 생략
```

정답 = 같다.

인스턴스 필드로 선언된 코드는 생성자 호출 시 맨 윗줄에 위치하게 된다. [2번 코드를 참고]

그래서 1번과 2번 코드를 놓고 무엇이 옳은 코드 작성법인가를 논할 필요가 없다.
아니 사실상 의미가 없다.

컴파일 과정을 거치게 되면 컴파일러가 2번 코드와 같이 바꿔주기 때문이다.

그리고 1번코드에서처럼 int size = 0; 과 같이 0을 명시적으로 나타낸 경우라면 개발자가 0을 강조하고 싶다고 생각하자.

### 생성자 실행 순서

- super class 생성자 부터 호출 x
- super class 생성자 부터 수행
- 자식부터 호출되서 부모부터 수행한다.
- 기본 생성자에는 super();가 생략되어 있다.
- root class = Object class

```java
public class A /*extends Object*/ {
  int v1;

  A() {
    //super();
    System.out.println("A() 생성자!");
    this.v1 = 100;
  }
}
```

```java
public class B extends A {
  int v2;

  B() {
    //super();
    System.out.println("B() 생성자!");
    this.v2 = 200;
  }
}
```

```java
public class C extends B {
  int v3;

  C() {
    //super();
    System.out.println("C() 생성자!");
    this.v3 = 300;
  }
}
```

![생성자 실행 순서](https://user-images.githubusercontent.com/86590036/127296524-403eebf9-e075-4c02-a7c4-46428076775a.jpg)
