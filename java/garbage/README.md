## 가비지 컬렉터(garbage collector)

---

- 힙 메모리에 존재하는 가비지를 찾아 제거하는 일을 한다.
- 다른 용도로 사용할 수 있도록 메모리를 해제하는 일을 한다.

![garbage](https://user-images.githubusercontent.com/86590036/126955196-1822df29-d79c-4bd7-84d2-c4158f04542b.jpg)
[1번]

```java
public class GarbageEx1 {
  public static void main(String[] args) {

    Score s1 = new Score();

    Score s2 = s1;

  }
}
```

[2번]

```java
public class GarbageEx2 {
  public static void main(String[] args) {

    Score s1;

    s1 = new Score();
    s1 = new Score();

  }
}
```

[3번]

```java
public class GarbageEx3 {
  public static void main(String[] args) {

    Score s1 = new Score();
    Score s2 = new Score();

    s2 = s1;

  }
}
```

- JVM은 객체의 참조 상태를 관리하기 위해 "레퍼런스 카운트(reference count)"를 이용한다.
- 레퍼런스 카운트가 0인 상태가 "가비지(garbage)"이다.
- 주소를 잃어버리면 다시 연결시킬 수 없다.

가비지 컬렉터(garbage collector)의 실행

- 메모리 부족할 때
- CPU가 한가할 때

Q. System.gc()라는 메서드가 있던데요?

A. System.gc()를 호출하여 가비지 실행을 요청할 때
바로 실행하는 것이 아니라 빠른 시간 내에 실행할 것을 독촉하는 것이다.
아무래도 원래의 시간보다는 앞 당겨 청소를 하게 되겠지만 System.gc()로 가비지를 제거한다고 착각하지 말자.
