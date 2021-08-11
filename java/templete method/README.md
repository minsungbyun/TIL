## Template method pattern

템플릿 메소드 패턴(template method pattern)은 소프트웨어 공학에서 동작 상의 알고리즘의 프로그램 뼈대를 정의하는 행위 디자인 패턴이다. 알고리즘의 구조를 변경하지 않고 알고리즘의 특정 단계들을 다시 정의할 수 있게 해준다. [(출처 : 위키백과)](https://ko.wikipedia.org/wiki/%ED%85%9C%ED%94%8C%EB%A6%BF_%EB%A9%94%EC%86%8C%EB%93%9C_%ED%8C%A8%ED%84%B4)

![W3sDesign_Template_Method_Design_Pattern_UML](https://user-images.githubusercontent.com/86590036/128659432-2982ed55-4922-4da8-b0c7-22a9a1c84c33.jpg)

### 추상클래스(abstract class)와 구현 클래스(concrete class)

---

추상클래스를 만든 개발자의 의도는?

1. 내가 구현해놨는데 그냥 쓰던가 아니면 오버라이딩 하던가
2. 추상메서드는 너희가 구현해서 써

![템플릿 디자인 패턴](https://user-images.githubusercontent.com/86590036/128659511-a4dadb8f-317e-4613-84fe-89baa57e2002.jpg)

추상클래스인데 대부분의 기능은 구현되있어
나머지 중요한 부분 템플릿으로 남겨둔다.

추상 클래스 , 추상 메서드? > 템플릿 메서드
템플릿 메서드 패턴 = 상위클래스는 추상 클래스(기본흐름정의) 구현은 서브 클래스에게 맡긴다.
큰 흐름은 슈퍼클래스가 작은 흐름은 서브 클래스

```java
abstract class A3 {
  public abstract void m1();
}

class A3Sub extends A3 {
  @Override
  public void m1() {
    System.out.println("A3Sub.m1() 호출됨!");
  }

  public void m2() {
    System.out.println("A3Sub.m2() 호출됨!");
  }
}

public class Exam03 {
  public static void main(String[] args) {
    A3 obj;

    // 추상 클래스의 인스턴스는 생성 불가!
    //    obj = new A3(); // Error!

    // 추상 메서드를 구현한 서브 클래스 만이 인스턴스 생성 가능!
    obj = new A3Sub();

    // 오버라이딩 규칙에 따라
    // - 레퍼런스가 실제 가리키는 객체의 클래스에서부터 메서드를 찾는다.
    obj.m1();

    // - 레퍼런스가 실제 가리키는 객체가 A3Sub 라 하더라도
    //   레퍼런스 타입의 범위를 넘어서 메서드를 호출할 수는 없다.
    //    obj.m2(); // 컴파일 오류!

    // - 물론 실제 인스턴스 타입으로 형벼환 후에는 가능한다.
    ((A3Sub)obj).m2();
  }
}
```

```java
A3Sub.m1() 호출됨!
A3Sub.m2() 호출됨!
```

![템플릿 디자인 패턴2](https://user-images.githubusercontent.com/86590036/128659529-60ba9077-a2c4-46c6-85b6-8ca9c306d699.jpg)
