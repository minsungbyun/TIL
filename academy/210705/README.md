## 6일차(2021-07-05,월)

- eclipse 화면 구성
  - perspective에 따른 작업대 변경
- 리터럴(literal)의 종류
	- 정수리터럴 
		- 10진수(100)
		- 8진수(0144)
		- 2진수(0b0110100)
			- 2진수의 규칙 4가지
				- Sign-Magnitude(부호절대값)
				- 1의 보수(음수 값을 표현할 때) 
				- 2의 보수 = 1의 보수 + 1 (음수 값을 표현할 때) 
					- 현대의 대부분의 컴퓨터는 `2의보수`를 음수 표현 방법으로 사용한다.
				- Excess-K (지정된 값을 무조건 더한다.)
					- 부동소수점을 2진수로 표현할 때 지수부를 이 규칙에 따라 표현한다.
		- 16진수(0x64) -> 16진수는 2진수를 짧게 적기 위해 표현한 것 뿐이다. (★★★★★)
	- 부동소수점 리터럴
	- 논리 리터럴
	- 문자 리터럴
	- 문자열 리터럴

- print(), printf(), println()
- 값과 메모리
	- 값과 메모리 크기
	- 값 -> 2진수
		- 사진 -> 2진수 (손실압축, 무손실압축)
		- 영상 -> 2진수 (손실압축, 무손실압축)
		- 빛 -> 2진수 (RGB)
		- 소리 -> 2진수 (샘플링)
		- 냄새 -> 2진수 (아직x)

### 느낀점
  - ssafy에서 하는 것 처럼 스스로주도해서 문제해결하려는 능력을 키워야함
  - ssafy에 있는 사람만큼 열심히 해야한다.   
    
### 보완해야할 점  
   - gradle은 build.gradle<빌드설명파일>에서 적용된 설정에 따라 실행한다. <br >
명칭 : `gradle 빌드 스크립트 파일`이라고 부른다.
  - 모든것이 어떻게 실행되는지 파악한다. (★★★★★)
>1. 재대로 된 장소에서 실행하고 있는가?<br> build.gradle이 있는 폴더에서 실행하였는가?
>2. 오타는 나지 않았는가?
>3. gradle을 왜 사용하는가?

 

### 새로 알게 된 개념
```    
// %[n$]s : n은 문자열에 삽입될 값의 순서이다. 순서는 1부터 증가한다.

// 1$ => 65, 2$ => 66, 3$ => 67

// %[+][0][사용할공간너비]d : +는 숫자 앞에 부호를 붙인다.
```


>1. 어떤 값이든 2진수로 표현할 수만 있다면
전기적 신호와 자기적 신호로 바꿀 수 있다. (★★★★★)<br > 
`RAM/HDD`에 저장할 수 있다.
>2. 2진수로 바꾸기 위한 규칙이 필요하다. (4가지)<br > 2의보수법을 사용한다. <br > 
<br > 
보수 : 보충해주는 수


### 참고하면 좋을 강의
   - cs50 (하버드대학교 강의)
