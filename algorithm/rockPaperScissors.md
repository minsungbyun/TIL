## π μ»΄ν¨ν°μ κ°μ λ°μ λ³΄ κ²μνκΈ°

- RULE
  - μ»΄ν¨ν°λ λλ€μΌλ‘ μ«μκ° λΆμ¬λλ©° μ¬μ©μλ μ«μλ₯Ό μλ ₯νλ€.
  - κ°μ = 1, λ°μ = 2, λ³΄ = 3

- μΆμ μλ
  - if, while, for, switchλ¬Έμ μ¬μ©ν  μ μλκ°?
  - Math.random()μΌλ‘ λμλ₯Ό λ°μμν¬ μ μλκ°?

```java
package algorithm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RockPaperScissors {

  public static void main(String[] args) throws IOException {

    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    System.out.println("[ ββμ»΄ν¨ν°μ κ°μλ°μλ³΄ λκ²°μ ν©λλ€!ββ ]");

    while (true) {
      System.out.print("μ μλ₯Ό μλ ₯ν΄μ£ΌμΈμ (κ°μ = 1, λ°μ = 2, λ³΄ = 3) > ");
      int me = Integer.parseInt(br.readLine());
      if (!(me == 1 || me == 2 || me == 3)) {
        System.out.println("λ€μ μλ ₯ν΄μ£ΌμΈμ\n");
        continue;
      }
      int com = (int) (Math.random() * 3) + 1;
      int result = me - com;

      /**                 
       *          κ°μ    λ°μ    λ³΄  (λ)
       *    κ°μ     0     1      2 
       *    
       *    λ°μ    -1     0      1
       *    
       *      λ³΄    -2     -1     0
       *      
       *  (μ»΄ν¨ν°) 
       */

      switch (result) {
        case -2: case 1: System.out.println("λΉμ μ΄ μ΄κ²Όμ΅λλ€."); break;
        case -1: case 2: System.out.println("μ»΄ν¨ν°κ° μ΄κ²Όμ΅λλ€."); break;
        case 0: System.out.println("λ¬΄μΉλΆμλλ€."); break;
      }
      System.out.println();
    }
  }
}

```