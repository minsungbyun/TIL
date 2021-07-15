package com.eomcs.algorithm.quiz;

public class MaxDiff2 {
  // 1) for 문 반복
  // 2) length 마지막 번호보다 하나 작은거까지 비교  -1을뺀다? 부등호를 붙일 것인가 아닌가? < . <=
  // 3) 비교
  // 4) 찍어서 확인

  static int maxDiff(int[] values) {

    int result = 0;     
    for (int i=0; i<values.length-1; i++) {
      int diff = Math.abs(values[i] - values[i+1]);
      if (diff > result) {
        result = diff;
      }
      System.out.println(diff);
    }
    return result;


  }

  public static void main(String[] args) {

    //    int[] arr = new int[] {2,4,1,0};
    //    int result = maxDiff(arr);
    //    System.out.println(result);

    System.out.println(maxDiff(new int[]{2, 4, 1, 0}));

  }

}
