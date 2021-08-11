## Wrapper Class

---

- primitive type은 다형적 변수로 활용할 수 없다. 함께 묶을 수 없다.
- primitive type를 Object 레퍼런스에 담기 위해서 등장한 wrapper 클래스를 알아보자

> primitive data를 포장하는 객체라고 해서
> "랩퍼(wrapper) 클래스"라 부른다.

![KakaoTalk_20210811_102201966](https://user-images.githubusercontent.com/86590036/128955492-9c82697f-2eeb-40ca-b816-7d70e15ee9ab.jpg)

Wrapper 클래스의 가장 큰 목적!

> primitive 값을 포함하여 모든 값을 쉽게 주고 받기 위함이다.

```java
// Wrapper 클래스의 인스턴스를 생성할 때는 생성자 대신 클래스 메서드를 사용하라.
    Byte b2 = Byte.valueOf((byte)100);
    Short s2 = Short.valueOf((short)20000);
    Integer i2 = Integer.valueOf(3000000);
    Long l2 = Long.valueOf(60000000000L);
    Float f2 = Float.valueOf(3.14f);
    Double d2 = Double.valueOf(3.14159);
    Boolean bool2 = Boolean.valueOf(true);
    Character c2 = Character.valueOf((char)0x41);
```

![KakaoTalk_20210811_102201966](https://user-images.githubusercontent.com/86590036/128955492-9c82697f-2eeb-40ca-b816-7d70e15ee9ab.jpg)

```java
 Long obj1 = Long.valueOf(100L);

 int i = obj1.intValue();

 String s1 = obj1.toString();
```

```java
 // int ==> Integer
    int i1 = 100;
    Integer obj1 = Integer.valueOf(i1);

    // Integer ==> int
    Integer obj2 = Integer.valueOf(200);
    int i2 = obj2.intValue();
```

✔️ 오토박싱(auto-boxing)

> primitive data type 값을 Wrapper 클래스의 인스턴스에 바로 할당할 수 있다.

```java
  Integer obj = 100; // ==> Integer.valueOf(100)
```

✔️ 오토 언박싱(auto-unboxing)

> Wrapper 객체의 값을 primitive data type 변수에 직접 할당할 수 있다.

```java
 Integer obj = Integer.valueOf(300);
    int i = obj; // ==> obj.intValue()
```

```java
// auto-boxing 으로 Wrapper 객체를 생성할 경우,
    Integer obj3 = 100; // Integer.valueOf(100)
    Integer obj4 = 100; // Integer.valueOf(100);
    System.out.println(obj3 == obj4); // true
```

- ✔️ 정수 값이 -128 ~ 127 범위일 경우 자주 사용되는 수이기 때문에 String 리터럴처럼 상수 풀에 Integer 객체를 생성한다.
- ✔️ 메모리를 효율적으로 사용하기 위해 같은 값을 가지는 Integer 객체가 여러 개 존재하지 않게 한다.

```java
Integer obj7 = 128; // heap에 만들어진다
```

- ✔️ 128 ~ 127 범위를 넘어가는 경우 무조건 새 객체를 만든다.
- ✔️ 다루는 숫자가 너무 많기 때문에 무조건 상수 풀에 만들기에는 오히려 메모리 낭비가 심해지기 때문이다.
- ✔️ 상수풀에 생성된 객체는 JVM이 종료되기 전까지 유지된다. 즉 가비지가 되지 않는다.
- ✔️ 그러나 heap에 생성된 객체는 주소를 잃어 버리면 가비지가 되기 때문에 메모리를 좀 더 효율적으로 사용할 수 있다.

![정리](https://user-images.githubusercontent.com/86590036/128957205-e520955b-f247-4874-8d6d-4eabb506fe9b.jpg)
