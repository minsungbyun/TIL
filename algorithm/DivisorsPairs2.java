package com.eomcs.algorithm.quiz;

// 출처: codefights.com
//
// 숫자 배열이 있다.
// 나누어 0이 떨어지는 수가 몇 쌍이 있는지 구하라!
//
// 한 줄에 버그가 있다. 고쳐라! 
public class DivisorsPairs2 {

  //  1) 양쪽을 나눈다. (어느 숫자가 더 클지 모르기 때문에)
  // 반복문의 인덱스를 다룰 수 있나?
  // i+1의 의미를 아는가?
  // 나누어 떨어진다는건 나누었을 떄 0
  // if 문에서 조건을 1개줬을 때 답이 아님 그래서 조건 2개 줘야함 a를 b로 나누거나 b를 a로 나누거나 만족
  // %연산자 ==연산자 ||연산자 사용할 수 있는가?
  // 중간중간 값의 변화를 찍어보면서 확인하라.
  public static int divisorsPairs(int[] sequence) {
    int pairs = 0;
    for (int i = 0; i < sequence.length; i++ ) {
      for (int j = i+1; j < sequence.length; j++) {
        System.out.printf("%d <==> %d\n", sequence[i],sequence[j]);
        if (sequence[i] % sequence[j] == 0 || sequence[j] % sequence[i] == 0) {
          pairs++;
        }
      }
    }


    return pairs;
  }

  public static void main(String[] args) {
    int[] values = {8, 4, 2, 3, 6, 10, 5};
    System.out.println(divisorsPairs(values));

  }

}
