## 상속(Inheritance)은 왜 등장하게 되었을까?

---

- 상속이 등장하게 된 배경과 코드를 살펴보며 상속에 대해 간접 체험해 보는 것이 목적입니다.

- 먼저 상속이 등장하게 된 배경에 대해 알아볼까요?

### 1. 기존 코드에 새로운 내용을 추가한다면?

만약 프로그램을 유지보수하는 과정에서 기존 코드에 새로운 내용을 집어넣는다면 어떻게 될까?
여기에는 몇 가지 문제점들이 있는데 이에 대해서 알아보자.

- 📌 문제점
  - ✔️ 변경된 사항으로 기존 코드를 사용하는데 영향을 끼친다.
    - 기존에 잘 되던 기능까지 동작이 안되는 문제가 발생한다면? 끔찍하다..
  - ✔️ 오류가 발생 할 가능성이 높다.
  - ✔️ 코드가 누더기가 되어서 유지보수가 힘들다.
- 위와 같은 문제점들이 발견되면서 새로운 해결책이 필요해지게 되는데...

### 2. 기존 코드를 복제하여 새로운 내용을 추가한다면?

이에 대한 해결책으로 기존 코드에 영향을 끼치지 않게 하기 위해서 개발자들은 기존 코드 자체를 복사해서 쓰기 시작했다.
그 결과 1번의 문제를 해결할 수 있게 되었다. 하지만 여기에도 몇 가지 문제점들이 발생하게 되는데

- 📌 문제점
- ✔️ 기존 코드에 버그가 발견된다면 복제된 모든 코드에도 버그가 있다.
  - 유지보수가 매우 매우 매우 힘들다
  - 만약 고객사에 위와 같이 작업한 코드를 납품한다면..? 무한 출장 당첨이다.
- ✔️ 기존 코드를 변경했을 때 복사 붙여넣기 한 모든 클래스를 찾아 변경해야 한다.
- ✔️ 기존 코드의 크기가 큰 경우에는 복사 붙여넣기가 어렵다.

![상속 등장 이유1](https://user-images.githubusercontent.com/86590036/127311653-cce2dd54-f180-49a4-aff0-8edba65557b7.jpg)

### 3. 상속 : 두 방법의 장점만을 취한다.

위와 같은 문제점들을 해결하기 위해 등장하게 된 개념이 바로 상속이다.

1. 기존에 있는 코드에 영향을 주지 않는 경우 (1번)
2. 기존에 있는 클래스를 복제하지 않고 새로운 소스를 추가하는 경우 (2번)

![상속 등장 이유2](https://user-images.githubusercontent.com/86590036/127311694-26a6adc6-fdbc-4395-b201-ef682dc69468.jpg)

### 🟣 상속의 특징 참고

- ✔️ 상속은 클래스명 뒤에 extends를 붙임으로서 상속을 했다는 것을 알려준다.
- ✔️ 클래스명 뒤에 아무것도 붙여지지 않으면 최고 조상인 Object 클래스를 상속한다.

```java
public class A extends Object {}
```

- ✔️ Super class, Parent class / 조상클래스, 부모클래스
- ✔️ Sub class, Child class / 자손 클래스

![상속 관계 정리](https://user-images.githubusercontent.com/86590036/127312358-063f16f5-d283-4916-a4a8-ae6d26e1115f.jpg)

- ✔️ super class의 인스턴스 변수부터 Heap 영역에 만든다.
- ✔️ 생성자는 상속되지 않는다.

[인스턴스 생성 절차 정리!]

1. 상속 받은 수퍼 클래스를 먼저 메모리에 로딩한다.
   이미 로딩되어 있다면 다시 로딩하지는 않는다.
2. 그런 후 해당 클래스를 메모리에 로딩한다.
   마찬가지로 이미 로딩되어 있다면 다시 로딩하지는 않는다.
3. 수퍼 클래스에 선언된 대로 인스턴스 변수를 Heap에 만든다.
4. 해당 클래스에 선언된 대로 인스턴스 변수를 Heap에 만든다.
5. 슈퍼 클래스부터 생성자를 실행하며 해당 클래스까지 내려온다.

[클래스 로딩 관련]

1. B 클래스의 인스턴스를 만드는 과정에서 B클래스가 로딩되고, B클래스의 슈퍼 클래스인 A클래스가 로딩된다. (상속관계라면 슈퍼 클래스의 클래스가 먼저 로딩된다.)
   - ✔️ 스태틱 필드 생성한 후
   - ✔️ 스태틱 블록 실행한다.
2. 그 후 B 클래스를 로딩한다.
   - ✔️ 스태틱 필드 생성한 후
   - ✔️ 스태틱 블록 실행한다.
3. 인스턴스 필드 생성
   - ✔️ 슈퍼 클래스의 인스턴스 필드부터 생성한다

```java
public class Exam01 {
  public static void main(String[] args) {

    B obj = new B();

    obj.v2 = 200; // B 클래스 설계도에 따라 만든 변수
    obj.v1 = 100; // A 클래스 설계도에 따라 만든 변수

    System.out.printf("v2=%d, v1=%d\n", obj.v2, obj.v1);
    System.out.println("---------------------------------");
    }
}
```

```java
public class A {
  int v1;

  static {
    System.out.println("A클래스의 static{} 실행!");
  }
}
```

```java
public class B extends A {
  int v2;

  static {
    System.out.println("B클래스의 static{} 실행!");
  }
}
```

```java
A클래스의 static{} 실행!
B클래스의 static{} 실행!
v2=200, v1=100
---------------------------------
```

![상속 관계 정리2](https://user-images.githubusercontent.com/86590036/127312378-37544759-8222-4bed-88cf-3c5f054afbef.jpg)

### 🟣 상속에 대한 오해

우리가 평상시에 알고 있던 상속(Inheritance)은 무언가를 물려받는것을 의미한다.
물려받는다고 생각해서 클래스의 필드와 메서드를 다 물려받는다고 생각하는 경우가 많다.<br>
그렇게 생각하면 오산이다. 적어도 자바에서는..

```java
public class A {
  int v1;
}
```

```java
public class B extends A {
  int v2;
}
```

"B 클래스가 A 클래스를 상속했기 때문에, B 클래스는 A 클래스의 코드를 갖고 있을 것이다."

- 아니다! B 클래스는 단지 A 클래스의 링크 정보만 갖고 있다.
- 따라서 B 클래스를 사용하려면 반드시 A 클래스가 있어야 한다.

> 그대로 물려받는다는 오해!! 하지마라. 복사한다는게 아니라 사용한다는 뜻<br>
> 상속은 기존 코드를 자동으로 복사해오는 것이 아니다! 아니다!<br>
> 복사하는것이 아니라 사용한다는 것이다.

### 🟣 코드로 알아보는 상속과 생성자

- ✔️ 기본 생성자에는 super();가 생략되어 있다.
- ✔️ super class 생성자 부터 호출 x
- ✔️ super class 생성자 부터 수행
- ✔️ 자식부터 호출되서 부모부터 수행한다.

```java
public class A /*extends Object*/ {
  int v1;

  A() {
    super();
    System.out.println("A() 생성자!");
    this.v1 = 100;
  }
}
```

```java
public class B extends A {
  int v2;

  B() {
    super();
    System.out.println("B() 생성자!");
    this.v2 = 200;
  }
}
```

```java
public class C extends B {
  int v3;

  C() {
    super();
    System.out.println("C() 생성자!");
    this.v3 = 300;
  }
}
```

```java
A() 생성자!
B() 생성자!
C() 생성자!
// v1=100, v2=200, v3=300 값 출력 안함.
```

![상속 클래스 로드맵](https://user-images.githubusercontent.com/86590036/127312284-d17a06c4-8bea-4419-9284-714affee1968.jpg)

![상속 클래스 로드맵2](https://user-images.githubusercontent.com/86590036/127312314-b96cbb60-a8aa-4118-8c8e-b72c23d77493.jpg)

### 결론

> 상속을 배움으로서 기존에 사용하던 방법에 상속을 추가한 것뿐이다.
> 이는 기존 방식을 확장하는 방법일뿐 `상속을 무조건 써야한다는것은 아니다. 압박감에서 벗어나라!`
> 경우에따라 기존코드를 바꾸는 방법, 복제하는 방법, 상속하는 방법 중 올바른 선택을 하라.
