## 알게 된 점
___
- concrete => 인스턴스를 생성할 수 있는 일반 클래스

- 추상 클래스의 목적은 서브 클래스에게 공통 필드와 공통 메서드를 상속해주는 것이다.
- 인터페이스의 메서드 중에서 서브 클래스가 구현해야만 의미가 있는 메서드의 경우 추상 클래스에서 미리 구현할 필요가 없다.



- 인터페이스는 객체 사용 규칙을 정의
- 메서드를 통해 객체(클래스)를 사용
- 인터페이스를 바꾸게 되면 인터페이스를 구현한 기존 클래스에 영향을 끼친다.
- 인터페이스의 메서드를 변경하거나 제거, 추가하는 순간 이 인터페이스를 구현한 모든 클래스들에서 컴파일 오류가 발생하게 된다.
- 자기가 만든 인터페이스를 다른 개발자들이 그들 프로젝트에 사용하는 입장이라면?



- not 읽을 때   !this.use 사용 상태가 아니라면 이라고 읽는다.
- true false 읽을 때 조심

- public class BallPen153 extends Monami implements Pen
    - ballpen153은 Monami로부터 기본 기능 받고
    - pen 규칙에 따라 동작하도록 만든다.

- 인터페이스에서 스태틱 메서드는 보통 그 인터페이스를 구현한 객체를 다루는 일을 한다.
- 클래스에 있는 스태틱메서드 보다 좁게 사용된다.
- 규칙을 다루는 스태틱 메서드가 필요한 경우 사용


- 언제 인터페이스에서 스태틱메서드 - 그 인터페이스의 구현체를 다룰 때
- 클래스에서 스태틱메서드 - 그 클래스의 객체를 다룰 때

- 어댑터 패턴
    - 인터페이스 내부에 다른 인터페이스를 호출한다.
기존의 클래스를 재활용
    - 110v 를 220v 로 바꿀 때 adapter가 필요하듯이 프로그래밍도 같다.


- give and take
    - 어댑터 패턴 - 코딩할 내용은 많아지지만 인터페이스의 규칙을 구현하도록 강제할 수 있다.
    - 인터페이스의 디폴트 - 코딩의 편리함을 취한다. 그 대신 인터페이스의 존재 이유인 규칙 강제를 할 수 없다.

- 왜 Abstarct클래스를 상속 받지?
    - 너무 많은 메서드가 있어서 그걸 구현하기 힘들다 그래서 abstract클래스 만들어 제한적으로 상속받아서 구현하게끔 한다.