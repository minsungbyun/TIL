## 소개

> 사용자로부터 구성원, 프로젝트, 작업에 대한 내용을 입력받고 그에대한 내용을 출력하는 프로그램

## 사용된 메서드

| 이름           | 기능                   |
| :------------- | :--------------------- |
| addMember()    | 멤버를 추가한다        |
| listMembers()  | 멤버 리스트를 출력한다 |
| addProject()   | 프로젝트를 추가한다    |
| listProjects() | 프로젝트를 출력한다    |
| addTask()      | 작업을 추가한다        |
| listTasks()    | 작업을 출력한다        |
| promptString() | 문자열을 입력받는다    |
| promptInt()    | 정수를 입력받는다      |
| promptDate()   | 날짜를 입력받는다      |

## 사용된 문법

| 문법   |
| ------ |
| for    |
| array  |
| switch |
| if     |

## step by step

- 배열을 사용해 입력데이터를 저장하였다.
- 스캐너를 통해 콘솔로 사용자 입력을 받았다.

```java
1) 회원 데이터를 입력 받는 코드를 별도의 메서드로 분리한다.
//   => addMember() 메서드 정의 및 회원 등록 코드를 가져오기
//   => main()과 addMember()가 서로 공유하는 변수는 클래스 변수로 만든다.

2) 입력된 회원 데이터의 목록을 출력하는 코드를 별도의 메서드로 분리한다.
//   => listMembers() 메서드 정의 및 관련된 코드를 가져오기

3) 프로젝트 데이터를 입력 받는 코드를 별도의 메서드로 분리한다.
//   => addProject() 메서드 정의 및 관련 코드를 가져오기
//   => main()과 addProject()가 서로 공유하는 변수는 클래스 변수로 만든다.

4) 입력된 프로젝트 데이터의 목록을 출력하는 코드를 별도의 메서드로 분리한다.
//   => listProjects() 메서드 정의 및 관련된 코드를 가져오기

5) 작업 데이터를 입력 받는 코드를 별도의 메서드로 분리한다.
//   => addTask() 메서드 정의 및 관련 코드를 가져오기
//   => main()과 addTask()가 서로 공유하는 변수는 클래스 변수로 만든다.

6) 입력된 작업 데이터의 목록을 출력하는 코드를 별도의 메서드로 분리한다.
//   => listTasks() 메서드 정의 및 관련된 코드를 가져오기

7) 사용자로부터 명령어를 입력 받는 코드를 별도의 메서드로 분리한다.
//   => prompt() 메서드를 정의하고 관련된 코드를 가져오기\

8) 명령어 뿐만 아니라 사용자로부터 입력을 받는 기능을 모두 prompt()를 사용하여 처리한다.
//   => prompt()를 호출할 때 사용자에게 출력할 프롬프트 메시지를 아규먼트로 넘긴다.
//   => prompt()는 호출할 때 넘어온 프롬프트 메시지 값을 파라미터로 받는다.

9) prompt() 가 작업한 결과를 클래스 변수에 담지 말고 호출자에게 리턴한다.
//   => prompt()를 실행한 후 사용자가 입력한 문자열을 리턴한다.

10) prompt()의 기능을 더 세분화한다.
//   => promptString() : 사용자로부터 문자열을 입력 받아 리턴한다.
//   => promptInt() : 사용자로부터 숫자를 입력 받아 리턴한다.
//   => promptDate() : 사용자로부터 날짜를 입력 받아 리턴한다.

11) promtString(), promptInt(), promptDate() 메서드의 코드를 정리한다.
```

## 코드 분석

```java
import java.sql.Date;
import java.util.Scanner;


public class ShowInfo {

  static Scanner keyboardScan = new Scanner(System.in);

  // 회원 정보
  static final int LENGTH = 100;
  static int[] no = new int[LENGTH];
  static String[] name = new String[LENGTH];
  static String[] email = new String[LENGTH];
  static String[] password = new String[LENGTH];
  static String[] photo = new String[LENGTH];
  static String[] tel = new String[LENGTH];
  static Date[] registeredDate = new Date[LENGTH];
  static int size = 0;

  // 프로젝트 정보
  static final int PROJECT_LENGTH = 1000;
  static int[] pNo = new int[PROJECT_LENGTH];
  static String[] pTitle = new String[PROJECT_LENGTH];
  static String[] pContent = new String[PROJECT_LENGTH];
  static Date[] pStartDate = new Date[PROJECT_LENGTH];
  static Date[] pEndDate = new Date[PROJECT_LENGTH];
  static String[] pOwner = new String[PROJECT_LENGTH];
  static String[] pMembers = new String[PROJECT_LENGTH];
  static int pSize = 0;

  // 작업 정보
  static final int TASK_LENGTH = 100;
  static int[] tNo = new int[TASK_LENGTH];
  static String[] tContent = new String[TASK_LENGTH];
  static Date[] tDeadline = new Date[TASK_LENGTH];
  static String[] tOwner = new String[TASK_LENGTH];
  static int[] tStatus = new int[TASK_LENGTH];
  static int tSize = 0;

  public static void main(String[] args) {

    while (true) {
      String input = promptString("명령> ");

      if (input.equals("exit") || input.equals("quit")) {
        System.out.println("안녕!");
        break;
      } else if (input.equals("/member/add")) {
        // 메서드로 분리한 코드를 실행하기(메서드 호출)
        // => 메서드명();
        addMember();

      } else if (input.equals("/member/list")) {
        listMembers();

      }  else if (input.equals("/project/add")) {
        addProject();

      }  else if (input.equals("/project/list")) {
        listProjects();

      }  else if (input.equals("/task/add")) {
        addTask();

      }  else if (input.equals("/task/list")) {
        listTasks();

      } else {
        System.out.println("실행할 수 없는 명령입니다.");
      }
      System.out.println();
    }

    keyboardScan.close();
  }

  static void addMember() {
    System.out.println("[회원 등록]");

    //    String input = prompt("번호? ");
    //    no[size] = Integer.parseInt(input);

    no[size] = promptInt("번호? ");
    name[size] = promptString("이름? ");
    email[size] = promptString("이메일? ");
    password[size] = promptString("암호? ");
    photo[size] = promptString("사진? ");
    tel[size] = promptString("전화? ");
    registeredDate[size] = new Date(System.currentTimeMillis());

    size++;
  }

  static void listMembers() {
    System.out.println("[회원 목록]");
    for (int i = 0; i < size; i++) {
      // 번호, 이름, 이메일, 전화, 가입일
      System.out.printf("%d, %s, %s, %s, %s\n", // 출력 형식 지정
          no[i], name[i], email[i], tel[i], registeredDate[i]);
    }
  }

  static void addProject() {
    System.out.println("[프로젝트 등록]");

    pNo[pSize] = promptInt("번호? ");
    pTitle[pSize] = promptString("프로젝트명? ");
    pContent[pSize] = promptString("내용? ");
    pStartDate[pSize] = promptDate("시작일? ");
    pEndDate[pSize] = promptDate("종료일? ");
    pOwner[pSize] = promptString("만든이? ");
    pMembers[pSize] = promptString("팀원? ");

    pSize++;
  }

  static void listProjects() {
    System.out.println("[프로젝트 목록]");
    for (int i = 0; i < pSize; i++) {
      // 번호, 프로젝트명, 시작일, 종료일, 만든이
      System.out.printf("%d, %s, %s, %s, %s\n", // 출력 형식 지정
          pNo[i], pTitle[i], pStartDate[i], pEndDate[i], pOwner[i]);
    }
  }

  static void addTask() {
    System.out.println("[작업 등록]");

    tNo[tSize] = promptInt("번호? ");
    tContent[tSize] = promptString("내용? ");
    tDeadline[tSize] = promptDate("마감일? ");

    System.out.println("상태?");
    System.out.println("0: 신규");
    System.out.println("1: 진행중");
    System.out.println("2: 완료");
    tStatus[tSize] = promptInt("> ");
    tOwner[tSize] = promptString("담당자? ");

    tSize++;
  }

  static void listTasks() {
    System.out.println("[작업 목록]");

    for (int i = 0; i < tSize; i++) {
      String stateLabel = null;
      switch (tStatus[i]) {
        case 1:
          stateLabel = "진행중";
          break;
        case 2:
          stateLabel = "완료";
          break;
        default:
          stateLabel = "신규";
      }
      // 번호, 작업명, 마감일, 프로젝트, 상태, 담당자
      System.out.printf("%d, %s, %s, %s, %s\n", // 출력 형식 지정
          tNo[i], tContent[i], tDeadline[i], stateLabel, tOwner[i]);
    }
  }

  // 사용자로부터 문자열을 입력 받아 리턴한다.
  static String promptString(String title) {
    System.out.print(title);
    return keyboardScan.nextLine();
  }

  // 사용자로부터 숫자를 입력 받아 리턴한다.
  static int promptInt(String title) {
    return Integer.parseInt(promptString(title));
  }

  // 사용자로부터 날짜를 입력 받아 리턴한다.
  static Date promptDate(String title) {
    return Date.valueOf(promptString(title));
  }

}

```

### 리팩토링

#### 1. 입력메세지와 콘솔 입력을 담당하는 프롬프트 메소드 선언

<문제점>

- prompt메소드의 return값인 콘솔창 입력의 결과가 String을 return하여서 따로 Int type, Date type으로 변환해줘야하는 번거로움 발생

<해결방안>

- 위의 문제를 해결하기 위해서 return type별로 메소드를 나누려고함.
- 메소드를 나누면서 각각의 type별로 변환해주는 Integer.parseInt()와 Date.valueOf()를 사용

```java
//사용자로부터 문자열을 입력 받아 리턴한다.
  static String prompt(String title) {
    System.out.print(title);
    return keyboardScan.nextLine();
  }

```

#### 2. prompt()를 promptString(), promptInt(), promptDate()로 세분화하였다.

<문제점>

- System.out.print(title)부분이 겹치는 문제발생

<해결방안>

- prompInt와 promptDate()에서 공통적으로 선언된 System.out.print(title)를 지우고<br> keyboardScan.nextLine() 자리에 promptString()를 호출함으로서 title을 출력하는 부분을 줄인다.

```java

  static String promptString(String title) {
    System.out.print(title);
    return keyboardScan.nextLine();
  }


  static int promptInt(String title) {
     System.out.print(title);
    return Integer.parseInt(keyboardScan.nextLine());
  }


  static Date promptDate(String title) {
     System.out.print(title);
    return Date.valueOf(keyboardScan.nextLine());
  }

}
```

#### 3. 공통된 부분은 지우고 동일한 메소드를 선언함으로서 중복 제거

```java

  static String promptString(String title) {
    System.out.print(title);
    return keyboardScan.nextLine();
  }


  static int promptInt(String title) {
    return Integer.parseInt(promptString(title));
  }


  static Date promptDate(String title) {
    return Date.valueOf(promptString(title));
  }

}
```
