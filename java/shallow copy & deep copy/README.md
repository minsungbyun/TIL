## 🖨️ Shallow copy & Deep copy
___

### learn about shallow copy

![얕은 복사](https://user-images.githubusercontent.com/86590036/128854746-997aef03-f5b9-44d3-b28f-2f13a60d076d.jpg)

- ✔️ Object의 clone()은 해당 객체의 필드 값만 복제한다.
- ✔️ 그 인스턴스 변수가 가리키고 있는 객체는 복제하지 않는다.
- ✔️ 이런 방식의 복제를 "shallow copy(얕은 복제)"라 부른다.


```java 
public class Exam0173 {
  
  static class Engine {
    int cc;
    int valve;
    
    public Engine(int cc, int valve) {
      this.cc = cc;
      this.valve = valve;
    }
    
    @Override
    public String toString() {
      return "Engine [cc=" + cc + ", valve=" + valve + "]";
    }
  }
  
  static class Car implements Cloneable {
    String maker;
    String name;
    Engine engine;
    
    public Car(String maker, String name, Engine engine) {
      this.maker = maker;
      this.name = name;
      this.engine = engine;
    }

    @Override
    public String toString() {
      return "Car [maker=" + maker + ", name=" + name + ", engine=" + engine + "]";
    }

    @Override
    public Car clone() throws CloneNotSupportedException {
      return (Car) super.clone();
    }
  }
  
  public static void main(String[] args) throws Exception {
    Engine engine = new Engine(3000, 16);
    Car car = new Car("비트자동차", "비트비트", engine);
    
    // 자동차 복제
    Car car2 = car.clone();
    
    System.out.println(car == car2); // false
    System.out.println(car);
    System.out.println(car2);
    System.out.println(car.engine == car2.engine); // true
    
    // car와 car2의 엔진이 같다는 것은,
    // 같은 engine의 객체 주소라는 뜻이다.
    car.engine.cc = 2000;
    System.out.println(car2.engine.cc);
  }
}
```

```java
false
Car [maker=자동차, name=아우디, engine=Engine [cc=3000, valve=16]]
Car [maker=자동차, name=아우디, engine=Engine [cc=3000, valve=16]]
true
2000
```



### learn about deep copy

![깊은 복사](https://user-images.githubusercontent.com/86590036/128854551-f6559e2c-02fe-4623-8ced-bacb3aef80c6.jpg)


- ✔️ 그 객체의 인스턴스 변수가 가리키고 있는 객체까지 복제하는 것을 "deep copy(깊은 복제)"라 부른다.
- ✔️ deep copy는 개발자가 직접 clone() 메서드 안에 deep copy를 수행하는 코드를 작성해야 한다.

```java
// Object 클래스 - clone() : deep copy
package com.eomcs.basic.ex01;

public class Exam0174 {

  static class Engine implements Cloneable {
    int cc;
    int valve;

    public Engine(int cc, int valve) {
      this.cc = cc;
      this.valve = valve;
    }

    @Override
    public String toString() {
      return "Engine [cc=" + cc + ", valve=" + valve + "]";
    }

    @Override
    public Engine clone() throws CloneNotSupportedException {
      return (Engine) super.clone();
    }
  }

  static class Car implements Cloneable {
    String maker;
    String name;
    Engine engine;

    public Car(String maker, String name, Engine engine){
      this.maker = maker;
      this.name = name;
      this.engine = engine;
    }

    @Override
    public String toString() {
      return "Car [maker=" + maker + ", name=" + name + ", engine=" + engine + "]";
    }

    @Override
    public Car clone() throws CloneNotSupportedException {

      Car copy = (Car) super.clone();
      copy.engine = this.engine.clone();
      return copy;
    }
  }

  public static void main(String[] args) throws Exception {
    Engine engine = new Engine(3000, 16);
    Car car = new Car("자동차", "아우디", engine);

    Car car2 = car.clone();

    System.out.println(car == car2);
    System.out.println(car);
    System.out.println(car2);
    System.out.println(car.engine == car2.engine);

    // car의 엔진과 car2의 엔진이 다른 엔진인지 확인해보자!
    car.engine.cc = 2000;
    System.out.println(car2.engine.cc);

  }
}
```

```java
false
Car [maker=자동차, name=아우디, engine=Engine [cc=3000, valve=16]]
Car [maker=자동차, name=아우디, engine=Engine [cc=3000, valve=16]]
false
3000
```