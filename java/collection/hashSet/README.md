## hashSet , hashMap , hashTable

![1](https://user-images.githubusercontent.com/86590036/130885182-fa694a47-7646-4f2a-8c5f-fcfd67ebde7d.jpg)

![2](https://user-images.githubusercontent.com/86590036/130885242-e4cf15cc-c1bf-4f8e-bb27-db3ef0f412e6.jpg)

![3](https://user-images.githubusercontent.com/86590036/130885255-f3b04675-41eb-44a7-a3aa-ce46bb38dee6.jpg)

**ArrayList vs HashSet**

- ✔️ ArrayList 한 줄에서 쫙 관리, 순서 o 중복 o
- ✔️ HashSet 여러 줄에서 관리, 순서 x 중복 x

### 1. hashSet

```java
public class Exam0310 {

  // 사용자 정의 데이터 타입
  static class Member {
    String name;
    int age;

    public Member(String name, int age) {
      this.name = name;
      this.age = age;
    }

    @Override
    public String toString() {
      return "Member [name=" + name + ", age=" + age + "]";
    }

  }

  public static void main(String[] args) {
    Member v1 = new Member("홍길동", 20);
    Member v2 = new Member("임꺽정", 30);
    Member v3 = new Member("유관순", 16);
    Member v4 = new Member("안중근", 20);
    Member v5 = new Member("유관순", 16);

    HashSet<Member> set = new HashSet<>();
    set.add(v1);
    set.add(v2);
    set.add(v3);
    set.add(v4);

    set.add(v5); // 기대? v3와 같은 값이기 때문에 저장되지 않을 것이다!

    System.out.println(set);
  }
}
```

출력해보면 "유관순, 16" 데이터가 중복해서 저장되었음을 알 수 있다.

✔️ HashSet이 중복여부를 검사할 때 hashCode()와 equals()의 리턴값으로 판단한다.

Member 클래스에서 hashCode()와 equals()를 오버라이딩 하지 않았기 때문에
Object로부터 상속 받은 hashCode()와 equals()를 그대로 사용하였고, Object의 hashCode()는
인스턴스가 다르면 무조건 다른 해시값을 리턴한다. 그래서 "유관순,16" 데이터가 같더라도 인스턴스가 다르기 때문에 같은 값으로 간주하지 않은 것이다.

```java
[Member [name=유관순, age=16], Member [name=유관순, age=16], Member [name=안중근, age=20], Member [name=임꺽정, age=30], Member [name=홍길동, age=20]]

```

### 2. hashMap

![4](https://user-images.githubusercontent.com/86590036/130890627-509ca29f-33e8-4456-a0ff-b7e5f3ba2226.jpg)

equals()와 hashCode()를 함께 비교하기 때문에 hashCode() 만 오버라이딩 해봐야 소용없다.

🟣 **전세계 개발자들은 hashMap을 사용할 때 Integer , string 을 key로 많이 사용한다.**

hashCode()의 리턴 값이 같고, equals()의 결과가 true이기 때문에 같은 key로 간주한다.

HashMap의 key 객체로 사용할 클래스는 반드시 hashCode()와 equals()를 오버라이딩 하여 같은 값을 갖는 경우 같은 해시 값을 리턴하게 하라!

- ✔️ 개발자가 만든 클래스(사용자 정의 클래스)를 key 객체로 사용하려면 이런 번거로움이 있다.
- ✔️ 대부분 현업에서는 그냥 String을 key로 사용한다. 또는 Wrapper 클래스인 Integer를 사용하기도 한다.

### key가 들어있는 Set에서 값을 꺼내는 방법

![5](https://user-images.githubusercontent.com/86590036/130893925-574cd457-6a9d-48f8-b21e-adacd282c7c5.jpg)

```java
Set<String> keys = map.keySet();
```

```java
// 1) Iterator 사용
    Iterator<String> 키를꺼내주는객체 = keys.iterator();
    while (키를꺼내주는객체.hasNext()) {
      String key = 키를꺼내주는객체.next();
      System.out.println(map.get(key)); // key를 사용하여 값을 꺼낸다.
    }
```

```java
 // 2) 배열을 사용
    String[] keyArray = new String[keys.size()];
    keys.toArray(keyArray);
    for (String key : keyArray) {
      System.out.println(map.get(key)); // key를 사용하여 값을 꺼낸다.
    }
```

```java
// 3) 만약 컬렉션 객체가 java.util.Iterable 규칙을 따라 만든 클래스라면
    //    for(:) 반복문을 바로 사용할 수 있다.
    for (String key : keys/* 배열 또는 Iterable 객체 */) {
      System.out.println(map.get(key));
    }
    System.out.println("---------------------");

```

value 객체는 중복 저장될 수 있기 때문에
value 객체 목록은 Collection 에 담아서 리턴한다.

```java
 java.util.Collection<Member> values = map.values();
    for (Member value : values) {
      System.out.println(value);
    }
```

```java
Set<Entry<String,Member>> entrySet = map.entrySet();
    // key,value가 한쌍으로 묶여있는 객체들이 들어있다.

    for (Entry<String,Member> entry : entrySet) {
      System.out.printf("%s ===> %s\n",
          entry.getKey(),
          entry.getValue());
    }
```

### Iterator는 재활용이 불가능하다. 다시 사용해줘야한다.

```java
  Iterator<String> 키를꺼내주는객체 = keys.iterator();
```

### 3. hashMap vs hashTable

**key나 value에 null이 될 수 있는지의 여부**

🟣 hashMap

1. ✔️ null을 key로 사용할 수 있다.
2. ✔️ value가 null이 될 수 있다.
3. ✔️ 동기화를 지원하지 않는다.
   멀티스레드가 동시에 사용할 때 문제가 발생할 수 있다.
   => 대신 실행 속도가 빠르다.

🟣 hashTable

1. ✔️ key가 null이 될 수 없다.
2. ✔️ value가 null이 될 수 없다.
3. ✔️ 동기화 지원

=> key나 value에 null을 사용하고 싶다면 HashMap을 사용하라. <br>
=> key나 value가 null이 되어서는 안된다면 Hashtable을 사용하라.
