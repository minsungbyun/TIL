![iterator design pattern](https://user-images.githubusercontent.com/86590036/130715774-1f52b93d-05f2-49da-a0e2-c709e0171c39.jpg)

Iterator 패턴
// - 컬렉션에서 값을 꺼내는 기능을 객체화시키는 방법
// - 즉 별도의 클래스로 정의하여 사용한다.
// - 이점
// 컬렉션의 타입에 상관없이 일관된 방식으로 값을 꺼낼 수 있다.
// 예) ArrayList => get(), Stack => pop(), Queue => poll()
// Iterator를 사용하면 hasNext(), next()만 사용하면 된다.

이것을 보완한 아주 중요한 개념
// Iterable 구현체라면 다음과 같이 for (:)를 사용하여 값을 조회할 수 있다.

```java
public class Exam0210 {

  public static void main(String[] args) {


    ArrayDeque<String> stack = new ArrayDeque<>();

    // 다음과 같이 스택으로서 사용할 수 있다.
    // push() - 스택의 맨 마지막에 값을 추가한다.
    stack.push("aaa");
    stack.push("bbb");
    stack.push("ccc");

    // Stack 클래스와 다르게
    // Deque 구현체의 Iterator는 스택 방식(LIFO)으로 데이터를 꺼낸다.
    // 결론
    // Iterator 를 통해 데이터를 꺼낼 때 스택의 특성을 사용하고 싶다면
    // Stack 대신에 ArrayDeque를 사용한다.
    Iterator<String> iterator = stack.iterator();
    while (iterator.hasNext()) {
      System.out.println(iterator.next());
    }

    // 여기서 잠깐!
    // 컬렉션의 데이터 조회방식 (LIFO, FIFO)에 상관없이
    // 일관된 방식으로 데이터를 조회할 수 있게 도와준다.
    // Stack처럼 입력 역순으로 꺼내든, 큐처럼 입력 순으로 꺼내든 상관없이
    // 개발자는 hasNext(), next()라는 동일한 메서드를


  }
```

```java
public class Exam0230 {

  public static void main(String[] args) {

    ArrayDeque<String> stack = new ArrayDeque<>();

    stack.push("aaa");
    stack.push("bbb");
    stack.push("ccc");

    // Iterator를 통해 데이터를 조회하고 싶다면
    // 다음과 같이 for( : ) 문을 사용하는 것이 더 낫다.
    for(String s : stack) {
      System.out.println(s);
    }
  }
```
