## 제네릭의 등장

### 제네릭의 특징

1. Object 타입을 쓰면 Object 자손들은 다 들어올 수 있다. 특정 타입으로 제한할 수 없다.
   즉 특정 메서드를 호출할 때 어떤 객체든 다 넘겨줄 수 있다. (장점이자 단점이다)
2. 매번 리턴값을 원래 타입으로 형변환 해야한다.

타입 정보를 받는 "타입 파라미터"의 이름은 일반 변수 이름을 짓는 규칙과 같다. 그러나 타입을 지정하는 자리에 와야하기 때문에 한 두자의 알파벳으로 정의한다. 눈에 띄게 하기 위하여 대문자르 사용한다.

자바에서 제안하는 이름이 있고 대부분의 개발자가 그 이름을 사용한다.

```java
// 제네릭 타입 : 객체를 생성하는 시점에 결정된다.
T <- type
E <- element
K <- key
V <- value
N <- number
S, U, V <- 2nd 3rd 4th type
```

인터페이스에 제네릭(generic)의 타입 파라미터를 적용하면,
그 타입의 최종적인 이름은 이 인터페이스를 구현하는 클래스에서 결정한다.

더 정교하게 코드를 제어할 수 있다!

```java
public interface List<E> {
  void add(E item);
  Object[] toArray();
  boolean remove(E obj);
  int size();
  E get(int index);
  E remove(int index);
}
```

```java
// 추상 클래스에서 List에 적용할 타입 이름을 받는다.
// 그 변수의 값을 List 인터페이스에 적용한다.
// 이때 추상 클래스의 타입 이름을 전달하는 방법은 서브 클래스를 정의할 때 이다.
public abstract class AbstractList<E> implements List<E> {
  protected int size;

  @Override
  public int size() {
    return this.size;
  }
}
```

![제네릭 타입변수 순서도](https://user-images.githubusercontent.com/86590036/130169165-ae810fc1-2ace-4ae7-be77-b7ea83a9b214.jpg)

```java
// 타입변수가 같으면 뒤에는 생략해도 된다.
Node<E> node = new Node<>(item);
```

### 제네릭 타입의 위치

- 클래스 전체 적용할 때 = 뒤에서 받는다

```java
// 일반 클래스에 제네릭을 적용하면
// 최종적인 타입 이름은 그 클래스의 인스턴스를 생성할 때 전달한다.
public class ArrayList<E> extends AbstractList<E>

```

- 타입이 결정되지 않으면 Object로 넘겨준다.

- 특정 메서드에 적용할 때 = 앞에서 받는다
  - 메서드가 호출될 때 타입이 결정된다.

```java
<T> T[] toArray(T[] arr);
```

제네틱 타입의 배열은 만들 수 없다.
레퍼런스는 만들 순 있어도..

```java
 T[] temp = new T[this.size]; // 컴파일 오류
```

### toArray()로 알아보는 제네릭

> 코드의 의미를 말할 수 있어야한다. 즉 코드에 대한 이해가 필요하다. 잘하는 사람들은 마치 하나의 소설처럼 읽는다.

- 제네릭을 사용하면 더 이상 반복문을 돌리지 않아도 된다.

```java
for (int i = 0; i < this.size; i++) {
       arr[i] = (E) this.list[i];
}
```

1. 파라미터로 받은 arr 배열이 현재 목록에 있는 배열을 담기에 충분하다면 arr를 그대로 내보낸다.

```java
 배열을 복사할 때 자바에서 제공하는 클래스를 사용하면
 반복문을 작성할 필요없이 보다 쉽게 배열을 복사할 수 있다.
    => System.arraycopy(원래배열, 복사시작인덱스, 값을받을배열, 복사시작인덱스, 복사할개수)
```

2. 파라미터로 받은 arr 배열이 현재 목록에 있는 배열을 담기에 부족하다면 새 배열을 만들어 내보낸다. temp

```java
다음과 같이 제네릭을 적용한 배열 인스턴스는 생성할 수 없다.
       E[] temp = new E[this.size]; // 컴파일 오류!

그래서 다른 클래스의 도움을 받아 배열을 생성해야 한다.
새 배열을 만들어 기존 배열의 값을 복사한다.
  방법1.
      => Array.newInstance(배열항목의타입, 생성할 배열의 크기)
      => arr.getClass() => 배열의 타입 예) Project[]
         arr.getClass().getComponentType() => 배열의 각 항목의 타입 예) Project

     방법2.
       => Arrays.copyOf(원래배열, 복사할개수, 새로만들배열의타입)
```

```java
@SuppressWarnings("unchecked")
  @Override
  public E[] toArray(E[] arr) {

    if (arr.length >= this.size) {

      System.arraycopy(this.list, 0, arr, 0, this.size);
      return arr; // 파라미터로 받은 배열을 그대로 리턴한다.

    } else {

      // 방법 1
      E[] temp = (E[]) Array.newInstance(arr.getClass().getComponentType(), this.size);
          System.arraycopy(this.list, 0, temp, 0, this.size);
          return temp;

      // 방법2
      E[] temp = (E[]) Arrays.copyOf(
          this.list, // 원본 배열
          this.size, // 복사할 개수. 현재 배열에 들어 있는 값들의 개수
          arr.getClass() // 생성할 배열의 타입(파라미터의 배열과 같은 타입의 배열을 생성할 것이다)
          );
      return temp;
    }

```
