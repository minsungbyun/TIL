인터페이스의 유용성을 다시 생각해보기(객체 호출 규칙)

만약 ArrayList 사용법과 LinkedList 사용법이 다르다면?

```java
ArrayList     vs    LinkedList
append()            add()
delete()            remove()
update()            set()
```
메서드 이름을 개발자에 따라 다 다르겠죠
클래스의 사용법이 달라져서 프로그래밍의 일관성이 없다.


인터페이스를 사용한다면 개발자가 클래스를 정의할 떄 인터페이스에서 정한 규칙에 따라 메서드를 만들어야한다.

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

ArrayList와 LinkedList의 사용 규칙이 같기 때문에 프로그래밍의 일관성을 부여한다.
ArrayList를 LinkedList로 고치더라도 변경해야 할 코드가 적다.
즉 유지보수에 도움이 된다.

![유용성1](https://user-images.githubusercontent.com/86590036/130710783-58586ef0-32c5-4593-8145-11d53aaac996.jpg)



ArrayList vs LinkedList

ArrayList - 조회하는 속도가 빠르다. 하지만 삽입,삭제 속도가 느리다.
LinkedList - 삽입, 삭제 속도가 빠르다. 하지만 조회 속도가 느리다.

뭔가를 사용하는 입장 - client