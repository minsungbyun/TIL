package com.eomcs.pms;

public class deleteValue2 {

  // 배열에서 해당 항목의 값을 삭제한다.
  // 배열 뒤의 항목은 -1로 설정한다.
  // 배열을 출력할 때는 -1인 항목은 출력하지 않는다.
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
      arr[i - 1] = arr[i]; //맨 뒤에 null 떙기면 null이다. 땡기더라도 어떻게 땡길지
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
