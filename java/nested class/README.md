 로컬클래스의 순서대로 이름이 붙는다.(A$1X.class)

1. 인스턴스 메서드의 로컬 클래스

바깥 클래스의 인스턴스 주소를 저장할 필드와 생성자가 추가된다. 
```java
A outer;
X(A outer){}
```

2. 스태틱 메서드의 로컬 클래스
바깥 클래스의 인스턴스 주소를 저장할 필드와 생성자를 추가하지 않는다.. 





- 중첩 클래스에 대한 오해들
    - 메서드가 호출될 때 클래스가 로딩된다? nono
    - 이미 컴파일 될 때 추출되었음

- 로컬 클래스의 .class 파일명
    - [바깥클래스명]$[정의된순서][로컬클래스명].class


- 바깥에 있는 인스턴스 필드를 사용할 것인가의 여부
- 중첩클래스는 앞에 static 이냐 non-static이냐로 결정
- 하지만 로컬 클래스는 어떻게 구별할까?
    - 로컬 클래스가 인스턴스 메서드라면? inner클래스처럼 
    - 로컬 클래스가 스태틱 메서드라면? 바깥 클래스의 주소를 담을 필드와 생성자가 없다.

 - 로컬 클래스에서는 바깥 메서드의 로컬 변수를 사용할 수 있다.
 1) final 로 선언된 경우
 2) final 로 선언된 것은 아니지만 값을 한 번만 할당한 경우.
 값을 여러 번 할당한 경우에는 접근할 수 없다.


- 클래스도 상속 받고 인터페이스도 구현하는 익명 클래스를 만들 수 있을까?
    - 안된다.
    - 둘 중 하나만 상속 받거나 구현해야지, 동시에 다 할 수 없다.
- 여러 개의 인터페이스를 구현할 수 있을까?
    - 안된다.

