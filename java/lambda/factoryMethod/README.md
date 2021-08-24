1. 로컬 클래스의 의미를 이해하지 못하고 코드를 짠 경우

```java
public class Exam0410 {

  static interface Interest {
    double compute(int money);
  }


  // 팩토리 메서드 디자인 패턴
  // 메서드가 인스턴스를 만들어서 준다.
  // 객체 생성과정이 복잡할 경우에 사용한다.
  // 인터페이스 구현하고 객체를 생성해야한다 > 이 과정을 쉽게 할 순 없을까?
  static Interest getInterest(final double rate) {
    // 로컬 클래스로 인터페이스 구현한 후 객체 리턴하기
    class InterestImpl implements Interest {
      double rate;

      public InterestImpl(double rate) {
        this.rate = rate;
      }

      @Override
      public double compute(int money) {
        return money + (money * rate / 100);
      }
    }
    return new InterestImpl(rate);
  }

  public static void main(String[] args) {
    Interest i1 = getInterest(1.5);
    System.out.printf("금액: %.2f\n", i1.compute(1_0000_0000));

    Interest i2 = getInterest(2.5);
    System.out.printf("금액: %.2f\n", i2.compute(1_0000_0000));
  }

}

```

2. 로컬 클래스의 의미를 이해하고 코드를 짠 경우

안에 구현된 메서드가 바깥 메서드의 인스턴스 필드랑 로컬 변수를 사용한다면
굳이 중첩클래스 안에서 생성자로 변수등록하는 것을 만들 필요없다. 알아서 컴파일러가 만들어준다.

```java
public class Exam0411 {

  static interface Interest {
    double compute(int money);
  }

  static Interest getInterest(final double rate) {
    // 로컬 클래스로 인터페이스 구현한 후 객체 리턴하기
    class InterestImpl implements Interest {
      // 로컬(또는 익명 로컬) 클래스 안에서 바깥 메서드의 로컬 변수를 사용하면
      // 컴파일러는 자동으로 그 값을 보관하기 위해
      // 필드를 추가한다.
      // 또한 그 값을 받을 수 있도록 생성자를 변경한다.
      // 따라서 개발자가 직접 필드나 생성자를 정의할 필요가 없다.
      //
      @Override
      public double compute(int money) {
        return money + (money * rate / 100);
      }
    }
    // 또한 개발자는 메서드의 로컬 변수 값을
    // 로컬 클래스의 생성자에 전달하기 위해 직접 작성할 필요가 없다.
    // 컴파일러가 자동으로 추가한다.
    //
    return new InterestImpl();
  }

  public static void main(String[] args) {
    Interest i1 = getInterest(1.5);
    System.out.printf("금액: %.2f\n", i1.compute(1_0000_0000));

    Interest i2 = getInterest(2.5);
    System.out.printf("금액: %.2f\n", i2.compute(1_0000_0000));
  }

}
```

3. 익명클래스 사용

인스턴스를 1번만 사용할 것이라면 익명클래스를 사용한다.
여러번 사용할꺼면 변수에 담아야하지만 1번만 사용하기때문에 바로 식을 대입한다.

```java
public class Exam0412 {

  static interface Interest {
    double compute(int money);
  }

  static Interest getInterest(final double rate) {
    // 익명 클래스로 인터페이스 구현한 후 객체 리턴하기
    // => 객체를 한 개만 생성할 것이라면 익명 클래스로 정의하라.
    Interest i = new Interest() {
      @Override
      public double compute(int money) {
        return money + (money * rate / 100);
      }
    };
    return i;
  }

  public static void main(String[] args) {
    Interest i1 = getInterest(1.5);
    System.out.printf("금액: %.2f\n", i1.compute(1_0000_0000));

    Interest i2 = getInterest(2.5);
    System.out.printf("금액: %.2f\n", i2.compute(1_0000_0000));
  }

}

```

4. 람다식 사용
   인터페이스를 구현하고있고 functional interface라면 람다식을 적용할 수 있다.

```java
public class Exam0414 {

  static interface Interest {
    double compute(int money);
  }

  static Interest getInterest(final double rate) {
    // 람다 문법으로 인터페이스 구현한 후 객체 리턴하기
    return money -> money + (money * rate / 100);
  }

  public static void main(String[] args) {
    Interest i1 = getInterest(1.5);
    System.out.printf("금액: %.2f\n", i1.compute(1_0000_0000));

    Interest i2 = getInterest(2.5);
    System.out.printf("금액: %.2f\n", i2.compute(1_0000_0000));
  }

}
```
