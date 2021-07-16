## 짝수 갯수 구하기

- 주어진 숫자에 짝수가 몇 개인지 세어라.

  - 예)
  - 1010 => 2
  - 123 => 1

- 출제의도
  - 나머지연산자(%) - 2로 나누면 짝수, 홀수 판별이 가능하다.
  - 몫 연산자(/) - 10으로 나누면 나머지를 제외한 숫자를 알 수 있다.

```java

public class CountEvenNum {

  static int countEvenNumber(int value) {
    // 1) 짝수의 갯수를 담을 변수를 선언한다.  (count)
    // 2) 파라미터로 들어온 값을 담을 변수를 선언한다.(num)
    // 3) 반복문을 돌면서 0이 아닐 때까지 돌린다. (while)
    // 4) 조건문을 사용해서 짝수면 카운트업시킨다. (if/%)
    // 5) 반복문이 끝나면 결과값을 리턴한다.

    int count = 0;
    int num = value;

    while (num != 0) {
      if ((num % 2) == 0) {
        count++;
      }
      num /= 10;
    }
    return count;
  }
  public static void main(String[] args) {
    System.out.println(countEvenNumber(1238694636));

  }
}
```

```java
6
```

- 출제의도
  - 나머지연산자(%) 대신에 비트연산자(&)를 사용하여 짝수, 홀수 판별이 가능하다.
  - 반복문의 조건을 다르게 해도 동일한 결과를 얻는다.

```java

public class CountEvenNum2 {

  static int countEvenNumber(final int value) {

    int count = 0;
    int num = value;

    while (num > 0) {
      if ((num & 1) == 0) {
        count++;
      }
      num /= 10;
    }
    return count;
  }
  public static void main(String[] args) {
    System.out.println(countEvenNumber(1238694636));

  }
}
```

```java
6
```
