## 배열에서 값 삭제하기

- RULE

  - 배열에서 해당 항목의 값을 삭제한다.
  - 배열 뒤의 항목은 -1로 설정한다.
  - 배열을 출력할 때는 -1인 항목은 출력하지 않는다.

- 출제의도
  - 배열의 인덱스를 활용해 삭제를 할 수 있는가? (앞으로 당길 수 있는지)
  - 삭제된 배열에 대해 빈 자리를 -1(초기값)으로 설정하는가?

```java
public class DeleteValue {

  static void deleteValue(int[] arr, int value) {

    int valueIndex = -1;

    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == value) {
        valueIndex = i;
        break;
      }
    }

    if (valueIndex == -1) {
      return;
    }

    for (int i = valueIndex+ 1; i < arr.length; i++) {
      arr[i - 1] = arr[i];
    }
    arr[arr.length-1] = -1;

  }

  public static void main(String[] args) {
    int[] arr = {100, 200, 300};
    deleteValue(arr, 100);

    for (int value : arr) {
      if (value == -1)
        break;
      System.out.println(value);
    }
  }
}
```

```java
200
300
```

![배열 삭제](https://user-images.githubusercontent.com/86590036/126870173-faae5280-97d0-4349-bdeb-3512289aec27.jpg)

- 출제의도
  - 1번과 다른 방법으로 문제를 해결할 수 있는가?
  - for 문에서 초기값을 바깥에 설정할 수 있는가?

```java

public class deleteValue2 {

  static void deleteValue(int[] arr, int value) {

    int i;
    for (i = 0; i < arr.length; i++) {
      if (arr[i] == value) {
        break;
      }
    }
    //반복문 돌떄까지 못찾음
    if (i == arr.length) {
      return;
    }

    for (i++; i < arr.length; i++) {
      arr[i - 1] = arr[i];
    }
    arr[arr.length-1] = -1;
  }

  public static void main(String[] args) {
    int[] arr = {100, 200, 300};
    deleteValue(arr, 200);

    for (int value : arr) {
      if (value == -1)
        break;
      System.out.println(value);
    }
  }
}

```

```java
100
300
```
