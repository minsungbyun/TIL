## 인터페이스의 유용성을 다시 생각해보기(객체 호출 규칙)

만약 ArrayList 사용법과 LinkedList 사용법이 다르다면?

```java
ArrayList     vs    LinkedList
append()            add()
delete()            remove()
update()            set()
```
메서드 이름을 개발자에 따라 다르게 지으면 어떤 문제점이 있을까요?<br>
클래스의 사용법이 달라져서 프로그래밍의 일관성이 없게 됩니다.

이를 해결하기 위해 나온 인터페이스!!


인터페이스를 사용한다면 개발자가 클래스를 정의할 때, 인터페이스에서 정한 규칙에 따라 메서드를 만들어야합니다.

```java
List (규칙 즉 객체 사용법을 정의)
add()
remove()
set()
```

```
                     List
                     /  \
              ArrayList LinkedList

```

ArrayList와 LinkedList의 사용 규칙이 같기 때문에 프로그래밍의 일관성이 생기죠.<br>
ArrayList를 LinkedList로 고치더라도 변경해야 할 코드가 적어지게 되고요.
즉 유지보수에 도움이 됩니다.

![유용성1](https://user-images.githubusercontent.com/86590036/130710783-58586ef0-32c5-4593-8145-11d53aaac996.jpg)



