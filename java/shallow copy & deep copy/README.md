## ๐จ๏ธ Shallow copy & Deep copy
___

### learn about shallow copy

![์์ ๋ณต์ฌ](https://user-images.githubusercontent.com/86590036/128854746-997aef03-f5b9-44d3-b28f-2f13a60d076d.jpg)

- โ๏ธ Object์ clone()์ ํด๋น ๊ฐ์ฒด์ ํ๋ ๊ฐ๋ง ๋ณต์ ํ๋ค.
- โ๏ธ ๊ทธ ์ธ์คํด์ค ๋ณ์๊ฐ ๊ฐ๋ฆฌํค๊ณ  ์๋ ๊ฐ์ฒด๋ ๋ณต์ ํ์ง ์๋๋ค.
- โ๏ธ ์ด๋ฐ ๋ฐฉ์์ ๋ณต์ ๋ฅผ "shallow copy(์์ ๋ณต์ )"๋ผ ๋ถ๋ฅธ๋ค.


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
    Car car = new Car("๋นํธ์๋์ฐจ", "๋นํธ๋นํธ", engine);
    
    // ์๋์ฐจ ๋ณต์ 
    Car car2 = car.clone();
    
    System.out.println(car == car2); // false
    System.out.println(car);
    System.out.println(car2);
    System.out.println(car.engine == car2.engine); // true
    
    // car์ car2์ ์์ง์ด ๊ฐ๋ค๋ ๊ฒ์,
    // ๊ฐ์ engine์ ๊ฐ์ฒด ์ฃผ์๋ผ๋ ๋ป์ด๋ค.
    car.engine.cc = 2000;
    System.out.println(car2.engine.cc);
  }
}
```

```java
false
Car [maker=์๋์ฐจ, name=์์ฐ๋, engine=Engine [cc=3000, valve=16]]
Car [maker=์๋์ฐจ, name=์์ฐ๋, engine=Engine [cc=3000, valve=16]]
true
2000
```



### learn about deep copy

![๊น์ ๋ณต์ฌ](https://user-images.githubusercontent.com/86590036/128854551-f6559e2c-02fe-4623-8ced-bacb3aef80c6.jpg)


- โ๏ธ ๊ทธ ๊ฐ์ฒด์ ์ธ์คํด์ค ๋ณ์๊ฐ ๊ฐ๋ฆฌํค๊ณ  ์๋ ๊ฐ์ฒด๊น์ง ๋ณต์ ํ๋ ๊ฒ์ "deep copy(๊น์ ๋ณต์ )"๋ผ ๋ถ๋ฅธ๋ค.
- โ๏ธ deep copy๋ ๊ฐ๋ฐ์๊ฐ ์ง์  clone() ๋ฉ์๋ ์์ deep copy๋ฅผ ์ํํ๋ ์ฝ๋๋ฅผ ์์ฑํด์ผ ํ๋ค.

```java
// Object ํด๋์ค - clone() : deep copy
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
    Car car = new Car("์๋์ฐจ", "์์ฐ๋", engine);

    Car car2 = car.clone();

    System.out.println(car == car2);
    System.out.println(car);
    System.out.println(car2);
    System.out.println(car.engine == car2.engine);

    // car์ ์์ง๊ณผ car2์ ์์ง์ด ๋ค๋ฅธ ์์ง์ธ์ง ํ์ธํด๋ณด์!
    car.engine.cc = 2000;
    System.out.println(car2.engine.cc);

  }
}
```

```java
false
Car [maker=์๋์ฐจ, name=์์ฐ๋, engine=Engine [cc=3000, valve=16]]
Car [maker=์๋์ฐจ, name=์์ฐ๋, engine=Engine [cc=3000, valve=16]]
false
3000
```