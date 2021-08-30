## ArrayList의 특징

- 기본 배열 크기는 10개로 정해져있다.

```java
 ArrayList<String> list = new ArrayList<>();
    list.add("aaa");
    list.add("bbb");
    list.add("ccc");
    list.add("ddd");
    System.out.println(list); // [aaa, bbb, ccc, ddd]

    // ArrayList는 null을 추가하는 것을 허용한다.
    list.add(null);
    list.add("eee");
    System.out.println(list); // [aaa, bbb, ccc, ddd, null, eee]

    // ArrayList는 같은 인스턴스를 중복해서 추가할 수 있다.
    list.add(null);
    list.add("aaa");
    list.add("bbb");
    System.out.println(list); // [aaa, bbb, ccc, ddd, null, eee, null, aaa, bbb]

    // remove(index)
    // - 목록에서 해당 인덱스의 값을 삭제한다.
    // - 리턴 값은 삭제된 값이다.
    String s = list.remove(2);
    System.out.println(s); // ccc
    System.out.println(list); // [aaa, bbb, ddd, null, eee, null, aaa, bbb]

    list.remove(0);
    System.out.println(list); // [bbb, ddd, null, eee, null, aaa, bbb]

    // add(index, value)
    // - 해당 위치에 값을 삽입한다.
    list.add(1, "xxx");
    System.out.println(list); // [bbb, xxx, ddd, null, eee, null, aaa, bbb]

    list.add(1, "yyy");
    System.out.println(list); // [bbb, yyy, xxx, ddd, null, eee, null, aaa, bbb]

    list.add(0, "zzz");
    System.out.println(list); // [zzz, bbb, yyy, xxx, ddd, null, eee, null, aaa, bbb]

    list.add(5, "ttt");
    System.out.println(list); // [zzz, bbb, yyy, xxx, ddd, ttt, null, eee, null, aaa, bbb]

    // set(index, value)
    // - 해당 위치의 값을 변경한다.
    list.set(1, "aaa");
    System.out.println(list); // [zzz, aaa, yyy, xxx, ddd, ttt, null, eee, null, aaa, bbb]

    // get(index) : 해당 위치의 값을 리턴한다.
    System.out.println(list.get(2)); // yyy
    System.out.println(list.get(3)); // xxx

    // 인덱스가 유효하지 않을 때 IndexOutOfBoundsException 예외가 발생한다.
    //    System.out.println(list.get(100));
```

```java
// contains()
    // - 해당 인스턴스와 같은 객체가 있는지 알아낸다.
    // - 단 인스턴스 주소를 비교하는 것이 아니라
    //   equals()의 결과가 true 인지 비교한다.
    // - hashCode()의 리턴 값이 같을 필요는 없다.
    //
     System.out.println(list.contains(m4)); // true
```

```java
 // indexOf(값)
    // - 목록에 같은 값을 가진 객체의 인덱스를 알아낸다.
    // - 값을 비교할 때는 contains()와 마찬가지로
    //   equals()의 리턴 값이 true인 경우 같은 값으로 간주한다.
    //
    System.out.println(list.indexOf(m4)); // 1
```

## ArrayList 값 꺼내는 5가지 방법

1. for문 돌려서 값을 꺼낸다

```java
 for (int i = 0; i < list.size(); i++) {
      System.out.println(list.get(i));
    }
```

2. Object toArray() 메서드를 사용해서 값을 꺼낸다

```java
Object[] arr = list.toArray();
    for (Object obj : arr) {
      Member m = (Member) obj;
      System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
```

3. <T> T[] toArray(T[] arr) 메서드를 사용해서 값을 꺼낸다.

```java
Member[] arr = list.toArray(new Member[list.size()]);
    for (Member m : arr) {
      System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
    }

```

4. Iterator를 사용해서 값을 꺼낸다.

```java
Iterator<Member> iterator = list.iterator();
    while (iterator.hasNext()) {
      Member m = iterator.next();
      System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
```

5. Consumer 인터페이스를 통해 값을 꺼낸다.

```java
lass MyConsumer implements Consumer<Member> {
      @Override
      public void accept(Member m) {
        // forEach() 에서 반복문을 돌릴 때
        // Consumer 규칙에 따라
        // 각 항목에 대해 이 메서드를 호출한다.
        System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
      }
    }

    list.forEach(new MyConsumer());
```

```java
Consumer<Member> action = new Consumer<>() {
      @Override
      public void accept(Member m) {
        System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
      }
    };

    list.forEach(action);
```

```java
// 익명 클래스 전환
list.forEach(new Consumer<>() {
      @Override
      public void accept(Member m) {
        System.out.printf("이름: %s, 나이: %d\n", m.name, m.age);
      }
    });
```

```java
// lambda 문법으로 Consumer 구현체 만들기
    list.forEach(m -> System.out.printf("이름: %s, 나이: %d\n", m.name, m.age));
```
