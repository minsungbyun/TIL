## 💻 프로그램이 실행되는 과정

지구상에 있는 모든 컴퓨터는 다음과 같은 방법으로 실행된다.

1. 명령어를 실행시키고 싶다면 HDD에 저장된 실행파일(명령어), 데이터파일(mpeg,mp4)을 RAM으로 가져와야한다. <br>
   이를 `loading`이라고 한다.

2. RAM에서는 해당 실행파일 혹은 데이터파일 중 일부를 읽어서(용량이 크다면) CPU로 보낸다.
3. CPU(L1 캐시)가 작업을 수행한다.

### 💻 JVM의 메모리 구조

Java의 JVM의 메모리는 3가지 구조를 가지고 있으며 각각의 역할은 다음과 같다.

| 영역            | 설명                                                           |
| --------------- | -------------------------------------------------------------- |
| Method Area     | .class의 내용 (클래스코드, 상수, 클래스 변수)                  |
| JVM stack       | 메서드를 호출할 때 생성되는 로컬 변수를 둔다 (메소드,파라미터) |
| Heap (only new) | new 연산자로 생성되는 변수                                     |

## 📌 call by value (실체를 넘긴다)

- call by value 1
  ![01_call by value](https://user-images.githubusercontent.com/86590036/125621893-448d6656-768d-4737-ab61-80c01897c64c.jpg)
- call by value 2
  ![02_call by value 2](https://user-images.githubusercontent.com/86590036/125624700-b220013c-c0ea-43b5-a621-18fc7a527db6.jpg)
- call by value 3
  ![03_call by value 3](https://user-images.githubusercontent.com/86590036/125624770-a825a1d1-1d5e-4bd2-a22a-85e58e694e8b.jpg)

1. JVM이 운영체제에게 메모리를 요청하고 이후 클래스가 loading 된다.
2. main()를 호출한다.
3. main()의 로컬변수에 값이 저장된다.
4. main()에서 swap()을 호출한다.
5. 호출되는 함수에 argument "값"을 전달한다.
6. swap()에서 parameter로 받아서 내부 변수에 값을 할당한다.
7. 값이 출력된다. (void)
8. 해당 메서드가 끝나면 로컬변수는 사라지며 운영체제에게 메모리를 반납한다.

### 왜 call by value로 부르는가?

argument(아규먼트)가 primitive data type(기본형)인 경우, 메서드를 호출할 때 `값`을 넘긴다.<br>
=> 자바에서는 primitive data type에 대해서 메모리(변수) 주소를 넘기는 방법이 없다.

`read only` 방식만 적용된다.

```java

public class Exam0310 {

  static void swap(int a, int b) {
    System.out.printf("swap(): a=%d, b=%d\n", a, b);
    int temp = a;
    a = b;
    b = temp;
    System.out.printf("swap(): a=%d, b=%d\n", a, b);
  }

  public static void main(String[] args) {
    int a = 100;
    int b = 200;

    swap(a, b);
    System.out.printf("main(): a=%d, b=%d\n", a, b);
  }
}

```

## 📌 call by reference (주소를 넘긴다)

- call by reference 1
  ![04_call by reference](https://user-images.githubusercontent.com/86590036/125625241-a8ff3990-0eb1-46cd-b467-52d15ab4b396.jpg)
- call by reference 2
  ![05_call by reference](https://user-images.githubusercontent.com/86590036/125625276-71a413ab-40f8-49ff-81a3-35f67719cfba.jpg)
- call by reference 3
  ![06_call by reference](https://user-images.githubusercontent.com/86590036/125625312-71848586-8a52-4e13-85f8-1224f28e23ed.jpg)

1. JVM이 운영체제에게 메모리를 요청하고 이후 클래스가 loading 된다.
2. main()를 호출한다.
3. new 연산자에 의해 heap 메모리 영역에 배열이 만들어진다. (주소생성)
4. main()에서 swap()을 호출한다.
5. 호출되는 함수에 argument `주소`을 전달한다.
6. swap()에서 parameter로 주소를 받아서 저장하게 되고 주소에 따른 값 변경이 가능하다.
7. 해당 메서드가 끝나면 로컬변수는 사라지며 운영체제에게 메모리를 반납한다.

heap 메모리에 있는 배열은 JVM이 종료되기 전까지 메모리상에 남아있는다.

### 왜 call by reference 부르는가?

argument(아규먼트)가 reference data type(참조형)인 경우, 메서드를 호출할 때 `주소`을 넘긴다. <br>
reference = 주소 기억하자!

value 방식과 다르게 `read & write`가 가능하다.

#### <배열 예시>

```java

public class Exam0320 {

  static void swap(int[] arr) {
    System.out.printf("swap(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
    int temp = arr[0];
    arr[0] = arr[1];
    arr[1] = temp;
    System.out.printf("swap(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
  }

  public static void main(String[] args) {
    int[] arr = new int[] {100, 200};
    swap(arr); //배열의 주소

    System.out.printf("main(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
  }
}

```

#### <객체 예시>

```java

public class Exam0330 {

  static class MyObject {
    int a;
    int b;
  }

  static void swap(MyObject ref) {
    System.out.printf("swap(): a=%d, b=%d\n", ref.a, ref.b);
    int temp = ref.a;
    ref.a = ref.b;
    ref.b = temp;
    System.out.printf("swap(): a=%d, b=%d\n", ref.a, ref.b);
  }

  public static void main(String[] args) {

    MyObject ref = new MyObject();
    ref.a = 100;
    ref.b = 200;

    swap(ref); // 객체의 주소
    System.out.printf("main(): a=%d, b=%d\n", ref.a, ref.b);
  }
}

```
