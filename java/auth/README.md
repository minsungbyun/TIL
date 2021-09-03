## 비트 연산자를 활용한 사용자 메뉴 접근권한 통제

비트 연산자 - 사용자 권한 관리에 적용

```java
public class Exam0480 {
  public static void main(String[] args) {

    // 1) 사용자 권한을 값으로 정의

    final int LOGOUT = 0x01; // 0000 0001     - 로그아웃
    final int GENERAL = 0x02; // 0000 0010    - 일반 로그인
    final int ADMIN = 0x04; // 0000 0100    - 관리자 로그인


    // 2) 메뉴의 접근 범위 설정

    int menu1 = LOGOUT;  // 로그아웃 상태에서만 접근 가능한 메뉴
    int menu2 = GENERAL; // 일반으로 로그인 된 접근 가능한 메뉴
    int menu3 = ADMIN; // 관리자로 로그인 된 사용자만 접근 가능한 메뉴
    int menu4 = LOGOUT | GENERAL | ADMIN; // 로그아웃 되었든, 일반으로 로그인 되었든, 관리자로 로그인 되었든 모두 접근 가능한 메뉴

    // 3) 접근 테스트
    // => menu1이 로그아웃에서 접근 가능한 것인지 검사한다.
    System.out.println((menu1 & LOGOUT) > 0);
    // 계산원리
    // menu1  : 0000 0001
    // LOGOUT : 0000 0001 <-- 얘는 항상 1임
    //      & -----------
    //          0000 0001 <--- 0 보다 큰 값이 나온다.

    // 어떤 값에 대해 LOGOUT 값을 & 한다는 것은
    // LOGOUT 비트가(오른쪽에서 첫 번째 비트) 1이라는 의미다.
    // LOGOUT 비트가 1이야 아니야?

    System.out.println((menu1 & GENERAL) > 0);
    // 계산원리
    // menu1  : 0000 0001
    // GENERAL: 0000 0010
    //      & -----------
    //          0000 0000 <--- 0 이 나온다.

    // GENERAL 비트가(오른쪽에서 두 번째 비트) 1이라는 의미다.

    System.out.println((menu1 & ADMIN) > 0);
    // 계산원리
    // menu1  : 0000 0001
    // ADMIN  : 0000 0100
    //      & -----------
    //          0000 0000 <--- 0 이 나온다.

    // ADMIN 비트가(오른쪽에서 세 번째 비트) 1이라는 의미다.
  }
}

```

```java
package com.eomcs.lang.ex05;

//# 비트 연산자 : 응용 V - 사용자 권한 관리에 적용
//
public class Exam0481 {
  public static void main(String[] args) {

    // 1) 사용자 권한을 값으로 정의

    final int LOGOUT = 0x01; // 0000 0001     - 로그아웃
    final int GENERAL = 0x02; // 0000 0010    - 일반 로그인
    final int ADMIN = 0x04; // 0000 0100    - 관리자 로그인


    // 2) 메뉴의 접근 범위 설정

    int menu1 = LOGOUT;  // 로그아웃 상태에서만 접근 가능한 메뉴
    int menu2 = GENERAL; // 일반으로 로그인 된 접근 가능한 메뉴
    int menu3 = ADMIN; // 관리자로 로그인 된 사용자만 접근 가능한 메뉴
    int menu4 = LOGOUT | GENERAL | ADMIN; // 로그아웃 되었든, 일반으로 로그인 되었든, 관리자로 로그인 되었든 모두 접근 가능한 메뉴
    int menu5 = GENERAL | ADMIN; //

    // 3) 접근 테스트
    System.out.println("메뉴1에 접근 가능한 범위");
    System.out.println((menu1 & LOGOUT) > 0);
    System.out.println((menu1 & GENERAL) > 0);
    System.out.println((menu1 & ADMIN) > 0);

    System.out.println("------------------------------");
    System.out.println("메뉴2에 접근 가능한 범위");
    System.out.println((menu2 & LOGOUT) > 0);
    System.out.println((menu2 & GENERAL) > 0);
    System.out.println((menu2 & ADMIN) > 0);

    System.out.println("------------------------------");
    System.out.println("메뉴3에 접근 가능한 범위");
    System.out.println((menu3 & LOGOUT) > 0);
    System.out.println((menu3 & GENERAL) > 0);
    System.out.println((menu3 & ADMIN) > 0);

    System.out.println("------------------------------");
    System.out.println("메뉴4에 접근 가능한 범위");
    System.out.println((menu4 & LOGOUT) > 0);
    System.out.println((menu4 & GENERAL) > 0);
    System.out.println((menu4 & ADMIN) > 0);

    System.out.println("------------------------------");
    System.out.println("메뉴5에 접근 가능한 범위");
    System.out.println((menu5 & LOGOUT) > 0);
    System.out.println((menu5 & GENERAL) > 0);
    System.out.println((menu5 & ADMIN) > 0);
  }
}
```

[결과]

```java
메뉴1에 접근 가능한 범위
true
false
false
------------------------------
메뉴2에 접근 가능한 범위
false
true
false
------------------------------
메뉴3에 접근 가능한 범위
false
false
true
------------------------------
메뉴4에 접근 가능한 범위
true
true
true
------------------------------
메뉴5에 접근 가능한 범위
false
true
true

```

### 1단계 - 메뉴의 접근 범위를 지정할 상수와 생성자를 정의한다.

```java
public abstract class Menu {

  public static final int ACCESS_LOGOUT = 0x01;     // 0001
  public static final int ACCESS_GENERAL = 0x02;    // 0010
  public static final int ACCESS_ADMIN = 0x04;      // 0100

  String title;

  int accessScope;

  public Menu(String title) {
    this(title, ACCESS_LOGOUT | ACCESS_GENERAL | ACCESS_ADMIN); // 모든 사람 접근 가능
  }

  public Menu(String title, int accessScope) {
    this.title = title;
    this.accessScope = accessScope;
  }

  public abstract void execute();
}
```

### 2단계 - 로그인/로그아웃 할 때 사용자의 권한을 설정한다.

```java
public class AuthLoginHandler implements Command {

  List<Member> memberList;

  static Member loginUser;
  static int userAccessLevel = Menu.ACCESS_LOGOUT; // 기본은 로그아웃 된 상태이다.

  public static Member getLoginUser() {
    return loginUser;
  }
  public static int getUserAccessLevel() {
    return userAccessLevel;
  }

  ....
}
```

조건 1줄이면 끝난다. 이 식은 바꿀 필요 없다
조건문을 덕지덕지 할 필요없다
그사람의 접근 권한과 메뉴에 대한 접근권한을 비교해서 한 방에 끝낸다.

```java
 private List<Menu> getMenuList() {
    ArrayList<Menu> menuList = new ArrayList<>();
    for (Menu menu : childs) {
      // 사용자가 해당 메뉴에 접근 할 수 있는지 검사한다.
      // 예) 메뉴의 접근 범위   : 0100 = 관리자만 접근 가능
      //     사용자의 접근 수준 : 0110
      if ((menu.accessScope & AuthLoginHandler.getUserAccessLevel()) > 0) {
        menuList.add(menu);
      }
    }
    return menuList;
  }
```

### 3단계 - 메뉴를 구성할 때 접근 범위를 설정한다.

```java
Menu createMainMenu() {
    MenuGroup mainMenuGroup = new MenuGroup("메인");
    mainMenuGroup.setPrevMenuTitle("종료");

    mainMenuGroup.add(new MenuItem("로그인", ACCESS_LOGOUT , "/auth/login"));
    mainMenuGroup.add(new MenuItem("내정보", ACCESS_GENERAL, "/auth/userinfo"));
    mainMenuGroup.add(new MenuItem("로그아웃", ACCESS_GENERAL, "/auth/logout"));

    mainMenuGroup.add(createBoardMenu());
    mainMenuGroup.add(createMemberMenu());
    mainMenuGroup.add(createProjectMenu());
    mainMenuGroup.add(createTaskMenu());
    mainMenuGroup.add(createAdminMenu());

    return mainMenuGroup;
  }
```

Menu.ACCESS\_권한
여기서 Menu를 지우고 싶다면 import static으로 설정하라

```java
import static com.eomcs.menu.Menu.ACCESS_ADMIN;
import static com.eomcs.menu.Menu.ACCESS_GENERAL;
import static com.eomcs.menu.Menu.ACCESS_LOGOUT;
```
