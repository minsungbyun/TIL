## 의존 객체(dependency object)란?

---

- 작업을 수행하기 위해 사용하는 객체다.
- 작업할 때 의존하는 객체라고 해서 **의존 객체** 라 부른다.

**일시적인 의존 관계(dependency)**

- 특정 메서드에서만 사용되는 경우
- 보통 파라미터나 로컬 변수로 사용한다.

**지속적인 의존 관계(association)**

- 여러 메서드에서 사용되는 경우
- 보통 인스턴스 필드로 사용한다.

![의존관계1](https://user-images.githubusercontent.com/86590036/126963867-f413401e-86b5-4ffe-b22d-b17632f7e131.jpg)

## 의존 객체를 사용하면 좋은 이유?

---

![step을 통해 알아보자](https://user-images.githubusercontent.com/86590036/126971712-18b99f42-6082-42aa-8be5-8de0e0cadedc.jpg)

### STEP1. 파라미터로 주소를 넘겨주다.

- 현재상황

  - App.java (main)에서 ProjectHandler.java를 실행시킬 때 반드시 MemberHandler.java의 exist() 메서드가 필요
  - add(), update()에서 exist()메서드를 필요로 하기에 파라미터로 주소를 넘겨줌.

  ```java
  public class ProjectHandler {

  static final int MAX_LENGTH = 5;

  Project[] projects = new Project[MAX_LENGTH];
  int size = 0;

  public void add(MemberHandler memberHandler) {
    System.out.println("[프로젝트 등록]");

    Project project = new Project();

    project.no = Prompt.inputInt("번호? ");
    project.title = Prompt.inputString("프로젝트명? ");
    project.content = Prompt.inputString("내용? ");
    project.startDate = Prompt.inputDate("시작일? ");
    project.endDate = Prompt.inputDate("종료일? ");

    project.owner = promptOwner(memberHandler, "만든이?(취소: 빈 문자열) ");
    if (project.owner == null) {
      System.out.println("프로젝트 등록을 취소합니다.");
      return;
    }

    project.members = promptMembers(memberHandler, "팀원?(완료: 빈 문자열) ");

    this.projects[this.size++] = project;
  }

  public void update(MemberHandler memberHandler) {
    System.out.println("[프로젝트 변경]");
    int no = Prompt.inputInt("번호? ");

    Project project = findByNo(no);

    if (project == null) {
      System.out.println("해당 번호의 프로젝트가 없습니다.");
      return;
    }

    String title = Prompt.inputString(String.format("프로젝트명(%s)? ", project.title));
    String content = Prompt.inputString(String.format("내용(%s)? ", project.content));
    Date startDate = Prompt.inputDate(String.format("시작일(%s)? ", project.startDate));
    Date endDate = Prompt.inputDate(String.format("종료일(%s)? ", project.endDate));

    String owner = promptOwner(memberHandler, String.format(
        "만든이(%s)?(취소: 빈 문자열) ", project.owner));
    if (owner == null) {
      System.out.println("프로젝트 변경을 취소합니다.");
      return;
    }

    String members = promptMembers(memberHandler, String.format(
        "팀원(%s)?(완료: 빈 문자열) ", project.members));

    String input = Prompt.inputString("정말 변경하시겠습니까?(y/N) ");
    if (input.equalsIgnoreCase("n") || input.length() == 0) {
      System.out.println("프로젝트 변경을 취소하였습니다.");
      return;
    }

    project.title = title;
    project.content = content;
    project.startDate = startDate;
    project.endDate = endDate;
    project.owner = owner;
    project.members = members;

    System.out.println("프로젝트를 변경하였습니다.");
  }

  ```

- add(MemberHandler memberHandler)
- update(MemberHandler memberHandler)

> 여러 메서드에서 사용하는 의존객체라면 일시적인 관계(파라미터)가 아니라 지속적인 관계(인스턴스필드)로 설정하는게 좋다.

### STEP2. 메서드에서 공통적으로 사용하는 주소 분리

- add(), update()에서 공통적으로 사용하는 MemberHandler의 주소를 인스턴스 필드로 설정했다.

```java
public class ProjectHandler {

  static final int MAX_LENGTH = 5;

  Project[] projects = new Project[MAX_LENGTH];
  int size = 0;

  // MemberHandler 인스턴스의 주소를 받을 준비
  public MemberHandler memberHandler;

  public void add() {
    System.out.println("[프로젝트 등록]");

    Project project = new Project();

    ... 중략 ...
```

- MemberHandler memberHandler; 을 인스턴스 필드로 만들었고 그에 대한 주소를 메인 클래스인 App.java에서 memberHandler의 주소를 받아오도록 했다.

```java
public class App {

  public static void main(String[] args) {

    BoardHandler boardHandler = new BoardHandler();

    MemberHandler memberHandler = new MemberHandler();

    ProjectHandler projectHandler = new ProjectHandler();
    // memberHandler의 주소 주입
    projectHandler.memberHandler = memberHandler;

    TaskHandler taskHandler = new TaskHandler();

    ... 중략 ...
```

### STEP3. 의존 객체를 강제하지 않는다면?

- 이 방법의 가장 큰 문제점은 개발자가 잊어버리고 memberHandler의 주소 주입을 하지 않고 실행시킨다면 nullPointerException이 발생한다.
- 내가 짠 코드도 몇 달 지나면 까먹는다.

```java
public class App {

  public static void main(String[] args) {

    BoardHandler boardHandler = new BoardHandler();

    MemberHandler memberHandler = new MemberHandler();

    ProjectHandler projectHandler = new ProjectHandler();
    // memberHandler의 주소 주입 이 부분을 안한다면?
    projectHandler.memberHandler = memberHandler;

    TaskHandler taskHandler = new TaskHandler();

    ... 중략 ...
```

### STEP4. 의존 객체를 강제시켜보자.

> 의존객체를 넘긴다는것은 데이터를 넘기는 것이다.
> 의존객체를 받는다는것은 메서드를 실행할 때 그 데이터가 필요하다는 것이다.

- projectHandler 만들고 싶어? 그러면 memberHandler 반드시 주입해 사용할거니까

```java
public class ProjectHandler {

  static final int MAX_LENGTH = 5;

  Project[] projects = new Project[MAX_LENGTH];
  int size = 0;

  // public을 할 필요가 없다.
  MemberHandler memberHandler;

  // 생성자로 주소 주입
  public ProjectHandler(MemberHandler memberHandler) {
    this.memberHandler = memberHandler;
  }


```

```java
public class App {

  public static void main(String[] args) {

    BoardHandler boardHandler = new BoardHandler();
    MemberHandler memberHandler = new MemberHandler();

    // 생성자 주입 하지 않으면 컴파일 조차 안됨.
    ProjectHandler projectHandler = new ProjectHandler(memberHandler);
    TaskHandler taskHandler = new TaskHandler();

```

### 결론

`생성자를 주입`함으로써 확실하게 주소를 넘겨줄 수 있게 되었고 다른 클래스의 인스턴스 메서드를 사용할 때, 더 이상 파라미터로 주소를 넘겨주지 않아도 된다.<br>
그 결과 지속적인 관계(association)로 의존객체를 사용할 수 있게 되었다.
