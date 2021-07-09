## 10일차(2021-07-09,금)
- 자바 기초 문법(eomcs-java)
	- com.eomcs.lang.ex04
		- 배열 다루기(계속)
	- com.eomcs.lang.ex06
		- if, if ~ else 
		- while, for
- 실전 프로젝트(eomcs-java-project-2021)
	- 02-c. 값 다루기 : 배열과 흐름 제어문 활용

## 알게 된 개념
___

- 메모리의 시작점에서 떨어져 있는 위치 = `offset` <br>
- offset 주소 사용 = 상대적인 위치 사용
주소를 잃어버려 사용할 수 없는 메모리 = `Garbage`<br>
- 메모리가 부족할 때 실행되며, Garbage가 생겼다고 해서 무조건 실행되지 않는다.

- 기본형을 제외한 데이터 타입은 전부 참조형(주소)이다.

- 부동소수점 유효자릿수를 넘어가는 정수가 들어오게되면 값이 짤린다.<br>
에러가 안나기 때문에 실수하기 쉽다.
- static type binding (Java) vs dynamic type binding (Javascript)
- 리터럴 + 리터럴 = 리터럴<br>   
리터럴 + 변수 = 변수         
byte + byte != byte , short + short != short
 (int)    (int)               (int)      (int)

- 파일을 읽을 때 byte[]를 사용한다.
- 암시적 형변환 = 연산자의 우선순위에 따라서 결정된다.
- & vs && , | vs ||
	- &,| 는 끝까지 실행한다. (값이 이미 결정나더라도)

- Exam0352 정리


## CPU에서 JVM을 통해 어떻게 연산하는가?
___

JVM = 32bit로 작동한다. 
- long(8byte=64bit)으로 연산을 실행하면 32bit씩 x2번에 걸쳐서 연산을 수행한다. <br> 
즉 long a + long b = c;  -> 총 5번의 연산을 수행한다.
	- a(32bit), a(32bit), b(32bit), b(32bit), +(연산자)
<br> 
연산단위가 기본 `4byte`(32bit)이다.
