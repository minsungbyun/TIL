## Calculator를 통해 배우는 Static Method & Instance Method

---

### 목적

- 다음과 같은 Java 코드를 통해 step by step으로 코드를 보완해보고자 한다.
- Static Method & Instance Method에 대한 이해를 높이고자 한다.

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  public static void main(String[] args) {
    // 다음 식을 연산자 우선 순위를 고려하지 않고 순서대로 계산하라!
    // 2 + 3 - 1 * 7 / 3 = ?

    int result = 0;

    // 메서드를 호출하여 작업을 수행하고,
    // 리턴 결과는 로컬 변수에 저장한다.
    result = plus(2, 3);
    result = minus(result, 1);
    result = multiple(result, 7);
    result = divide(result, 3);

    System.out.printf("result = %d\n", result);
  }

  static int plus(int a, int b) {
    return a + b;
  }

  static int minus(int a, int b) {
    return a - b;
  }

  static int multiple(int a, int b) {
    return a * b;
  }

  static int divide(int a, int b) {
    return a / b;
  }
}

```

```java
result = 9
```

- 보완할점
  - 사칙연산을 처리할 메서드를 따로 분리해 코드를 간결하게 할 필요가 있다.

### STEP1. 계산기능을 따로 내부클래스(Calculator)로 만들어서 뺀다.

### STEP2. 메인 메서드에서 Calculator 메서드 호출때 소속을 표시해준다.

---

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  static class Calculator {
    static int plus(int a, int b) {
      return a + b;
    }

    static int minus(int a, int b) {
      return a - b;
    }

    static int multiple(int a, int b) {
      return a * b;
    }

    static int divide(int a, int b) {
      return a / b;
    }

  }

  public static void main(String[] args) {
    // 다음 식을 연산자 우선 순위를 고려하지 않고 순서대로 계산하라!
    // 2 + 3 - 1 * 7 / 3 = ?
    int result = 0;

    result = Calculator.plus(2, 3);
    result = Calculator.minus(result, 1);
    result = Calculator.multiple(result, 7);
    result = Calculator.divide(result, 3);

    System.out.printf("result = %d\n", result);
  }

}

```

```java
result = 9
```

### STEP3. result를 Calculator로 옮기고 static 변수로 만든다.

- result는 result를 수행하는 클래스에서 수행하도록 한다.

### STEP4. Calculator의 4개의 메서드는 파라미터에 두 개의 값을 받는 것이 아니라 1개의 값을 받고 계산 결과를 result에 누적한다.

---

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  static class Calculator {

    static int result = 0;

    static int plus(int value) {
      return result += value;
    }

    static int minus(int value) {
      return result -= value;
    }

    static int multiple(int value) {
      return result *= value;
    }

    static int divide(int value) {
      return result /= value;
    }

  }

  public static void main(String[] args) {

    Calculator.plus(2);
    Calculator.plus(3);
    Calculator.minus(1);
    Calculator.multiple(7);
    Calculator.divide(3);

    System.out.printf("result = %d\n", Calculator.result);
  }

}

```

```java
result = 9
```

### STEP5. 스태틱 메서드로 처리했을때 단점은 동시에 계산을 하지 못한다.

- 첫 번째 식을 수행하고 이후 두 번째 식을 수행하게된다. 즉 동시에 해결 못한다.
- 이것을 해결해보자

### STEP6. result를 인스턴스 필드(변수)로 만든다.

### STEP7. Calculator를 new 연산자를 통해 Heap 메모리 영역에 만들어라 Calculator의 주소를 받아라 이것을 2개 만든다.

---

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  static class Calculator {

    int result = 0;

    static int plus(int value) {
      return result += value;
    }

    static int minus(int value) {
      return result -= value;
    }

    static int multiple(int value) {
      return result *= value;
    }

    static int divide(int value) {
      return result /= value;
    }

  }

  public static void main(String[] args) {
    // 2개의 식을 동시에 처리하고자 함
    // - 연산자 우선 순위를 고려하지 않고 순서대로 계산하라!
    // 식1) 2 + 3 - 1 * 7 / 3 = ?
    // 식2) 3 * 2 + 7 / 4 - 5 = ?

    Calculator c1 = new Calculator();
    Calculator c2 = new Calculator();

    Calculator.plus(2);
    Calculator.plus(3);
    Calculator.minus(1);
    Calculator.multiple(7);
    Calculator.divide(3);

    Calculator.plus(3);
    Calculator.multiple(2);
    Calculator.plus(7);
    Calculator.divide(4);
    Calculator.minus(5);


    System.out.printf("result = %d\n", Calculator.result);
    System.out.printf("result = %d\n", Calculator.result);
  }


}

```

```java
컴파일 오류가 발생
```

### STEP8. c1 result에서 계산할 것인지 c2 result에서 계산할 것인지 구분한다. 파라미터를 통해 주소를 알려줘라

### STEP9. Calculator에 있는 4개의 메서드에 파라미터로 주소와 값을 받을 변수를 설정한다.

- 주소를 주고받는다, 인스턴스를 받는다, 인스턴스를 리턴한다, 객체를 받는다, 객체를 리턴한다등의 표현 사용
- ex) that 레퍼런스가 가리키는 인스턴스(객체) = that 객체

---

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  static class Calculator {

    int result = 0;

    static int plus(Calculator that, int value) {
      return that.result += value;
    }

    static int minus(Calculator that, int value) {
      return that.result -= value;
    }

    static int multiple(Calculator that, int value) {
      return that.result *= value;
    }

    static int divide(Calculator that, int value) {
      return that.result /= value;
    }

  }

  public static void main(String[] args) {

    Calculator c1 = new Calculator();
    Calculator c2 = new Calculator();

    Calculator.plus(c1,2);
    Calculator.plus(c1,3);
    Calculator.minus(c1,1);
    Calculator.multiple(c1,7);
    Calculator.divide(c1,3);

    Calculator.plus(c2,3);
    Calculator.multiple(c2,2);
    Calculator.plus(c2,7);
    Calculator.divide(c2,4);
    Calculator.minus(c2,5);


    System.out.printf("result = %d\n", c1.result);
    System.out.printf("result = %d\n", c2.result);
  }

}

```

```java
result = 9
result = -2
```

- 보완할점
  - 주소를 매번 넘겨주다보니 식이 복잡해졌다.

### STEP10. 인스턴스 주소를 넘기기 쉽게 4개의 인스턴스 메서드를 선언한다.

- 메인 메서드에서도 인스턴스 메서드를 호출하게끔 식을 바꾼다.

---

```java
package com.mins.oop.ex00;

public class UnderstandMethod {

  static class Calculator {

    int result = 0;

    int plus(int value) {
      return this.result += value;
    }

    int minus(int value) {
      return this.result -= value;
    }

    int multiple(int value) {
      return this.result *= value;
    }

    int divide(int value) {
      return this.result /= value;
    }

  }

  public static void main(String[] args) {

    Calculator c1 = new Calculator();
    Calculator c2 = new Calculator();

    c1.plus(2);
    c1.plus(3);
    c1.minus(1);
    c1.multiple(7);
    c1.divide(3);

    c2.plus(3);
    c2.multiple(2);
    c2.plus(7);
    c2.divide(4);
    c2.minus(5);

    System.out.printf("result = %d\n", c1.result);
    System.out.printf("result = %d\n", c2.result);
  }

}

```

```java
result = 9
result = -2
```

- main 메서드에서 레퍼런스 주소를 통해 인스턴스 메서드에 접근하기 떄문에 인스턴스 메서드에서 파라미터로 주소를 받을 필요가 없어 식이 간단해진다.

### STEP11. 이 클래스를 다른 클래스에서도 쓰고 싶다. 중첩 클래스(Nested class)가 아닌 바깥에 선언한다. (package member class)

### STEP12. 한 클래스 내에 2개의 클래스가 있는 것은 분리한다. (클래스이름과 똑같은 소스파일을 만든다, 유지보수 용이)

### STEP13. 관리하기 쉽게 적절한 패키지로 분류한다. (늘 사용하는 클래스는 util이라는 패키지에 넣어놓으면 좋다)

### STEP14. 에러발생 -> 클래스를 공개한다. 클래스 안에 있는 필드와 메서드도 공개한다.

---

```java
package com.mins.oop.ex00.util;

public class Calculator {

  public int result = 0;

  public int plus(int value) {
    return this.result += value;
  }

  public int minus(int value) {
    return this.result -= value;
  }

  public int multiple(int value) {
    return this.result *= value;
  }

  public int divide(int value) {
    return this.result /= value;
  }

}

```

```java
result = 9
result = -2
```

### STEP15. abs 메서드는 static으로 선언해서 만든다.

### STEP16. plus를 가변 파라미터로 만들어버려보자

- 마치 배열처럼 사용가능하다

---

```java
package com.mins.oop.ex00.util;

public class Calculator {

  public int result = 0;

  public int plus(int... values) {
    for (int value : values) {
      this.result += value;
    }
    return this.result;
  }

  public int minus(int value) {
    return this.result -= value;
  }

  public int multiple(int value) {
    return this.result *= value;
  }

  public int divide(int value) {
    return this.result /= value;
  }

  public static int abs(int value) {
    return value > 0 ? value : -1 * value;
  }

}

```

```java
package com.mins.oop.ex00;

import com.mins.oop.ex00.util.Calculator;

public class UnderstandMethod {

  public static void main(String[] args) {

    Calculator c1 = new Calculator();
    Calculator c2 = new Calculator();

    c1.plus(2,3);
    c1.plus(3);
    c1.minus(1);
    c1.multiple(7);
    c1.divide(3);

    c2.plus(3);
    c2.multiple(2);
    c2.plus(7);
    c2.divide(4);
    c2.minus(5);


    System.out.printf("result = %d\n", c1.result);
    System.out.printf("result = %d\n", c2.result);
  }

}

```

```java
result = 16
result = -2
```
