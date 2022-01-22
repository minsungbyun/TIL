## 📌 인터페이스와 상속

![인터페이스의 상속](https://user-images.githubusercontent.com/86590036/129304521-dd1050d3-3743-4c6b-a8aa-93afb01dbbf4.jpg)

![인터페이스의 다중상속](https://user-images.githubusercontent.com/86590036/129304536-df663737-a37c-44c0-9fcc-8cc439b73f77.jpg)

![인터페이스의 다중상속불가](https://user-images.githubusercontent.com/86590036/129304541-55806520-db02-401f-bee2-28ad05598e81.jpg)

#### 중복 메서드가 오버로딩 규칙을 위반할 경우 다중 구현 불가

1. 파라미터 타입,개수,순서가 다른 경우 같은 이름의 메서드를 중복 정의 할 수 있다.
2. 파라미터명은 상관없다.
3. 리턴타입도 상관없다.

## 📌 인터페이스와 추상클래스의 콜라보 Ⅰ

![인터페이스와 추상클래스의 콜라보](https://user-images.githubusercontent.com/86590036/129304369-f74957e0-3659-4769-83af-5d2d4be3ec4d.jpg)

```java
 interface ProtocolA {
    void rule1();
    void rule2();
    void rule3();
    void rule4();
  }
```

```java
// 추상클래스에서 인터페이스의 규칙을 모두 미리 구현해 둔다.
  // 물론 최소 상태로 구현한다.
  abstract class AbstractProtocolA implements ProtocolA {
    @Override
    public void rule1() {}

    @Override
    public void rule2() {}

    @Override
    public void rule3() {}

    @Override
    public void rule4() {}
  }
```

```java
class ProtocolAImpl extends AbstractProtocolA {
    // 이 방식의 장점은 오버라이딩을 통해
    // 인터페이스 규칙 중 필요한 규칙만 구현할 수 있다.
    @Override
    public void rule2() {
      System.out.println("ProtocolAImpl.rule2()");
    }
  }
```

```java
public class Exam0120 {
  void test() {
    ProtocolAImpl obj = new ProtocolAImpl();

    // 수퍼 클래스가 인터페이스를 구현했다면,
    // 그 서브 클래스는 자동으로 인터페이스를 구현한 것이 된다.
    // 증명!
    //
    ProtocolA a = obj;

    a.rule2();
  }

  public static void main(String[] args) {
    new Exam0120().test();
  }
}
```

## 📌 인터페이스와 추상클래스의 콜라보 Ⅱ

![인터페이스와 추상클래스의 콜라보2](https://user-images.githubusercontent.com/86590036/129304399-d55b2144-b058-4c72-9939-64ef51625309.jpg)

1. 인터페이스 정의
2. 추상 클래스로 인터페이스의 일부 규칙 구현하기
3. 인터페이스 직접 구현하기
4. 인터페이스 간접 구현
5. 인터페이스 규칙에 따라 구현체 사용하기

## 📌 인터페이스와 클래스 추가

![인터페이스의 규칙 1](https://user-images.githubusercontent.com/86590036/129304467-2869529f-d5a4-4d25-87a2-b5a6195dd768.jpg)

- 자기가 만든 인터페이스를 다른 개발자들이 그들 프로젝트에 사용하는 입장이라면?
- 그 사람들에게 영향 끼치겠죠
  그렇다고 해서 계속 옛날 규칙을 가져갈 수 없고,
  새 프로젝트에는 변경된 규칙으로 클래스를 만들고 싶고..

- 이 문제를 해결할 2가지 방법이 바로 상속과 default메서드이다.

### 인터페이스의 새 규칙 추가 : 상속으로 해결해보자

![인터페이스의 규칙 2](https://user-images.githubusercontent.com/86590036/129304478-5ba61cdd-dfae-4830-8f9b-eec6e0fa0497.jpg)

상속을 이용하여 규칙을 추가할 때,

- 서브 인터페이스를 통해 새 규칙을 추가한다.
- 새 인터페이스에 맞는 메서드를 따로 정의해야 한다.

새 규칙을 새 인터페이스(예: Computer2)로 정의할 순 있지만,
그렇게 하면 기존에 진행한 모든 프로젝트들과 호환되지 않는 문제가 발생한다.

### 인터페이스의 새 규칙 추가 : default 메서드의 등장

- 기존 프로젝트에 영향을 끼치지 않으면서 기존 규칙에
- 새 메서드를 추가할 때 유용한다.
- 인터페이스에서 미리 구현한 메서드이기 때문에 클래스에서 구현을 생략할 수 있다.
- 반대로 구현을 강제할 수 없다는 것이 단점이다.
- 오버라이딩 해도 되고 안해도 된다.

  ```java
  interface MyInterface3 {
  void m1();

  default void m2() {
    System.out.println("MyInterface3.m2()");
    }
  }
  ```

#### 어 그러면 추상 클래스랑 비슷하지 않나요?

- 추상클래스는 extends 다중 상속이 안되고 인터페이스는 implements 다중 상속이 가능하다
  - 리턴타입이 다르면 동일한 메서드에 대해 다중 상속이 불가능하다.
- 인스턴스 필드,메서드 선언이 불가능하다.
  다 스태틱이다, 객체생성 안된다.
- 일반 필드나 메서드를 선언할 수 없다.
- 목적이 다르다. (규칙 vs 서브클래스의 공통 멤버 미리구현)

#### 인터페이스에 그냥 메서드 다 추가하면 안되나요?

- 인터페이스의 메서드를 변경하거나 제거, 추가하는 순간 이 인터페이스를 구현한 모든 클래스들에서 컴파일 오류가 발생하게 된다.

#### default 메서드의 용도

- 기존에 정의된 인터페이스에 새 규칙을 추가할 때
  기존 프로젝트에 영향을 끼치지 않기 위함이다.
- 따라서 새 인터페이스를 정의할 때는 default의 사용을 자제해야 한다.

![인터페이스와 추상클래스의 콜라보3](https://user-images.githubusercontent.com/86590036/129304426-0e36b13f-6d84-4373-b31b-244722bf3a7f.jpg)

#### default 메서드의 단점

- 디폴트 메서드를 추가할 때 간단하게 코드를 작성할 수 있지만,
- 클래스처럼 뭔가 진짜 일을 하는 코드를 작성하는 것은 좋지 않다. 빈 메서드를 만드는 것을 추천한다.

### 인터페이스에서도 static 메서드가 가능하다고?

인터페이스에서 스태틱 메서드는 보통 그 인터페이스를 구현한 객체를 다루는 일을 한다.
클래스에 있는 스태틱메서드 보다 좁게 사용된다.
규칙을 다루는 스태틱 메서드가 필요한 경우 사용한다.

- 인터페이스에서 스태틱메서드 - 그 인터페이스의 구현체를 다룰 때
-
- 클래스에서 스태틱메서드 - 그 클래스의 객체를 다룰 때

### trade off 관계인 어탭터 디자인 패턴과 디폴트 메서드

- 어댑터 디자인 패턴 - 코딩할 내용은 많아지지만 인터페이스의 규칙을 구현하도록 강제할 수 있다.

- 인터페이스 디폴트 메서드 - 코딩의 편리함을 취한다. 그 대신 인터페이스의 존재 이유인 규칙 강제를 할 수 없다.
  그래서 신중하게 사용해야한다.
