## 35일차(2021-08-13,금)

- 자바 객체지향 문법(eomcs-java/com.eomcs.oop)
  - ex09(i ~ j): 인터페이스 활용
  - ex11(a ~ c:Exam0240): 중첩 클래스 사용법

## 알게 된 점

---

- 인터페이스 vs 클래스 vs 추상클래스

- 추상메서드를 재정의 하는 것도 오버라이딩이다.

- 패키지에 직접 소속된 클래스 = Top Level Class

- 필드와 메서드 static import (클래스명 생략가능)
- 중첩클래스는 static을 적지 않는다.

  - import static 으로 미리 스태틱 멤버의 패키지 정보를 알려주면, 마치 같은 클래스의 멤버인양 클래스 이름 없이 사용할 수 있다.

- 인스턴스 메서드를 호출할 때 인스턴스 주소가 메서드의 내장변수인 this에 저장된다.

- 바깥 클래스의 인스턴스를 사용할 경우 = inner class(non-static class)
- 그게 아니라면 = static class
