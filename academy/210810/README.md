## 31일차(2021-08-09,월)
___
- 자바 객체지향 문법(eomcs-java/com.eomcs.oop)
	- ex07: 추상 클래스와 추상 메서드
- 자바 기본 클래스 사용법(eomcs-java/com.eomcs.basic)
	- ex01: Object 클래스 사용법

### 알게 된 점 
___


- 전길남박사 - 아시아 최초의 인터넷 망
- 팀 버너스 리 - tcp/ip


- 해시 값 = 원본 파일과 같은 파일인지 비교한다.

- object 
    - toString()
    - equals()
    - hashCode()
    - getClass()
    - clone()
    - finalize()
    - notify()
    - notifyAll()
    - wait()


- hashCode를 오버라이딩하면 인스턴스가 다르더라도 인스턴스 변수의 값이 같으면 같은 해시값으로 리턴된다.

- clone()의 제약조건
    1. clone() 오버라이딩하고 public으로 공개
    2. Cloneable 인터페이스 구현 - 복제 기능을 활성화
    3. 리턴타입은 서브 클래스 타입으로 정확하게 지정해준다. super.clone() 조상클래스부터 찾게 한다.
    4. Cloneable 인터페이스는 메서드가 없다. (단지 표시하는 기능)




얕은 복사
깊은 복사


- pc용 vs  모바일용(반응형) - 관리시스템인 경우 ex) 네이버    
- pc용 = 모바일용(반응형) - 제품 카탈로그형(홍보, 팜플렛용) 입력받지 않는다. ex) 애플

주의!
- String          - equals() 오버라이딩 했다
- StringBuffer - equals() 오버라이딩 하지 않았다. (Object의 equals)
    - b1.toString()[해당객체의] 스트링을 꺼내서  equals()로 비교한다

- mutable vs immutable 객체
    - String 객체는 immutable 객체이다. 즉 한 번 객체에 값을 담으면 변경할 수 없다.
    - StringBuffer는 mutable 객체이다.

