## ⭕ 상속(Inheritance)과 다형성(Polymorphism)
___


### 🟣 이전 포스팅

✔️ 상속에 대한 이전 포스팅을 참고하려면 아래 링크를 클릭해주세요<br>
- [⭕ 자바 : 상속(Inheritance)의 등장](https://enjoydevelop.tistory.com/54)


### 🟣 객체지향(OOP)의 핵심

앞에서 객체지향 문법을 준비하기 위한 여러 문법을 배웠는데 이제부터 진정한 객체지향의 길로 접어들 것 같다는 생각이 든다. 

![객체지향](https://user-images.githubusercontent.com/86590036/127475219-9b1c70a5-8204-434b-9efc-0480c4643e06.jpg)

알고보면 객체지향은 실생활과 매우 유사하다.

객체지향을 잘 이해한다는 것은 클래스를 어떻게 나눌 수 있냐가 핵심이라고 생각된다.

>`데이터 중심 클래스 vs 기능 중심 클래스`(업무) 중 어떤 것에 중심이냐에 따라 클래스를 따로 짠다.<br>
그리고 데이터를 추상화, 기능을 추상화한다.


실세계 => 데이터로 추상화한다. 
 

- ✔️ 물리적 : 환자(Patient) , 제품(Product)
- ✔️ 개념적 : 주문(Order) , 날짜(Date)


>처음부터 객체지향 프로그래밍을 잘하려고 노력하지 말라 <br> `리팩토링을 수행`하면서 점점 더 유지보수가 좋은 객체지향 프로그래밍 코드로 발전시키면 된다.


### 🟣 상속의 2가지 방법 : Specialization, Generalization 


![상속방법 2가지](https://user-images.githubusercontent.com/86590036/127475370-89ebfc82-f5f1-4f7f-864a-b0a73fc3fbcb.jpg)

상속이라고 하면 슈퍼클래스(parent)를 상속받아서 서브클래스(child)를 만드는 것이라고만 생각할 수 있다.

하지만 반대로 서브클래스로부터 `공통적인 부분`을 분리하여 슈퍼클래스를 만드는 것도 상속에 포함된다.

1. ✔️ Specializtion
- 가장 많이 사용하는 방법으로 슈퍼 클래스를 상속 받아 서브 클래스를 만드는 것이다.


2. ✔️ Generalization
- 리팩토링 과정에 수행하는 방법이다.
- 여러 클래스에 `공통으로 들어 가는 기능이나 필드`가 있다면 유지보수가 쉽도록 별도의 클래스로 추출한다.


#### [코드를 통해 알아보는 상속]

```java
public class Car {

  public Car() {
    super();
  }

  public void start() {
    System.out.println("시동 건다!");
  }

  public void shutdown() {
    System.out.println("시동 끈다!");
  }

  public void run() {
    System.out.println("달린다.");
  }
}
```

✔️ 자동차에는 다음과 같은 기능(메서드)가 있다.
- start() : 시동걸기
- shutdown() : 시동끄기
- run() : 달리기

```java
public class Sedan extends Car {
  @Override
  public void run() {
    System.out.println("쌩쌩 달린다.");
  }

  public void doSunroof(boolean open) {
    if (open) {
      System.out.println("썬루프를 연다.");
    } else {
      System.out.println("썬루프를 닫는다.");
    }
  }
}
```
✔️ 세단은 자동차를 상속받았다. 세단의 특징은 다음과 같다.
- Car의 기능을 가지고 있다.
- Car + 세단만의 기능(doSunroof())를 가지고 있다.
- Car의 기능중 run()을 overriding 했다.

```java
public class Truck extends Car {
  @Override
  public void run() {
    System.out.println("덜컹 덜컹 달린다.");
  }

  public void dump() {
    System.out.println("짐을 내린다.");
  }
}
```
✔️ 트럭은 자동차를 상속받았다. 트럭의 특징은 다음과 같다.
- Car의 기능을 가지고 있다.
- Car + 트럭만의 기능(dump())를 가지고 있다.
- Car의 기능중 run()을 overriding 했다.

이를 그림으로 보면 다음과 같다.
- 상속은 무조건 그림을 그려라! 이미지화가 중요!

![상속방법 2가지 1](https://user-images.githubusercontent.com/86590036/127475409-9842ac93-7fff-4650-99f9-1ac9f688a657.jpg)

![상속방법 2가지2](https://user-images.githubusercontent.com/86590036/127475447-f35b574e-aac7-45b0-b231-a10e7bd74a09.jpg)

- 보완할 점
    - ✔️ 세단과 트럭은 Car의 run() 메서드를 overriding 한다.
    - ✔️ 그렇다면 Car에서 run()의 기능을 정의할 필요가 없지 않나? 어차피 서브 클래스에서 재정의 할텐데..?
    - ✔️ 이를 보완하기 위해 추상 메서드를 사용해보자

#### Generalization과 추상 클래스

- ✔️ Generalization을 수행하여 만든 슈퍼 클래스의 경우
직접 사용할 목적으로 만든 클래스가 아니다.
- ✔️ 단지 서브 클래스에 공통 기능을 물려주기 위해 존재하는 클래스이다.
- ✔️ 이런 클래스들은 직접 사용하지 못하게 막는 것이 좋다.
>클래스를 직접 사용하지 못하게 막고 단지 서브 클래스를 만들어 사용하도록 제한하는 문법이
"추상 클래스" 이다. <br>
✔️ 즉 개발자에게 이 클래스를 상속 받아 새 클래스를 만들어 쓰라는 의미다!
- 이 클래스는 인스턴스를 만들지 못한다.
- 유지 보수를 좋게 하기 위한 방법이다.



```java
public abstract class Car {

  public Car() {
    super();
  }

  public void start() {
    System.out.println("시동 건다!");
  }

  public void shutdown() {
    System.out.println("시동 끈다!");
  }

  public abstract void run();

}
```    
다음과 같이 공통적으로 사용하는 run()을 추상 메서드로 분리하였고 서브 클래스에서 overriding해서 구현하도록 하였다.


📌 [추상메서드의 특징]
- ✔️ 서브클래스에 따라 동작을 다르게 하는 메서드는 굳이 슈퍼 클래스에서 구체적으로 정의할 필요가 없다.
- ✔️ 서브클래스에 따라 동작을 다르게 하는 메서드는 overriding(재정의)한다. 이것이 추상 메서드이다.
- v 추상 메서드는 메서드 바디가 없다. 즉 해당 메서드를 overriding하도록 강제한다.
- ✔️ overriding하지 않으면 대상이 되는 메서드도 추상 메서드로 바꾼다.


### 🟣 상속계층도(Inheritance Hierarchy)와 다형성(Polymorphism)

상속계층도는 실생활과 밀접하다고 했다.
다음의 예시를 보면서 상속이라는 개념이 아얘 새로운 개념이 아니라 우리가 기존에 알고 있는 개념이라는 것을 깨닫게 되었다.

![상속계층도2](https://user-images.githubusercontent.com/86590036/127475473-9af1676a-1cab-4cd2-b8f2-27a1036bf9e4.jpg)

- 동물은 생물에 속한다 (o)
- 생물은 모두 동물이다 (x)
___

- 사람은 유인원이다 (o)
- 유인원은 사람이다 (x)
___

- 식물은 동물이다 (x)
- 포유류는 파충류다 (x)

이를 프로그래밍에 대입한 것일 뿐이다.

![상속계층도](https://user-images.githubusercontent.com/86590036/127475519-57608036-4cad-46ce-bf49-b64cf93233f0.jpg)

📌 [다형성(Polymorphism)]
- ✔️ 상속 계층도에서 아래로 가리키는건 가능
- ✔️ 하위 계층은 상위 계층의 멤버를 다 가지고 있다.
- ✔️ 위로 가리키는건 안됨, 수평으로 가리키는것도 안됨
- ✔️ 슈퍼 클래스의 인스턴스 변수부터 만든다.
- ✔️ 파라미터 변수의 타입이 클래스라면 - 인스턴스 및 자식(서브) 클래스의 인스턴스 주소를 넘겨줄 수 있다.

📌 [다형성의 목적]
>적은 코드로 다양하게 유연하게 사용하기 위해서    융통성 있게

📌 [다형성의 특징]
- ✔️ 자식 인스턴스는 부모 인스턴스의 멤버를 가지고 있지만
- ✔️ 부모 인스턴스는 자식 인스턴스의 멤버를 가지고 있지 않다.

- 변수의 타입 범위 내에서만 사용가능

### 1. 다형적 변수

#### 📌 코드로 알아보는 다형성
```java
 Vehicle vehicle = new Vehicle();
 Bike bike = new Bike();
 Car car = new Car();
 Sedan sedan = new Sedan();
 Truck truck = new Truck();
```
위의 상속 계층도를 참고하자.
```java
Vehicle vehicle2 = null;
    vehicle2 = bike; // OK
    vehicle2 = car; // OK
    vehicle2 = sedan; // OK
    vehicle2 = truck; // OK

    Car car2 = null;
    car2 = sedan; // OK
    car2 = truck; // OK
    //    car2 = bike; // Error!

    Bike bike2 = null;
    //    bike2 = car; // Error!
    //    bike2 = sedan; // Error!
    //    bike2 = truck; // Error!
```
- bike, car, sedan, truck의 기능 중 공통적으로 가지고 있는 기능은 vehicle의 기능이다.
- 그래서 레퍼런스 변수로 vehicle2이 올 수 있다.
```java
Vehicle obj = new Bike();
```
new 인스턴스 내에는 Bike와 조상인 Vehicle의 멤버가 있지만 레퍼런스 변수가 Vehicle이기 때문에 Vehicle이 가지고 있는 멤버 내에서 사용 가능하다. 
```
model()
capacity()

메서드를 제한적으로 사용할 수 있다.
```
다음의 코드를 보면서 문제점과 해결방안을 찾아보자.

```java
public class Exam0411 {

  // Sedan과 Truck의 모델명과 cc를 출력하라!

  public static void printSedan(Sedan sedan) {
    System.out.printf("모델명: %s\n", sedan.model);
    System.out.printf("cc: %d\n", sedan.cc);
    System.out.println("-------------------------");
  }

  public static void printTruck(Truck truck) {
    System.out.printf("모델명: %s\n", truck.model);
    System.out.printf("cc: %d\n", truck.cc);
    System.out.println("-------------------------");
  }

  public static void main(String[] args) {
    Sedan sedan = new Sedan();
    sedan.model = "티코";
    sedan.cc = 800;

    Truck truck = new Truck();
    truck.model = "타이탄II";
    truck.cc = 10000;

    printSedan(sedan);

    printTruck(truck);
  }

}
```
- 문제점
    - 세단과 트럭에 대한 모델명과 cc를 출력하는 과정에서 메서드를 세단 따로 트럭 따로 만들어야한다.

- 해결방안
    - 세단과 트럭은 공통적으로 Car를 상속받는 클래스이다.
- ✔️ 파라미터 변수의 타입이 클래스라면 -> 인스턴스 및 자식(서브) 클래스의 인스턴스 주소를 넘겨줄 수 있다.
 - Car 인스턴스를 파라미터로 넣어주게 되면 Car뿐만 아니라 서브 클래스인 세단과 트럭의 인스턴스도 넘겨줄 수 있다.

```java
public class Exam0412 {

  // Sedan과 Truck의 모델명과 cc를 출력하라!
  public static void printCar(Car car) {
    System.out.printf("모델명: %s\n", car.model);
    System.out.printf("cc: %d\n", car.cc);
    System.out.println("-------------------------");
  }

  public static void main(String[] args) {
    Sedan sedan = new Sedan();
    sedan.model = "티코";
    sedan.cc = 800;

    Truck truck = new Truck();
    truck.model = "타이탄II";
    truck.cc = 10000;

    printCar(sedan); // OK! 왜? Sedan은 Car의 일종이다.
    printCar(truck); // OK! 왜? Truck도 Car의 서브클래스이다.
  }
}
```

#### 📌 다형성의 형변환

- ✔️ 레퍼런스가 실제 하위 인스턴스를 가리키고 있다 하더라도, 레퍼런스 타입의 범위를 벗어나서 사용할 수 없다.
- ✔️ 자바 컴파일러는 레퍼런스가 실제 어떤 인스턴스를 가리키는지 따지지 않고 레퍼런스의 타입에 한정하여 인스턴스나 클래스의 멤버 사용을 허락한다.
- ✔️ 잘못된 형변환을 할 경우, 
  - 형변환(type casting)으로 컴파일러를 속일 수는 있지만, 실행할 때 오류가 발생할 것이다.
  - 속여도 들통난다. 하지마라.
```java
public class Exam0210 {

  public static void main(String[] args) {

    // 상위 클래스의 레퍼런스로 하위 클래스의 인스턴스를 가리킬 때
    Car c = new Sedan();

    c.model = "티코"; // Vehicle의 인스턴스 변수
    c.capacity = 5;  // Vehicle의 인스턴스 변수
    c.cc = 890;      // Car의 인스턴스 변수
    c.valve = 16;    // Car의 인스턴스 변수

    //    c.sunroof = true; // 컴파일 오류!
    //    c.auto = true;    // 컴파일 오류!

  
    // => 레퍼런스 변수가 실제 가리키는 것이 무엇인지 알려줘야 한다.
    // => ((원래인스턴스타입) 레퍼런스).멤버
    ((Sedan)c).sunroof = true; // OK!
    ((Sedan)c).auto = true;    // OK!

    // => 또는 인스턴스의 원래 클래스 레퍼런스에 저장한 다음에 사용.
    Sedan s = (Sedan)c;
    s.sunroof = true;
    s.auto = true;

    System.out.println("종료!");
  }
}
```
### 2. 오버로딩과 오버라이딩

📌 [메서드 오버로딩(Method Overloading)]
>파라미터의 형식은 다르지만 같은 기능을 수행하는 메서드에 대해
같은 이름을 부여함으로써 프로그래밍의 일관성을 제공하기 위한 문법이다

📌 [메서드 오버라이딩(Method Overriding)]
>상속받은 메서드를 *서브 클래스의 역할에 맞춰서* 재정의한다.   

✔️ 왜 재정의하는지에 대해 말하는 것이 중요

📌 [오버로딩에 대한 오해]
같은 클래스 내에서 동일한 이름의 메서드를 정의하는 것을 오버로딩으로 착각하는 경우가 있는데 상속받은 서브 클래스에서 동일한 이름의 메서드를 정의해도 오버로딩이다.
- ✔️ 한 클래스 안에서 같은 이름의 메서드를 여러 개 만드는 것만 오버로딩이 아니다.
- ✔️ 슈퍼 클래스에 있는 메서드와 같은 이름을 가진 메서드를 추가해도 오버로딩이다

![오버로딩 오버라이딩](https://user-images.githubusercontent.com/86590036/127475576-1b2a6cb5-8e47-46ab-9c9a-4ea2dfc3c8cf.jpg)


📌 [오버라이딩 주의사항]
- ✔️ 필드 오버라이딩은 그냥 새 필드를 추가한 것과 같다.
- ✔️ 가능한 슈퍼 클래스의 필드와 같은 이름을 만들지 말라!




