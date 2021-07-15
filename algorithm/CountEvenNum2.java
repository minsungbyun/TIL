
public class CountEvenNum2 {

  static int countEvenNumber(final int value) {
    // 1) 짝수의 갯수를 담을 변수를 선언한다.  (count)
    // 2) 파라미터로 들어온 값을 담을 변수를 선언한다.(num)
    // 3) 반복문을 돌면서 0이 아닐 때까지 돌린다. (while)
    // 4) 조건문을 사용해서 짝수면 카운트업시킨다. (if/%)
    // 5) 반복문이 끝나면 결과값을 리턴한다. 

    int count = 0;
    int num = value;

    while (num > 0) {
      if ((num & 1) == 0) {
        count++;
      }
      num /= 10;
    }
    return count;
  }
  public static void main(String[] args) {
    System.out.println(countEvenNumber(1238694636));

  }
}