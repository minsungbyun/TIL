## 9일차(2021-07-08,목)
- 자바 기초 문법(eomcs-java)
	- com.eomcs.basic.ex10
		- java.util.Date 클래스 사용법
		- java.sql.Date 클래스 사용법
	- com.eomcs.lang.ex04
		- 배열 다루기
	- com.eomcs.lang.ex06
		- if, if ~ else 
		- while, for
- 실전 프로젝트(eomcs-java-project-2021)
	- 02-c. 값 다루기 : 배열과 흐름 제어문 활용

## 알게된 개념
___
문자 > 숫자 Integer.parseInt()
valueOf() vs Integer.parseInt()

## 주의사항
___
- build.gradle이 있는 곳에서 gradle eclipse
- build.gradle 이 파일이 있는 곳이 프로젝트 폴더이다.

이클립스가 프로젝트파일을 어떻게 확인하느냐 ?  .project가 있는 폴더를 인식한다. <br>정확하게 import해
그렇게 import했는데? 프로젝트 명이 app이 되는 불상사가 일어남.<br>
해결방안 > setting.gradle에서 eclipse 프로젝트 이름을 설정한다.

## 실수한점
___
	- input을 따로 선언하지 말고 한번에 할 것
	- 날짜 포멧팅 $표시 위치 신경쓸 것
	- 배열을 만들어야 하는데 배열 선언을 하지 않았다.	