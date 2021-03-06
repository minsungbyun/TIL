## ๐ป ํ๋ก๊ทธ๋จ์ด ์คํ๋๋ ๊ณผ์ 

์ง๊ตฌ์์ ์๋ ๋ชจ๋  ์ปดํจํฐ๋ ๋ค์๊ณผ ๊ฐ์ ๋ฐฉ๋ฒ์ผ๋ก ์คํ๋๋ค.

1. ๋ช๋ น์ด๋ฅผ ์คํ์ํค๊ณ  ์ถ๋ค๋ฉด HDD์ ์ ์ฅ๋ ์คํํ์ผ(๋ช๋ น์ด), ๋ฐ์ดํฐํ์ผ(mpeg,mp4)์ RAM์ผ๋ก ๊ฐ์ ธ์์ผํ๋ค. <br>
   ์ด๋ฅผ `loading`์ด๋ผ๊ณ  ํ๋ค.

2. RAM์์๋ ํด๋น ์คํํ์ผ ํน์ ๋ฐ์ดํฐํ์ผ ์ค ์ผ๋ถ๋ฅผ ์ฝ์ด์(์ฉ๋์ด ํฌ๋ค๋ฉด) CPU๋ก ๋ณด๋ธ๋ค.
3. CPU(L1 ์บ์)๊ฐ ์์์ ์ํํ๋ค.

### ๐ป JVM์ ๋ฉ๋ชจ๋ฆฌ ๊ตฌ์กฐ

Java์ JVM์ ๋ฉ๋ชจ๋ฆฌ๋ 3๊ฐ์ง ๊ตฌ์กฐ๋ฅผ ๊ฐ์ง๊ณ  ์์ผ๋ฉฐ ๊ฐ๊ฐ์ ์ญํ ์ ๋ค์๊ณผ ๊ฐ๋ค.

| ์์ญ            | ์ค๋ช                                                           |
| --------------- | -------------------------------------------------------------- |
| Method Area     | .class์ ๋ด์ฉ (ํด๋์ค์ฝ๋, ์์, ํด๋์ค ๋ณ์)                  |
| JVM stack       | ๋ฉ์๋๋ฅผ ํธ์ถํ  ๋ ์์ฑ๋๋ ๋ก์ปฌ ๋ณ์๋ฅผ ๋๋ค (๋ฉ์๋,ํ๋ผ๋ฏธํฐ) |
| Heap (only new) | new ์ฐ์ฐ์๋ก ์์ฑ๋๋ ๋ณ์                                     |

## ๐ call by value (์ค์ฒด๋ฅผ ๋๊ธด๋ค)

- call by value 1
  ![01_call by value](https://user-images.githubusercontent.com/86590036/125621893-448d6656-768d-4737-ab61-80c01897c64c.jpg)
- call by value 2
  ![02_call by value 2](https://user-images.githubusercontent.com/86590036/125624700-b220013c-c0ea-43b5-a621-18fc7a527db6.jpg)
- call by value 3
  ![03_call by value 3](https://user-images.githubusercontent.com/86590036/125624770-a825a1d1-1d5e-4bd2-a22a-85e58e694e8b.jpg)

1. JVM์ด ์ด์์ฒด์ ์๊ฒ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ์์ฒญํ๊ณ  ์ดํ ํด๋์ค๊ฐ loading ๋๋ค.
2. main()๋ฅผ ํธ์ถํ๋ค.
3. main()์ ๋ก์ปฌ๋ณ์์ ๊ฐ์ด ์ ์ฅ๋๋ค.
4. main()์์ swap()์ ํธ์ถํ๋ค.
5. ํธ์ถ๋๋ ํจ์์ argument "๊ฐ"์ ์ ๋ฌํ๋ค.
6. swap()์์ parameter๋ก ๋ฐ์์ ๋ด๋ถ ๋ณ์์ ๊ฐ์ ํ ๋นํ๋ค.
7. ๊ฐ์ด ์ถ๋ ฅ๋๋ค. (void)
8. ํด๋น ๋ฉ์๋๊ฐ ๋๋๋ฉด ๋ก์ปฌ๋ณ์๋ ์ฌ๋ผ์ง๋ฉฐ ์ด์์ฒด์ ์๊ฒ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ๋ฐ๋ฉํ๋ค.

### ์ call by value๋ก ๋ถ๋ฅด๋๊ฐ?

argument(์๊ท๋จผํธ)๊ฐ primitive data type(๊ธฐ๋ณธํ)์ธ ๊ฒฝ์ฐ, ๋ฉ์๋๋ฅผ ํธ์ถํ  ๋ `๊ฐ`์ ๋๊ธด๋ค.<br>
=> ์๋ฐ์์๋ primitive data type์ ๋ํด์ ๋ฉ๋ชจ๋ฆฌ(๋ณ์) ์ฃผ์๋ฅผ ๋๊ธฐ๋ ๋ฐฉ๋ฒ์ด ์๋ค.

`read only` ๋ฐฉ์๋ง ์ ์ฉ๋๋ค.

```java

public class Exam0310 {

  static void swap(int a, int b) {
    System.out.printf("swap(): a=%d, b=%d\n", a, b);
    int temp = a;
    a = b;
    b = temp;
    System.out.printf("swap(): a=%d, b=%d\n", a, b);
  }

  public static void main(String[] args) {
    int a = 100;
    int b = 200;

    swap(a, b);
    System.out.printf("main(): a=%d, b=%d\n", a, b);
  }
}

```

## ๐ call by reference (์ฃผ์๋ฅผ ๋๊ธด๋ค)

- call by reference 1
  ![04_call by reference](https://user-images.githubusercontent.com/86590036/125625241-a8ff3990-0eb1-46cd-b467-52d15ab4b396.jpg)
- call by reference 2
  ![05_call by reference](https://user-images.githubusercontent.com/86590036/125625276-71a413ab-40f8-49ff-81a3-35f67719cfba.jpg)
- call by reference 3
  ![06_call by reference](https://user-images.githubusercontent.com/86590036/125625312-71848586-8a52-4e13-85f8-1224f28e23ed.jpg)

1. JVM์ด ์ด์์ฒด์ ์๊ฒ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ์์ฒญํ๊ณ  ์ดํ ํด๋์ค๊ฐ loading ๋๋ค.
2. main()๋ฅผ ํธ์ถํ๋ค.
3. new ์ฐ์ฐ์์ ์ํด heap ๋ฉ๋ชจ๋ฆฌ ์์ญ์ ๋ฐฐ์ด์ด ๋ง๋ค์ด์ง๋ค. (์ฃผ์์์ฑ)
4. main()์์ swap()์ ํธ์ถํ๋ค.
5. ํธ์ถ๋๋ ํจ์์ argument `์ฃผ์`์ ์ ๋ฌํ๋ค.
6. swap()์์ parameter๋ก ์ฃผ์๋ฅผ ๋ฐ์์ ์ ์ฅํ๊ฒ ๋๊ณ  ์ฃผ์์ ๋ฐ๋ฅธ ๊ฐ ๋ณ๊ฒฝ์ด ๊ฐ๋ฅํ๋ค.
7. ํด๋น ๋ฉ์๋๊ฐ ๋๋๋ฉด ๋ก์ปฌ๋ณ์๋ ์ฌ๋ผ์ง๋ฉฐ ์ด์์ฒด์ ์๊ฒ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ๋ฐ๋ฉํ๋ค.

heap ๋ฉ๋ชจ๋ฆฌ์ ์๋ ๋ฐฐ์ด์ JVM์ด ์ข๋ฃ๋๊ธฐ ์ ๊น์ง ๋ฉ๋ชจ๋ฆฌ์์ ๋จ์์๋๋ค.

### ์ call by reference ๋ถ๋ฅด๋๊ฐ?

argument(์๊ท๋จผํธ)๊ฐ reference data type(์ฐธ์กฐํ)์ธ ๊ฒฝ์ฐ, ๋ฉ์๋๋ฅผ ํธ์ถํ  ๋ `์ฃผ์`์ ๋๊ธด๋ค. <br>
reference = ์ฃผ์ ๊ธฐ์ตํ์!

value ๋ฐฉ์๊ณผ ๋ค๋ฅด๊ฒ `read & write`๊ฐ ๊ฐ๋ฅํ๋ค.

#### <๋ฐฐ์ด ์์>

```java

public class Exam0320 {

  static void swap(int[] arr) {
    System.out.printf("swap(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
    int temp = arr[0];
    arr[0] = arr[1];
    arr[1] = temp;
    System.out.printf("swap(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
  }

  public static void main(String[] args) {
    int[] arr = new int[] {100, 200};
    swap(arr); //๋ฐฐ์ด์ ์ฃผ์

    System.out.printf("main(): arr[0]=%d, arr[1]=%d\n", arr[0], arr[1]);
  }
}

```

#### <๊ฐ์ฒด ์์>

```java

public class Exam0330 {

  static class MyObject {
    int a;
    int b;
  }

  static void swap(MyObject ref) {
    System.out.printf("swap(): a=%d, b=%d\n", ref.a, ref.b);
    int temp = ref.a;
    ref.a = ref.b;
    ref.b = temp;
    System.out.printf("swap(): a=%d, b=%d\n", ref.a, ref.b);
  }

  public static void main(String[] args) {

    MyObject ref = new MyObject();
    ref.a = 100;
    ref.b = 200;

    swap(ref); // ๊ฐ์ฒด์ ์ฃผ์
    System.out.printf("main(): a=%d, b=%d\n", ref.a, ref.b);
  }
}

```
