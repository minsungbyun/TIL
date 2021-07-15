package com.eomcs.algorithm.quiz;

// 출처: codefights.com
//
// 배열의 전체 길이를 L이라고 하자.
// 배열을 절반(L/2)으로 나눌 때, 앞쪽 부분과 뒤쪽 부분의 위치를 바꿔라.
// 예)
// [2, 4, 5, 6, 4, 3, 7, 8] => [4, 3, 7, 8, 2, 4, 5, 6]
//
// 한 줄에 버그가 있다. 고쳐라!
public class Test003 {
  //1) for 돌려
  //2) 확인해
  //3) 대응되는 것 확인
  static void changeValuePosition(int[] values) {

    // 만약 홀수가 온다면? 가운데를 기준으로 나머지가 바뀌어야 한다.
    // 나머지가 있으면 1을 추가 addIndex


    int half = values.length >> 1; // /2 한것과 같다.
    int addIndex = values.length & 1; 
    int temp = 0;
    for (int i = 0; i < half; i++) {
      temp = values[i];
      values[i] = values[i + half + addIndex]; // 홀수면 1을 더하겠다.
      values[i + half + addIndex] = temp;
    }
  }

  public static void main(String[] args) {
    int[] values = {2, 4, 5, 6, 4, 3, 7, 8};
    changeValuePosition(values);

    for (int v : values) {
      System.out.print(v + ",");
    }
  }

}
