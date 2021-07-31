## 🟣 캡슐화(encapsulation)
___

>인스턴스의 변수에 추상화 목적에 맞는 유효한 값만 넣을 수 있도록 외부 접근을 제한하는 문법이다.

|종류|범위|
|:---|:---|
|private|클래스 내부에서만 접근 가능|
|default|클래스 내부 + 같은 패키지 접근 가능|
|protected|클래스 내부 + 같은 패키지 + 서브 클래스 접근 가능
|public|모두 접근 가능|



## 🟣 캡슐화와 접근제한자 : 아무나 못 들어온다!
___

- ✔️ 한 클래스에서 다른 클래스에 접근 가능한지를 판별하기 위해서는 위의 접근제한자의 종류를 알 필요가 있다.

- ✔️ 서브 클래스에서 슈퍼 클래스로 접근할 때 슈퍼 클래스에서 지정한 접근 범위보다 같거나 넓어야한다.


- ✔️ 공통영역
    - private는 항상 같은 클래스 내에서만 접근 가능하기 때문에 다른 클래스에서 접근할 수 없다.

📌 [접근 범위 예시]

![현재 패키지](https://user-images.githubusercontent.com/86590036/127727250-a001e218-f061-4d70-91ce-dac9908e7c1f.jpg)


```java
package com.eomcs.oop.ex08.b;

class A {
  private int privateVar;
  int defaultVar;
  protected int protectedVar;
  public int publicVar;
}

public class Exam0210 extends com.eomcs.oop.ex08.b.sub.C {

  public static void main(String[] args) {
    A obj1 = new A();

    //    obj1.privateVar = 100; // 접근 불가! 오직 그 클래스 안에서만 사용가능.
    obj1.defaultVar = 100; // OK! 이 클래스는 A 클래스와 같은 패키지에 소속되어 있다.
    obj1.protectedVar = 100; // OK! 비록 이 클래스가 자식클래스는 아니지만
    // 같은 패키지에 소속되어 있다.
    obj1.publicVar = 100; // OK! 모두 다 접근 가능!

    com.eomcs.oop.ex08.b.sub.B obj2 = new com.eomcs.oop.ex08.b.sub.B();

    //    obj2.privateVar = 100; // 접근 불가! 오직 그 클래스 안에서만 사용 가능.
    //obj2.defaultVar = 100; // 접근 불가! 같은 패키지까지만 접근 가능.
    //    obj2.protectedVar = 100; // 접근 불가! 같은 패키지 또는 자식 클래스 접근 가능
    obj2.publicVar = 100; // OK! 모두 다 접근 가능.


    com.eomcs.oop.ex08.b.sub.C obj3 = new com.eomcs.oop.ex08.b.sub.C();

    //obj3.privateVar = 100;  클래스 안에서만 사용 가능.
    //obj3.defaultVar = 100; // 접근 불가! 같은 패키지까지만 접근 가능.
    //obj3.protectedVar = 100; // 접근 불가! 같은 패키지 또는 자식 클래스 접근 가능
    // 자식 클래스인데 접근 불가?
    // 이유 => 자기의 인스턴스 변수가 아니다.
    obj3.publicVar = 100; // OK! 모두 다 접근 가능.

    Exam0210 obj4 = new Exam0210();

    //obj4.privateVar = 100; // 접근 불가! C 클래스에서만 접근 가능
    //obj4.defaultVar = 100; // 접근 불가! C 클래스와 같은 패키지가 아니다.
    obj4.protectedVar = 100; // OK! Exam0210은 C의 자식 클래스이며,
    // 또한 C로부터 상속 받아서 만든 자기 변수이다.
    obj4.publicVar = 100;

    com.eomcs.oop.ex08.b.sub.C obj5 = new Exam0210();
  }

  void m1(com.eomcs.oop.ex08.b.sub.C obj) {
    //obj.privateVar = 100;
    //obj.defaultVar = 100;
    //obj.protectedVar = 100;
    obj.publicVar = 100;
  }

  void m2(Exam0210 obj) {
    //obj.privateVar = 100;
    //obj.defaultVar = 100;
    obj.protectedVar = 100;
    obj.publicVar = 100;
  }

  void m3() {
    //this.privateVar = 100;
    //this.defaultVar = 100;
    this.protectedVar = 100;
    this.publicVar = 100;
  }


}
```
```java
package com.eomcs.oop.ex08.b.sub;

public class B {
  private int privateVar;
  int defaultVar;
  protected int protectedVar;
  public int publicVar;
}
```
```java
package com.eomcs.oop.ex08.b.sub;

public class C {
  private int privateVar;
  int defaultVar;
  protected int protectedVar;
  public int publicVar;
}
```

![접근제어자 2](https://user-images.githubusercontent.com/86590036/127726484-56c448f9-7177-4322-ba72-75935bee7d50.jpg)



## 🟣 게터(getter)와 세터(setter) : 변수의 직접 접근은 허용 못해!
___

✔️ 세터(setter)
 >외부에서 인스턴스 변수에 접근을 못하기 때문에 값을 넣거나 조회할 수 없다.
 그래서 이를 가능하게 하는 수단/방법(method)을 제공해야 한다.

✔️ 게터(getter)
 >외부에서 인스턴스 변수의 값을 조회할 수 있는 메서드를 제공한다.
 
✔️ 프로퍼티(Property)
>게터와 세터를 의미한다. <br>
set,get을 때어내고 첫글자 대문자를 소문자로 바꾸면 된다.
- read & write property (세터와 게터 둘 다 있음)
- read property (게터)
- write property (세터)

![용어정리](https://user-images.githubusercontent.com/86590036/127726498-a538f228-ca00-4db0-bb1b-ed1a31681905.jpg)


![용어정리2](https://user-images.githubusercontent.com/86590036/127726507-3bca1e1c-d3c7-4b82-883b-c3e0c3d9fcef.jpg)


📌 [getter/setter 예시]

```java
class Customer4 {

  // 외부에서 인스턴스 변수에 직접 접근하지 못하도록 막는다!
  private String name;
  private int age;
  private int weight;
  private int height;

  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getAge() {
    return age;
  }
  public void setAge(int age) {
    this.age = age;
  }
  public int getWeight() {
    return weight;
  }
  public void setWeight(int weight) {
    this.weight = weight;
  }
  public int getHeight() {
    return height;
  }
  public void setHeight(int height) {
    this.height = height;
  }


}

public class Exam0140 {

  public static void main(String[] args) {
    
    Customer4 c1 = new Customer4();

    c1.setName("홍길동");
    c1.setAge(300);
    c1.setWeight(100);
    c1.setHeight(-50);

    System.out.printf("%s, %d, %d, %d\n",
        c1.getName(), c1.getAge(), c1.getWeight(), c1.getHeight());
  }
}
```

```java
홍길동, 300, 100, -50 // 유효성 검사하는 메서드는 따로 만든다.
```
- ✔️ 실무에서는 셋터에서 유효 값을 검증하는 코드를 잘 넣지 않는다. (값이 그대로 출력됨)
- ✔️ 따로 인스턴스 변수의 값을 검증하는 메서드를 추가하여 처리한다.
- ✔️ 실무에서 셋터 메서드는 인스턴스 변수에 그냥 값을 넣는 경우가 많다. (인스턴스 변수에 직접 값을 넣는 것과 동일)
    

- ✔️ 대부분의 개발자들은 셋터의 무용함을 떠나, 메서드를 통해 변수의 값을 설정하는 방법을 선호한다.
- ✔️ 혹 나중에 메서드에 기타 코드를 추가할 경우를 대비하기 위함이다.


## 🟣 final : 접근할 생각 마라
___

|종류|범위|
|:---|:---|
|Class|다른 클래스가 상속 할 수 없다|
|Method|다른 클래스에서 오버라이딩 할 수 없다|
|Variable|값을 변경할 수 없다|

📌 [final 예시]

- ✔️ 파라미터는 메서드가 호출될 때 외부의 값을 받는 용도의 변수다.
- ✔️ 메서드 안에서 파라미터 값을 임의로 변경하게 되면
처음 받은 파라미터 값을 사용하지 못하는 상황이 발생한다.
- ✔️ 그래서 이런 상황을 피하고자,
    보통 실무에서 파라미터를 final로 선언한다.

```java
Class G {
  public void m1(final int a) {
    
    //a = 200; // 컴파일 오류!

    System.out.println(a);
  }
}

public final class Exam0510 {
  public static void main(String[] args) {
    G g = new G();
    g.m1(100);
  }
}
```
```java
100
```
✔️ 왜 이렇게 사용하는가?

>메서드에서 파라미터로 들어온 값을 바꾸지 못하게 함으로써 메서드 내부에서 값이 변동되는 것을 막는다.


## 정리
___

- ✔️ 인스턴스 변수는 보통 private으로 접근을 제한한다.
- ✔️ 겟터,셋터는 public으로 접근을 모두에게 공개한다.
- ✔️ 일반 메서드도 public으로 접근을 모두에게 공개한다.
- ✔️ 그 클래스 내부에서만 사용되는 메서드는 private으로 접근을 제한한다.
- ✔️ 자식 클래스의 접근을 허용할 필요가 있을 경우에만 protected로 만든다.
- ✔️ 다른 개발자가 사용할 클래스 모음을 만들 때
 그 모음집 내에서만 사용될 변수나 메서드인 경우 (default)로 접근을 제한한다.
    - 라이브러리를 만드는 개발자인 경우 (default)를 사용하는 경우가 있다.
