## 15일차(2021-07-16,금)

- 실전 프로젝트(eomcs-java-project)

  - 04-a. 클래스 사용법 : 메서드 분류
  - 04-b. 클래스 사용법 : 새 데이터 타입 정의
  - 04-c. 클래스 사용법 : 패키지로 클래스 분류

## 알게 된 것들

- 배열을 넘깁니다 = 배열의 주소를 넘깁니다와 같은 말이다.
- 메서드 관리를 쉽게 하기 위해 클래스로 분류한다.

  - 역할에 따른 분류
  - 데이터 타입을 정의 (사용자정의)

- 메서드를 분류했으면 그에따라 메서드 이름도 바꾸어준다. (유동적으로)
- 자원을 닫는 일은 그 자원을 가지고 있는 클래스에서 해야 한다.
  (남의 지갑가지고 결제하는것과 같은 이치, 어처구니가 없다.)

- 사용기능에 대해 이거 왜 이래요?
  (물건 사용법이 있는데 자기 멋대로 사용해놓고 이거 왜 이렇게 안되요?)

- 일반적인 책임 할당 / 정보를 가지고 있는 클래스에서 그 정보를 담당하라.
- GRASP 에서 Information Expert 설계 기법 적용
- domain = VO = DTO

- 인스턴스를 100개 만드는 방법은 없다.
  레퍼런스를 100개 만드는 것이다.

- dangling object = garbage 덩그러니 = 쓰레기
  - 주소를 잃어버려 낙동강 오리알 신세
  - 가비지의 주소를 알아낼 수 있는 방법이 없다.
- static 변수는 Method Area영역에 생성된다.
