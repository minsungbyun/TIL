## from 추상클래스 to 인터페이스

---

### 1. 추상클래스 사용 전

![추상 클래스에서 인터페이스로 1](https://user-images.githubusercontent.com/86590036/128666845-53d2dee6-af1b-4d14-a435-93d687ee91fe.jpg)

두 개의 정렬 객체가 서로 다른 타입이기 때문에 정렬을 수행하고 출력할 메서드를 따로 따로 만들어야 한다. 클래스의 사용법도 달라서 불편하다.

- ✔️ BubbleSort 객체는 run()을 호출해야 하고,
- ✔️ QuickSort 객체는 start()를 호출해야 한다.

```java
display(s1, values);
display(s2, values2);
```

### 2. 추상클래스 사용 전 : 상속 사용하기

![추상 클래스에서 인터페이스로 2](https://user-images.githubusercontent.com/86590036/128666865-1d65d989-4cad-4725-ad3d-5580d1093ecf.jpg)

```java
// 정렬을 수행하는 클래스를 한 타입으로 묶기 위해
// 다음 클래스를 정의하였다.

public class Sorter {
  public void sort(int[] values) {};
}

```

- ✔️ 정렬 객체를 사용하는 방법을 통일하면 사용하기가 쉬워진다.
- ✔️ 두 클래스를 같은 부모의 자식 클래스가 되게 하라.
- ✔️ 메서드가 같으니 사용법도 같다.
- ✔️ 사용법도 같으니 다른 객체로 교체하기 쉽다. 유연하다.

```java
display(new BubbleSort(), values);
display(new QuickSort(), values2);
```

### 3. 추상클래스 사용 후

![추상 클래스에서 인터페이스로 3](https://user-images.githubusercontent.com/86590036/128666872-a0cbcecf-bff1-4b82-adcd-59cc6bb45e5e.jpg)

```java
public abstract class Sorter {
  public void sort(int[] values) {};
}
```

- ✔️ 추상 클래스로 선언하면 인스턴스 생성을 막을 수 있다.
- ✔️ 서브 클래스를 정의할 때 상속 받아 쓰는 용도로 한정할 수 있다.

### 4. 추상클래스 사용 후 : 추상메서드의 사용 전

![추상 클래스에서 인터페이스로 4](https://user-images.githubusercontent.com/86590036/128666884-c936bee1-e522-4c10-b04b-7c31084f67f7.jpg)

- ✔️ MergeSort는 Sorter를 상속 받아 만들었다.
- ✔️ 따라서 이 클래스를 사용하는 개발자 쪽에서는 Sorter를 상속 받았으니, 당연히 정렬을 수행하기 위해 sort(int[]) 메서드를 호출할 것이다.
- ✔️ 그러나 MergeSort 클래스는 sort(int[]) 메서드를 오버라이딩 하지 않았다.

### 5. 추상클래스 사용 후 : 추상메서드 사용 후

![추상 클래스에서 인터페이스로 5](https://user-images.githubusercontent.com/86590036/128666897-bbe54731-5dd4-4fa6-8a3d-96244c0016f4.jpg)

- ✔️ 서브 클래스에게 구현을 강제할 필요가 있을 때 추상 메서드로 선언하라!

```java
public abstract class Sorter {

  public abstract void sort(int[] values);
}
```

- ✔️ MergeSort 클래스는 Sorter 클래스의 sort()를 오버라이딩 하였고 이전에 오버라이딩 하지 않은 sort() 메서드를 내부적으로 호출하는 방식으로 바꾸었다.

```java
@Override
  public void sort(int[] values) {
    sort(values, 0, values.length - 1);
  }
```

- ✔️ display() 메서드에서는 파라미터로 넘어오는 Sorter가
  BubbleSort 인지, QuickSort 인지, MergeSort 인지 따질 필요 없이, 그냥 서브 클래스가 구현한 sort()를 호출하면 된다.

```java
display(new BubbleSort(), values);
display(new QuickSort(), values2);
display(new MergeSort(), values3);
```

### 6. 인터페이스 사용

![추상 클래스에서 인터페이스로 6](https://user-images.githubusercontent.com/86590036/128666912-efd263c6-7925-43dc-937e-b9c385defb35.jpg)

- ✔️ 추상 메서드만 있을 경우, 객체 사용 규칙을 정의하는 "인터페이스" 문법으로 바꾼다.

```java

public interface Sorter {

  void sort(int[] values);
}
```
