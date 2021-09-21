## 스태틱 메서드 레퍼런스란?

인터페이스 구현한다는건 쉬운 일이 아니다.

기존 메서드와 같은 일을 하는 코드가 있다면 인터페이스 구현하는데 재활용한다면 편하다.

```java
메서드 레퍼런스를 지정할 때 리턴 타입의 규칙:
    // 1) 같은 리턴 타입
    // 2) 암시적 형변환 가능한 타입
    // 3) auto-boxing 가능한 타입
    // 4) void

    클래스명::메서드명
```

### 메서드 한 개짜리 인터페이스의 구현체를 만드는 방법

0. 기존 코드

```java
public class Exam0510 {

  static class MyCalculator {
    public static int plus(int a, int b) {return a + b;}
  }

  interface Calculator {
    int compute(int x, int y);
  }

  public static void main(String[] args) {
      ..............
  }
```

1. 익명 클래스 활용

```java
    Calculator obj1 = new Calculator() {
      @Override
      public int compute(int x, int y) {
        return x + y;
      }
    };
```

2. 람다 문법 활용

```java
Calculator obj2 = (x, y) -> x + y;
```

3. 기존에 작성한 클래스의 스태틱 메서드를 재활용하기

- 인터페이스의 메서드 규격과 일치하는 메서드가 있다면 그 메서드를 람다 구현체로 사용할 수 있다.
- 새로 코드를 작성할 필요가 없어 매우 편리하다
- 단 인터페이스에 선언된 메서드의 규격과 일치해야 한다

```java
 Calculator c1 = MyCalculator::plus;

System.out.println(c1.compute(200, 17)); // compute() ==> plus()
```

인터페이스에 정의된 메서드(예: compute())가 호출되었을 때,
그 파라미터 값은 메서드 레퍼런스로 지정된 스태틱 메서드(예: plus())에게 전달된다.

결국 plus()를 호출하는 것과 같다. (재활용)

스태틱 메서드의 리턴 타입은 인터페이스 메서드의 리턴 타입과 일치하거나 그 타입으로 바꿀 수 있어야 한다

```java
  Calculator1 c1 = MyCalculator::plus; // MyCalculator객체에 대해 plus() 메서드를 실행하라
// 위 문장은 다음 문장과 같다.
      Calculator1 c1 = new Calculator1() {
        @Override
        public int compute(int a, int b) {
            return MyCalculator.plus(a, b);
          }
        };
    System.out.println(c1.compute(100, 200));
```

복습

```java
// 1) 로컬 클래스로 인터페이스 구현체 만들기
    class MyPredicate<T> implements Predicate<T> {
      @Override
      public boolean test(T value) {
        return ((String)value).isEmpty();
      }
    }
    Predicate<String> p1 = new MyPredicate<>();

    // 2) 익명 클래스로 인터페이스 구현체 만들기
    Predicate<String> p2 = new Predicate<>() {
      @Override
      public boolean test(String value) {
        return value.isEmpty();
      }
    };

    // 3) 람다로 인터페이스 구현체 만들기
    Predicate<String> p3 = value -> value.isEmpty();

    // 4) 메서드 레퍼런스를 사용하여 기존 클래스의 메서드를 인터페이스 구현체로 사용하기
    //  Predicate 인터페이스 구현체 따로 만들지 않고 String의 isEmpty()를 사용하겠다.

    // 왼쪽은 무조건 functional interface 여야 한다.
    Predicate<String> p4 = String::isEmpty;
  }
```

```java
public class Exam0710 {

  interface ListFactory {
    List create();
  }

  public static void main(String[] args) {

    // 인터페이스에 정의된 메서드가
    // 생성자의 형식과 일치하다면
    // 메서드 레퍼런스로 생성자를 지정할 수 있다.
    //
    // 1) 익명 클래스로 인터페이스 구현
    //    ListFactory f1 = new ListFactory() {
    //      public List create() {
    //        return new ArrayList();
    //      }
    //    };


    // 2) 람다 문법으로 인터페이스 구현
    //  ListFactory f1 = () -> new ArrayList();

    // 3) 메서드 레퍼런스로 인터페이스 구현
    // create() 하면 ArrayList 기본생성자 호출하는 것과 같다.
    ListFactory f1 = ArrayList::new;






    // 인터페이스의 메서드를 호출하면
    // 지정된 클래스의 인스턴스를 만든 후 생성자를 호출한다.
    List list = f1.create(); // new ArrayList();

```
