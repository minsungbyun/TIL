## 객체배열은 왜 필요할까?

---

### 기존 배열의 사용

---

- 회원정보를 입력받기 위해 각각의 항목을 배열로 선언하였다.
- 배열의 size를 초기값 0으로 지정하였다.
- add()가 호출되고 사용자의 입력이 끝나면 size는 1씩 증가한다.
- list()를 호출하면 저장된 배열의 인덱스에 따라 회원 목록을 출력한다.

```java
import java.sql.Date;

public class MemberHandler {

  static final int LENGTH = 100;
  static int[] no = new int[LENGTH];
  static String[] name = new String[LENGTH];
  static String[] email = new String[LENGTH];
  static String[] password = new String[LENGTH];
  static String[] photo = new String[LENGTH];
  static String[] tel = new String[LENGTH];
  static Date[] registeredDate = new Date[LENGTH];
  static int size = 0;

  static void add() {
    System.out.println("[회원 등록]");

    no[size] = Prompt.inputInt("번호? ");
    name[size] = Prompt.inputString("이름? ");
    email[size] = Prompt.inputString("이메일? ");
    password[size] = Prompt.inputString("암호? ");
    photo[size] = Prompt.inputString("사진? ");
    tel[size] = Prompt.inputString("전화? ");
    registeredDate[size] = new Date(System.currentTimeMillis());

    size++;
  }

  static void list() {
    System.out.println("[회원 목록]");
    for (int i = 0; i < size; i++) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          no[i], name[i], email[i], tel[i], registeredDate[i]);
    }
  }
}

```

### 문제점 : 배열의 주소를 일일이 정해줘야 한다.

---

- 회원정보를 입력받는 배열을 따로 Member 클래스로 분리하였다.
- 그에따라 배열의 주소를 받기 위해 레퍼런스 변수를 선언하였다.
- 사용자의 입력 값을 담은 배열의 주소를 저장하기 위해 조건문을 작성하였다. <br>(JVM stack에 있는 레퍼런스는 메서드 종료시 사라진다.)
- 하지만 코드가 더 복잡해졌다.

```java

import java.sql.Date;

public class MemberHandler {

  static Member m1, m2 , m3 , m4, m5;

  static void add() {
    System.out.println("[회원 등록]");

    // 새 회원 정보를 담을 변수를 준비한다.
    // 낱개의 변수가 아니라 Member에 정의된 대로 묶음 변수를 만든다.

    Member member = new Member();

    member.no = Prompt.inputInt("번호? ");
    member.name = Prompt.inputString("이름? ");
    member.email = Prompt.inputString("이메일? ");
    member.password = Prompt.inputString("암호? ");
    member.photo = Prompt.inputString("사진? ");
    member.tel = Prompt.inputString("전화? ");
    member.registerdDate = new Date(System.currentTimeMillis());


    if (m1 == null) {
      m1 = member;
    } else if (m2 == null) {
      m2 = member;
    } else if (m3 == null) {
      m3 = member;
    } else if (m4 == null) {
      m4 = member;
    } else if (m5 == null) {
      m5 = member;
    }

  }

  static void list() {
    System.out.println("[회원 목록]");
    if (m1 != null) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          m1.no, m1.name, m1.email, m1.tel, m1.registerdDate);
    }
    if (m2 != null) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          m2.no, m2.name, m2.email, m2.tel, m2.registerdDate);
    }
    if (m3 != null) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          m3.no, m3.name, m3.email, m3.tel, m3.registerdDate);
    }
    if (m4 != null) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          m4.no, m4.name, m4.email, m4.tel, m4.registerdDate);
    }
    if (m5 != null) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          m5.no, m5.name, m5.email, m5.tel, m5.registerdDate);
    }
  }
}

```

### 해결방안 : 값이 아닌 주소를 저장하는 배열의 필요성

---

```java
레퍼런스와 레퍼런스 배열 그리고 레퍼런스 배열을 가리키는 배열레퍼런스
Member m;
Member m = new Member();
Member[]  member = new Member[100];
인스턴스를 여러개 만드는 것은 지구상에 존재하지 않는다.
static 변수는 Method Area에 생성된다. 클래스가 로딩될 때 만들어진다.
```

- Heap 영역에 인스턴스를 여러개 만드는 방법은 없을까요? 없어
- new 연산자로 만들어진 모든 것은 Heap영역에 생성된다.

---

#### 객체 배열의 등장

- 객체의 주소를 담는 레퍼런스를 일일이 만드는 것이 아닌 주소를 담는 배열을 만든다.
- Member[] member = new Member[MAX_LANGTH]; 객체 배열을 만든다.
- members[size++] = member; member의 객체 주소를 members에 저장한다.
- 주소를 보관하고 있기 때문에 add()가 사라져도 상관없다.
- 코드가 훨씬 간결해졌다!

```java

import java.sql.Date;

public class MemberHandler {


  static final int MAX_LANGTH = 5;
  static Member[] members = new Member[MAX_LANGTH];
  static int size = 0;

  static void add() {
    System.out.println("[회원 등록]");

    // 새 회원 정보를 담을 변수를 준비한다.
    // 낱개의 변수가 아니라 Member에 정의된 대로 묶음 변수를 만든다.

    Member member = new Member();

    member.no = Prompt.inputInt("번호? ");
    member.name = Prompt.inputString("이름? ");
    member.email = Prompt.inputString("이메일? ");
    member.password = Prompt.inputString("암호? ");
    member.photo = Prompt.inputString("사진? ");
    member.tel = Prompt.inputString("전화? ");
    member.registerdDate = new Date(System.currentTimeMillis());


    members[size++] = member; // 객체 배열에 주소를 저장한다.

  }

  static void list() {
    System.out.println("[회원 목록]");

    for (int i = 0; i< size; i++) {
      System.out.printf("%d, %s, %s, %s, %s\n",
          members[i].no, members[i].name, members[i].email, members[i].tel, members[i].registerdDate);
    }
  }
}


```
