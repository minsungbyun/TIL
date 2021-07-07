# Scanner 사용할 때 주의사항
___
### nextInt() , nextLine()을 동시에 쓸 때   `공백 문제`가 발생한다.

왜 이런 문제가 발생하는가?

먼저 해당 메서드의 기능에 대해 알아볼 필요가 있다.

## Scanner의 메서드 중 일부
___
|데이터타입|메서드명|기능|
|:---:|:---|:---|
String|next() | 문자열을 일렬로 나열해서 출력한다.
String|nextLint() | 문자열을 줄바꿈해서 출력한다.
String|nextInt() | 숫자를 출력한다.

예시 1)

```java
package com.eomcs.lang.ex99;

public class Exam0240 {
  public static void main(String[] args) { 
    java.util.Scanner keyboard = new java.util.Scanner(System.in);

    System.out.print("나이? ");
    int age = keyboard.nextInt();
    
    System.out.print("이름? ");
    String name = keyboard.nextLine();

    keyboard.close();

    System.out.printf("%d(%s)\n", age, name);
  }
}
```
Scanner를 사용해서 nextInt() 메서드를 사용해서 나이를 출력하고 싶고, <br>nextLine() 메서드를 사용해서 이름을 출력하고 싶다.

하지만 여기서 문제가 발생하는데..

## 문제점

 먼저 나이를 입력하니까 잘나온다.
 그리고 이름을 입력해야하는데
 이미 결과값이 나와버렸네..?
 ```java
 // console

나이? 20
이름? 20()
 ```

 이런 문제가 발생하는 원인은 바로 여기에 있다.

 ![1-1](https://user-images.githubusercontent.com/86590036/124746096-74d3fd00-df5b-11eb-82a9-532ff630845a.jpg)


Scanner는 공백을 만날 때 까지 한 개의 토큰(token)을 읽는다. 
> 토큰 : 공백을 제외한 한 단어를 말한다.

키보드에 20이라는 값을 입력하면 우리눈에 보이지는 않지만 20이라는 정수값과 `0D0A(\r,\n)`가 들어가게 되는데 `0D0A(\r,\n)`가 문자열이다.
그래서 다음 문자열인 나이를 입력하기 전에 이미 저장되어있는 `0D0A(\r,\n)`를 인식해서 출력해버린것이다.

이 문제를 해결하기 위해서 해줄 작업이 있는데 
```java
package com.eomcs.lang.ex99;

public class Exam0240 {
  public static void main(String[] args) { 
    java.util.Scanner keyboard = new java.util.Scanner(System.in);

    System.out.print("나이? ");
    int age = keyboard.nextInt();
    
    keyboard.nextLine(); 
    // 남아 있는 빈 문자열의 한 줄(LF 코드)을 읽어서 버린다.

    System.out.print("이름? ");
    String name = keyboard.nextLine();

    keyboard.close();

    System.out.printf("%d(%s)\n", age, name);
  }
}

```
## 해결책 : 공백을 지운다
___
`keyboard.nextLine()`를 입력하는 것이다.
이를 통해 빈 공백을 지워버리게 되고 다음 순서인 이름을 입력받아서 출력하게 된다.

```java
// console

나이? 20
이름? 김자바
20(김자바)
```
결과가 정상적으로 출력되었다.

## next()이란?
___

![2-1](https://user-images.githubusercontent.com/86590036/124746922-61756180-df5c-11eb-98c2-82ef3a19d06e.jpg)
- `next()`는 공백을 지워버리고 토큰을 반환하기 때문에 문자열을 나열할 때 쓰면 좋다.
- 방금 전 예와 달리 `keyboard.nextLine()`를 입력하여 공백을 지우지 않아도 되는 장점이 있다.
```java
package com.eomcs.lang.ex99;

public class Exam0250 {
  public static void main(String[] args) { 
    java.util.Scanner keyboard = new java.util.Scanner(System.in);
    
    System.out.print("나이, 이름, 취업여부? ");
    int age = keyboard.nextInt();
    
    // 한 개의 토큰을 읽을 때 유용하다.
    String name = keyboard.next();
    
    boolean working = keyboard.nextBoolean();
    
    keyboard.close();
    
    System.out.printf("%d, %s, %b\n", age, name, working);
  }
}
```
```java
//console

나이, 이름, 취업여부? 20 김자바 false
20, 김자바, false
```

## 결론 
- nextLine() - 한 칸 띄우고 값을 출력할 때 쓴다.
- next() - 연속되는 값을 출력하고 싶을 때 쓴다.
- nextLine 쓰기 전 byte,short,int,double 등 다른 데이터타입과 함께 쓸 때는 공백을 지워줘야한다.

- 스캐너를 다 쓰고나면 닫아주는 것 잊지 않기<br>
`keyboard.close()` 













