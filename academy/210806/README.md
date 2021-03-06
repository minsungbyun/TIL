## 30일차(2021-08-06,금)
___
- 실전 프로젝트(eomcs-java-project)
	- 10-c. 리팩토링 : ArrayList를 직접 사용하기
	- 10-d. 리팩토링 : LinkedList를 직접 사용하기
	- 10-e. 리팩토링 : Generalization + 다형성 + 의존 객체 주입(Dependecy Injection)
	- 10-f. 리팩토링 : 메서드 이동
	- 10-g. 리팩토링 : 인터페이스 적용

## 알게 된 점 
___

- 객체지향의 핵심은 클래스 관계도이다.
- 구조를 바꾸는 이유??  
    - 더 유지보수하기 쉽게 바꾸기 위하여
    - 구조에 대한 정답은 없다 , 현재 상황에서 어느 방법이 더 유지보수하기 쉽냐를 판단

- 초보자들의 흔한 실수 : 메서드는 public 필드는 private   
    - 공개여부에 따라 달라진다.
    - 특정 클래스 내부에서만 사용할 메서드라면 private

- List를 상속받음으로써 ArrayList , LinkedList로 따로 분리 되는게 아니라 List로 묶임으로써 다형성을 사용할 수 있고 다루기 쉬워진다.
    1. 같은 타입으로 묶인다 = 다형성 활용
    2. 메서드 시그너처(Signature)를 통일 = 프로그래밍의 일관성 , 클래스 사용법을 같게 만든다.
        - 두 클래스의 객체를 한 개의 레퍼런스로 다룰 수 있다.

- 슈퍼클래스의 레퍼런스로 서브 클래스의 레퍼런스를 가리킬 수 있게 되었을 때 이점
    - 그 자리에 다른 놈으로 대체하기 쉬워진다. 사용법 통일 !



[Method Signature]
- 메서드명
- 파라미터 타입/순서/개수
- 리턴타입은 아님


- 세터 메서드로 주입 vs 생성자로 주입
    - 만약 세터메서드로 주입한다면 사용자가 인스턴스 만들어서 세터 메서드를 호출 안하면?
    - 생성자는 강제할 수 있어 인스턴스를 만들 때 주입한다.

- 생성자 주입의 이점
    - 인스턴스를 외부에서 주입함으로써 의존객체 교체하기 용이하다.

- 생성자에 list를 넣어야 해 근데 list가 추상클래스야 추상클래스는 인스턴스를 못만들지 그럼 어떻게 전해주냐 list상속받은 서브클래스의 인스턴스만 있으면 된다. 아무거나 달라!
- 레퍼런스의 타입이 추상클래스 = 유연하다 
- 같은 타입으로 묶으면서 구현 규칙을 정의하는 경우 인터페이스를 사용하라 
- 필드나 메서드를 정의하는 것이 아닌 같은 타입으로 묶는 것에 집중하는 경우 (자식한데 줄건 없고 강요만함)

- 인터페이스(객체[클래스] 사용 규칙, 메서드 사용 규칙)
    1. 인터페이스에 규칙에 따라 만들어진 객체를 호출하는가?
    2. 인터페이스에 규칙에 따른 클래스를 만들어야 하는가?
    3. 둘 다 만들어야 하는 경우인가?

- 리팩토링 - move method 메서드를 적절한 클래스로 옮긴다.




