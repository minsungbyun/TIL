
## 상수는 언제 사용할까?

다음 자바 코드는 각각의 멤버의 아이디와 패스워드 멤버의 종류를 나타내는 코드이다.

이를 통해 상수를 왜 사용해야하는지 알아봅시다!


### 상수로 나타내지 않을 때 문제점?

아래 코드에서 멤버의 종류를 숫자로 나타내면 어떤 불편함이 있을까?
- 1달뒤 코드를 본다면? 아니 하루 뒤에도 기억 못할 수 있다. (0은뭐지?, 1이뭐야?, 2는 뭐지?)
- 주석을 적어놓아도 매번 확인하기 귀찮다.
- 유효한 이름을 지어서 알아보기 쉽게 만들 필요가 있다.

```java

public class ConstantEx1 {

  static class Member {
    String id;
    String password;
    int type; // 0: 손님, 1: 회원, 2: 관리자
  }

  public static void main(String[] args) {
    Member m1 = new Member();
    m1.id = "aaa";
    m1.password = "1111";
    m1.type = 0;

    Member m2 = new Member();
    m2.id = "bbb";
    m2.password = "1111";
    m2.type = 2;

    Member m3 = new Member();
    m3.id = "ccc";
    m3.password = "1111";
    m3.type = 1;

  }
}
```

![상수1](https://user-images.githubusercontent.com/86590036/127098470-0eda7dcf-e799-4b94-9377-c59b943585a7.jpg)


### 유효한 이름으로 상수 만들기

- 값을 저장하는 것이 아닌 조회하는 용도로만 사용하는 변수라면 대문자로 선언하여 상수임을 표현하라!
- 조회 용도로만 사용하기로 했으면 final로 값을 변경되는 것을 막아라!
 - 보통 조회용으로 사용하는 변수는 공개해도 되기 때문에 public으로 선언한다!
 - Member.GUEST처럼 하지 않고 더 간단하게 만들 수 없을까?

```java

public class ConstantEx2 {

  static class Member {
    
    public static final int GUEST = 0;
    public static final int MEMBER = 1;
    public static final int MANAGER = 2;

    String id;
    String password;
    int type; // 0: 손님, 1: 회원, 2: 관리자
  }

  public static void main(String[] args) {
   
    Member m4 = new Member();
    m4.id = "aaa";
    m4.password = "1111";
    m4.type = Member.GUEST;
    
    Member m5 = new Member();
    m5.id = "bbb";
    m5.password = "1111";
    m5.type = Member.MANAGER;

    Member m6 = new Member();
    m6.id = "ccc";
    m6.password = "1111";
    m6.type = Member.MEMBER;
  }
}
```

![상수2](https://user-images.githubusercontent.com/86590036/127098484-f4e03566-28f9-47f3-b841-7402ca175757.jpg)

### 별도의 클래스에서 상수를 관리하자

- Member의 정보는 Member 클래스를 만들어 별도로 관리한다.
- GRASP (object-oriented design)의 `Information expert` 패턴을 적용하라

- Member.GUEST 처럼 클래스명.변수명으로 쓰지 않고 변수명으로만 나타낼 수 있게 되었다.

```java
import static com.eomcs.oop.ex03.Member.GUEST;
import static com.eomcs.oop.ex03.Member.MANAGER;
import static com.eomcs.oop.ex03.Member.MEMBER;

public class ConstantEx3 {
  public static void main(String[] args) {

    Member m4 = new Member();
    m4.id = "aaa";
    m4.password = "1111";
    m4.type = GUEST;
   

    Member m5 = new Member();
    m5.id = "bbb";
    m5.password = "1111";
    m5.type = MANAGER;

    Member m6 = new Member();
    m6.id = "ccc";
    m6.password = "1111";
    m6.type = MEMBER;
  }
}

```
```java
package com.eomcs.oop.ex03;

public class Member {

  public static final int GUEST = 0;
  public static final int MEMBER = 1;
  public static final int MANAGER = 2;

  String id;
  String password;
  int type; // 0: 손님, 1: 회원, 2: 관리자
}
```

![상수3](https://user-images.githubusercontent.com/86590036/127098505-28cb05c3-3aca-4b1e-9dfb-a78d8ac5f984.jpg)

### 결론

- 상수를 사용하게 되면 값을 통해 나타낼 수 있는 정보들을 의미 있는 변수명으로 나타낼 수 있다.
- 유지보수에 용이하며, 가독성이 좋아진다.
