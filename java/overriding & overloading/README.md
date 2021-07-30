## this vs super

---

### 🟣 필드에서의 this와 super

> 필드에서의 this과 super는 말 그대로 해당 레퍼런스가 가리키는 인스턴스의 클래스를 지칭한다.

```java
A4 obj = new A4();

obj.name  //  A 클래스의 name
obj.tel // A3 클래스의 tel
obj.age // A4 클래스의 age
obj.print();

```

```java
A4.print():
  => this.name(A), super.name(A)
  => this.age(40), super.age(30)
  => this.tel(A3: 010-1111-2222), super.tel(A3: 010-1111-2222)
  => this.working(false), super.working(true)
--------------------------------
```

![this super2](https://user-images.githubusercontent.com/86590036/127650878-baa301d5-0c87-40e0-9242-17e133c38ba0.jpg)

### 🟣 메서드에서의 this와 super

> 오버라이딩 메서드 호출 규칙에 따라, 레퍼런스가 실제 가리키는 객체의 클래스부터 메서드를 찾아 올라간다.

핵심은 다음과 같다.

```java
- this가 실제 가리키는 인스턴스 클래스를 기준으로 메서드를 찾아 올라간다.

- 호출된 메서드가 소속된 클래스를 기준으로 super 클래스 부터 메서드를 찾아 올라간다.
```

```java
public class Exam0421 {
  static class X {
    void m1() {
      System.out.println("X의 m1()");
    }
    void m2() {
      System.out.println("X의 m2()");
    }
  }

  static class X2 extends X {
    @Override void m1() { System.out.println("X2의 m1()");}
  }


  static class X3 extends X2 {
    @Override void m2() { System.out.println("X3의 m2()");}
  }


  static class X4 extends X3 {
    @Override void m1() { System.out.println("X4의 m1()");}

    void test() {
      this.m1(); // X5의 m1()
      super.m1(); // X2의 m1()

      this.m2(); // X5의 m2()
      super.m2(); // X3의 m2()
    }
  }
  static class X5 extends X4 {
    @Override void m1() { System.out.println("X5의 m1()");}
    @Override void m2() { System.out.println("X5의 m2()");}
  }

  public static void main(String[] args) {
    X5 obj = new X5();
    obj.test();

    // 레퍼런스에서 super를 사용할 수 없다.
    //    obj.super.m1(); // 컴파일 오류!
  }
}
```

```java
X5의 m1()
X2의 m1()
X5의 m2()
X3의 m2()
```

obj 레퍼런스는 X5의 인스턴스를 가리키고 있다. 그래서 this를 하게되면 X5 클래스를 기준으로 찾아들어간다.

비록 X4 클래스에서 test() 메서드가 호출되었지만 this의 주소는 X5의 주소이므로 this.m1();는 X5의 m1()가 된다.

> this는 항상 레퍼런스가 실제 가리키는 인스턴스의 주소이기 때문에 메서드가 어디에서 호출되던간에 똑같다.

하지만 메서드 호출은 다르다. (super에 해당)

test()가 X4 클래스에서 호출되었기 때문에 super.m1();는 X4 클래스를 기준으로 슈퍼클래스인 X2의 m1()메서드를 실행시킨다. X3 클래스에는 m1() 메서드가 없다.

super.m2();는 X4 클래스를 기준으로 슈퍼 클래스인 X3 클래스의 m2() 메서드를 호출해서 실행하게 된다.

> 정말 햇갈릴 수 있으니 이번 기회에 반드시 알아놓자!

이를 그림으로 본다면 다음과 같다.

![this super](https://user-images.githubusercontent.com/86590036/127650850-793752a2-beba-4636-a1ef-f5acca421865.jpg)

### 🟣 메서드에서의 형변환

> 인스턴스 필드와 달리 메서드의 경우는 레퍼런스에 대한 형변환에 상관없이<br>
> 실제 레퍼런스가 가리키는 클래스에서 메서드를 찾아 올라간다.

> 위에 있는 메서드 호출의 super와 햇갈리지 않도록 주의하자!

📌 [필수 외워야 할 것!!!!]

- ✔️ 변수에서의 형변환 : 형변환 하고 난 이후 클래스의 변수를 나타낸다.
- ✔️ 메서드에서의 형변환 : 형변환 하든 말든 무조건 레퍼런스가 가리키는 인스턴스의 클래스
- ✔️ 메서드 안에서 super : 해당 메서드를 호출한 클래스를 기준으로 슈퍼클래스에 있는 메서드 호출

![메서드 호출](https://user-images.githubusercontent.com/86590036/127650935-198aa14e-6d79-42cb-bc2f-f7eb0630529a.jpg)

### 🟣 인스턴스 생성과 오버라이딩

![슈퍼클래스의 인스턴스 필드 상속](https://user-images.githubusercontent.com/86590036/127650909-b1a608b6-aaf8-4206-ba30-fcbb65bd54ed.jpg)

📌 [인스턴스를 만들 때 주의사항]

- ✔️ 다른 클래스를 상속하고 있는지 확인한다.
  - 슈퍼 클래스의 인스턴스까지 같이 만든다. (어떤 접근제어자라도 인스턴스 만든다.)
  - 생성자를 호출한다.

상속받았다고 해서 기존 클래스를 지우면 안된다. <br>
기존 클래스에서 메서드를 찾다가 없으면 슈퍼 클래스로 올라가서 찾게 되는데 그 때 클래스가 없으면 안되지 않는가?

### 🟣 다형적 변수와 오버라이딩 메서드 호출

- 다형적 변수의 사용법에 따라,

  - ✔️ super 클래스 레퍼런스로 하위 클래스의 인스턴스를 가리킨다.

- 오버라이딩 메서드 호출 규칙에 따라,
  - ✔️ 레퍼런스가 실제 가리키는 객체의 클래스부터 메서드를 찾아 올라간다.

[예1]

```java
abstract class Car {
  public abstract void run();
  public void m() {}
}

class Sedan extends Car {
  @Override
  public void run() {
    System.out.println("Sedan.run() 호출됨!");
  }
}

public class Exam0210 {
  public static void main(String[] args) {

    Car car = new Sedan();

    car.run();
  }
}
```

```java
Sedan.run() 호출됨!
```

✔️ [문제점]

자.. 분명 car 인스턴스는 세단을 가리키고 있지만 레퍼런스의 타입이 Sedan의 슈퍼클래스인 Car니까 Car에 있는 멤버들만 사용할 수 있겠군!<br>

어디보자 car 인스턴스의 run() 메서드를 호출하니까 Car 클래스에서 run()이 있는지 볼까? 어..? 추상 메서드네 근데 어떻게 실행시킨거야?<br>

당신은 단단히 착각하고 있다.

✔️ [해결책]

레퍼런스 타입이 슈퍼 클래스인 Car이더라도 실제 인스턴스는 Sedan이기 때문에 Sedan 클래스에 run()이 있는지 먼저 찾은 다음 슈퍼 클래스로 올라가는거다.

Car에 없는 메서드를 호출하면 에러나는건 당연한거다.

[예2]

```java
class A {
  public void m() {
    System.out.println("A의 m() 호출!");
  }
}

class A2 extends A {
  @Override
  public void m() {
    System.out.println("A2의 m() 호출!");
  }

  public void x() {
    System.out.println("A2에서 추가한 메서드 x()");
  }
}

class A3 extends A2 {
  public void y() {
    System.out.println("A3에서 추가한 메서드 y()");
  }
}

public class Exam0110 {
  public static void main(String[] args) {
    A a = new A();
    a.m(); // A의 멤버 호출. OK!

    System.out.println("--------------------");

    A2 a2 = new A2();
    a2.m(); // A2가 오버라이딩 한 메서드 호출
    a2.x(); // A2의 메서드 호출! OK!
    System.out.println("----------------------");

    A a3 = new A2();
    a3.m(); // A2의 m() 호출.

    ((A2)a3).x(); // OK!

    System.out.println("----------------------");

    A a4 = new A3();
    a4.m(); // A2의 m() 호출
    // a4가 실제 가리키는 A3 클래스부터 상위 클래스로 따라 올라가면서
    // 첫 번째로 만난 m()을 호출한다.
    System.out.println("--------------------");
  }
}
```

```java
A의 m() 호출!
--------------------
A2의 m() 호출!
A2에서 추가한 메서드 x()
----------------------
A2의 m() 호출!
A2에서 추가한 메서드 x()
----------------------
A2의 m() 호출!
--------------------
```

위의 규칙을 꼭 기억하자!

✔️ 아무리 다형적 변수라도 오버라이딩을 한 메서드가 있다면 실제 인스턴스가 가리키는 클래스부터 살핀다.

위의 코드를 그림으로 보면 다음과 같다.

![메서드 호출 다형적 변수](https://user-images.githubusercontent.com/86590036/127650954-b55d1a31-524b-4cc2-bf72-2cfb860f1b4f.jpg)
