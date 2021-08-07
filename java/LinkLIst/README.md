## 🔗 연결리스트(Linked List)
___

- 연결리스트 = 주소 다루는 것을 연습하기 좋다.


### 📌 배열과 연결리스트의 차이
___

- ✔️ 배열의 장점
  - 인덱스로 요소들을 찾기 때문에 속도가 빠르다.

- ✔️ 배열의 단점
  - 가비지가 늘어난다!(예시참고)

다음 예시는 배열의 길이가 꽉 찼을 때 기존 배열보다 50% 증가된 새로운 배열을 만들어 주소를 옮기는 방식을 코드로 나타내었다.  

[예시1]  
```java
if (this.size == this.boards.length) { // 꽉 차면 새로 만든다.
// 기존 배열보다 50% 더 큰 배열을 만든다.
Board[] arr = new Board[this.boards.length + (this.boards.length >> 1)];

      // 기존 배열의 값을 새 배열로 복사한다.
      for (int i = 0; i < this.size; i++) {
        arr[i] = this.boards[i];
      }

      // 기존 배열 대신 새 배열 주소를 저장한다.
      // 물론 이렇게 함으로써 기존 배열은 가비지가 될 것이다.
      this.boards = arr;
      System.out.println("새 Board[] 객체를 만듦!");


    }

this.boards[this.size++] = board;
}
```

- ✔️ 연결리스트(LinkList)의 장점
  - 노드를 연결하기 때문에 수정, 삭제, 삽입이 용이하다.

- ✔️ 연결리스트(LinkList)의 단점
  - 탐색하는데 시간이 오래 걸린다.(배열은 인덱스로 찾으면 됨)

![연결 리스트 구조](https://user-images.githubusercontent.com/86590036/128584798-9536edba-857e-4604-9065-70251f41a94f.jpg)



### 📌 연결리스트(LinkedList)의 구조

```java
public class Node {

  Object item;
  Node next;

  public Node(Object item) {
    this.item = item;
  }
}
```

1. ☑️ 최초로 노드를 생성하게 되면 노드의 값(주소)를 넣을 수 있는 공간(100)과 다음 노드의 주소를 담는 공간(null)이 생긴다.
head와 tail은 null로 세팅된다. Node 자체의 주소도 할당된다(1000번지)

head와 tail은 동일한 node를 가리키고 있다.

```java
Node node = new Node(obj);
```
```java
Object item; // 노드 값에 대한 주소를 담는다.
Node next; // 다음 노드 주소를 담는다.
```
```java
tail = head = node;
```

2. ☑️ 추가로 값(200)이 들어오게 되면 두 번째 노드가 생성이되고 node의 주소가 할당된다.(2200)
첫 번째 노드에 두 번째 노드의 주소가 저장된다.

head는 첫 번째 노드를 가리키고 <br >
tail은 두 번째 노드를 가리킨다.

3. ☑️ 첫 번째 노드와 두 번째 노드를 이어주는 코드와 tail의 위치를 변경해주는 코드가 필요하다.

 다음 노드 주소는 그 노드의 next에 있다.

```java
tail.next = node; // 첫 번째 노드가 두 번째 생긴 노드의 주소를 가리키게함.
tail = node; // tail의 위치를 바꿔준다.
```

- ✔️ 노드로 for문과 같이 찾는 법
 - node head부터 시작해서 찾아들어간다 node가 null이 아닐 때 까지!


### 📌 4 Step 노드 삭제 방법 

- ✔️ 다음 노드와 이어주기
- ✔️ 삭제 할 노드의 next 주소 null로 세팅하기


1. ☑️ 맨 앞 노드를 삭제할 경우 head를 뒤로 밀어준다.

```java
head = node.next;
```
2. ☑️ 중간 노드를 삭제할 경우 주소를 삭제한 다음 노드의 주소로 바꾼다. (다음 노드와 이어주기)

```java
prev.next = node.next;
```

3. ☑️ 마지막 노드를 삭제할 경우 tail을 앞으로 당겨준다.

```java
tail = prev;

```
4. ☑️ 삭제할 노드에서, 다음 주소와 잇는 주소(node.next)를 null로 바꾼다. (다음 노드와 끊기)

```java
node.next = null;
```

1~4의 과정을 이어보면 다음과 같다.

```java

    Node node = head;
    Node prev = null; // 이전노드

    while (node != null) {
      if (node.board == board) { // 노드 찾았어
        if (node == head) { // 맨 앞 노드야
          head = node.next; // 다음 노드를 헤드로 바꿔

        } else {
          prev.next = node.next; // 이전 노드와 다음 노드를 연결한다. 제일 앞부분 삭제했을 때 문제

        }
        // 찾은 노드를 삭제해야 한다.
        node.next = null;  // 다음 노드와의 연결을 끊는다.

        if (node == tail) { // 현재 노드가 tail이라면
          tail = prev; // 이전 노드를 마지막 노드로 설정한다.
        }
        break;
      }
      // 현재 노드가 아니라면 ,
      prev = node; // 현재 노드의 주소를 prev변수에 저장하고 
      node = node.next; // node 변수에는 다음 노드의 주소를 저장한다.
    }
  }
```

![연결 리스트 구조2](https://user-images.githubusercontent.com/86590036/128584806-60575721-4737-467c-bdd0-28bf8d8582c9.jpg)
