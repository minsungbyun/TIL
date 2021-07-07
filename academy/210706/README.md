## 7일차(2021-07-06,화)
- 프로그래밍 도구 준비(계속)
	- VSCode Hex Editor 플러그인 추가
	- .class 파일을 16진수 값으로 보기 : 부동소수점이 2진수로 표현됐을 때의 2진수 값 확인
- 자바 기초 문법(eomcs-java/com.eomcs.lang)
	- ex03
		- 부동소수점을 2진수로 표현하는 방법: IEEE 754 명세
		- 문자를 2진수로 표현하는 방법: ASCII, ISO-8859-2, EUC-KR, 조합형, Unicode, UTF-8 문자 집합 소개
		- 이스케이프 문자를 다루는 방법
		- Raster 폰트(그림)과 Vector 폰트(그림) 비교 
		- 줄바꿈 코드: 0D(Carrage Return; CR), 0A(Line Feed; LF)

### 주의사항<br >
- 이클립스 빌드가 꼬일 때 -> 설정이 꼬인 경우가 많다.
    
> 1. vs code의 플러그인 문제<br > 
> 2. .project , .classpath , .setting를 지운다<br > 
>     cmd창에서 gradle cleanEclipse <br > 
>     gradle eclipse <br > 
>     즉 eclipse 관련 설정을 지우고 다시 eclipse 실행한다. <br > 
> eclipse를 끄고 실행한다. 
>3. 안되면 직접 디렉토리 들어가서 지운다.



### 새로 알게 된 개념
  - 부동소수점의 정규화 방식
  - carriage return
  - 유니코드로 오기까지의 변천사
  - 부동소수점을 2진수로 완벽하게 바꾸는 방법은 없다.
부동소수점의 한계 = 값이 정확하지 않다. <br > (얼마만큼 보정을 정확하게 하느냐..)
     - 정수는 명확하다. 하지만!
float은 최대 7자리 "거의" 정상적으로 출력된다.<br > 
double은 최대 16자리 "거의" 정상적으로 출력된다.
100% 아님
___

 - 컴파일 된 파일이 어떤 형식으로 적혀있는지 컴파일러에게 알려주지 않으면 컴파일러는 현재 사용자의 운영체제에 맞는 규칙에 따른다.
- 문자를 2진수로 바꾸는 규칙 = character set 
>윈도우 -> MS949 <br > 
>맥 -> UTF-8                <br > 윈도우와 맥 사용자가 소통하려면 무조건 인코딩을 utf-8로 해야한다.

 
		


