## Streaming API 유래와 파일 I/O

과거에는 장비를 사용할 때 각각의 장비에 맞는 I/O API를 사용해야 했다.
각 디바이스에 따라 데이터 I/O를 할 수 있는 함수가 달랐다.
그래서 개발자는 각 장비별로 데이터 I/O의 사용법을 학습하고 물어봐야하는 문제가 있었다.

이를 해결하기 위해서 나온것이 있었으니..

장비제어를 하기위해 **Device Driver(장비 드라이브 : H/W 제조사에서 제공 / 자기네 장비 제어할 때 호출할 function이 들어있는 app 제공 (.dll))** 설치해서 제어한다.

[drive(이끌다) - 장비 진단 통제 제어하기 위함]

덕분에 개발자는 **장비에 상관없이** 일관된 방법으로 데이터 I/O를 할 수 있게 되었다.

![파일입출력1](https://user-images.githubusercontent.com/86590036/132279911-c7a2c3be-fe5d-45a3-b81b-ceecf7ad4319.jpg)

### Binary file vs Text file

이 두개의 파일의 가장 큰 차이는 **전용 App을 사용해서 읽어야하냐 그렇지 않냐**이다.

![파일입출력2](https://user-images.githubusercontent.com/86590036/132279947-a49743f9-2111-4270-b7c5-0a4f8c677841.jpg)

### Java에서 사용하는 파일 입출력에 관하여

![파일입출력3](https://user-images.githubusercontent.com/86590036/132279968-94dec776-3359-4a01-8414-86125b7084d0.jpg)

![파일입출력4](https://user-images.githubusercontent.com/86590036/132279977-bc572ffa-4c45-4d4e-998b-e757ea21e37a.jpg)

![파일입출력5](https://user-images.githubusercontent.com/86590036/132279989-d3e24529-6a8d-48e6-be13-70f5ac929039.jpg)

FileOutputStream의 write() 메서드는 파라미터로 받은 int 값 중에서 맨 하위 1byte만 출력한다. (앞에있는 3바이트는 날려버린다)

Q. 그러면 어떻게 온전한 값으로 출력하죠?

A. 비트 이동시키면 된다.

ex) int no = 1000; > 00 00 03 E8

맨 앞의 바이트를 맨 뒤로출력
두 번째 바이트 맨 뒤로 출력
세 번째 바이트 맨 뒤로 출력

```
 이렇게 게시글 데이터를 저장할 때 다음과 같이 나름의 형식에 따라 데이터를 출력한다.
     - 처음 4바이트는 저장할 게시글의 개수이다,
     - 그 다음 4바이트는 게시글 번호이고,
     - 그 다음 2바이트는 제목의 바이트 개수이고 등등

     파일에 데이터를 출력할 때 사용하는 규칙을 "파일 포맷(format)" 이라 부른다.
     당연히 파일에서 데이터를 읽을 때는 저장한 규칙에 맞춰 읽어야 한다.
     즉 "파일 포맷"에 맞춰 읽어야 한다.

     .ppt 파일을 읽을 때는 ppt 파일 포맷에 맞춰 읽어야한다.
     만약 파일 포맷을 모른다면 해당 파일을 재대로 읽을 수가 없다.
```

### 예시를 통해 알아보는 파일 입출력

1. 게시글 번호 출력

```java
 try (FileOutputStream out = new FileOutputStream("board.data")) {
      for (Board board : boardList) {
        // 1) 게시글 번호 4바이트 출력
        out.write(board.getNo() >> 24);
        out.write(board.getNo() >> 16);
        out.write(board.getNo() >> 8);
        out.write(board.getNo());
      }
    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
    }

```

```java
00 00 03 E8 (1000)
00 00 07 D0 (2000)
00 00 0B B8 (3000)
```

2. 게시글 제목 출력

   getByte("UTF-8") << 뒤에 어떤 형식으로 인코딩 할지 지정해준다.
   안하면 운영체제에 기본적으로 가지고 있는 인코딩 형식으로 지정된다.
   윈도우의 경우 MS-949

하지만 우리는 **국제표준인 UTF-8을 사용한다.**

```java

    // 게시글 데이터를 파일로 내보내기 (저장하기, 쓰기)
    try (FileOutputStream out = new FileOutputStream("board.data")) {
      for (Board board : boardList) {
        // 1) 게시글 번호 4바이트 출력
        out.write(board.getNo() >> 24);
        out.write(board.getNo() >> 16);
        out.write(board.getNo() >> 8);
        out.write(board.getNo());

        // 2) 게시글 제목
        byte[] bytes = board.getTitle().getBytes("UTF-8");
        out.write(bytes);

      }
    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
    }

```

```java
00 00 03 E8 41 42 EA B0 80 EA B0 81
00 00 07 D0 61 62 EA B0 80 EA B0 81
00 00 0B B8 41 42 61 62
```

3. 게시글 내용 출력

제목과 내용을 분리시켜야하는데 어떻게 구별하지?? 제목과 내용을 똑같은 문자를 쓴다면?

어디서 어디까지가 제목이고 내용인지 알려줘야한다.

```java
 try (FileOutputStream out = new FileOutputStream("board.data")) {
      for (Board board : boardList) {
        // 1) 게시글 번호 4바이트 출력
        out.write(board.getNo() >> 24);
        out.write(board.getNo() >> 16);
        out.write(board.getNo() >> 8);
        out.write(board.getNo());

        // 2) 게시글 제목
        byte[] bytes = board.getTitle().getBytes("UTF-8");
        out.write(bytes.length >> 8); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes.length); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes); // 그런 후에 바이트를 출력한다.

        // 2) 게시글 내용 출력
        bytes = board.getContent().getBytes("UTF-8");
        out.write(bytes.length >> 8); // 2바이트로 바이트 배열의 크기를 먼저 출력한다.
        out.write(bytes.length);
        out.write(bytes); // 그런 후에 바이트를 출력한다.

      }
    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
    }
```

```java
  // 게시글 데이터를 파일로 내보내기 (저장하기, 쓰기)
    try (FileOutputStream out = new FileOutputStream("board.data")) {
      // 출력할 게시글 개수를 먼저 저장한다.
      out.write(boardList.size() >> 24);
      out.write(boardList.size() >> 16);
      out.write(boardList.size() >> 8);
      out.write(boardList.size());

      for (Board board : boardList) {
        // 1) 게시글 번호 4바이트 출력
        out.write(board.getNo() >> 24);
        out.write(board.getNo() >> 16);
        out.write(board.getNo() >> 8);
        out.write(board.getNo());

        // 2) 게시글 제목
        byte[] bytes = board.getTitle().getBytes("UTF-8");
        out.write(bytes.length >> 8); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes.length); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes); // 그런 후에 바이트를 출력한다.

        // 3) 게시글 내용 출력
        bytes = board.getContent().getBytes("UTF-8");
        out.write(bytes.length >> 8); // 2바이트로 바이트 배열의 크기를 먼저 출력한다.
        out.write(bytes.length);
        out.write(bytes); // 그런 후에 바이트를 출력한다.

        // 4) 게시글 등록일 출력
        //        long millis = board.getRegisteredDate().getTime();
        //        out.write((int)millis >> 56);

        String dateStr = board.getRegisteredDate().toString(); // "2021-09-07"
        bytes = dateStr.getBytes("UTF-8");
        out.write(bytes.length >> 8);
        out.write(bytes.length);
        out.write(bytes);

        // 5) 게시글 조회수 출력
        out.write(board.getViewCount() >> 24);
        out.write(board.getViewCount() >> 16);
        out.write(board.getViewCount() >> 8);
        out.write(board.getViewCount());

        // 6) 게시글 작성자 번호 출력
        out.write(board.getWriter().getNo() >> 24);
        out.write(board.getWriter().getNo() >> 16);
        out.write(board.getWriter().getNo() >> 8);
        out.write(board.getWriter().getNo());

        // 7) 게시글 작성자 이름 출력
        bytes = board.getWriter().getName().getBytes("UTF-8");
        out.write(bytes.length >> 8); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes.length); // 바이트의 개수를 2바이트로 먼저 출력한다.
        out.write(bytes); // 그런 후에 바이트를 출력한다.

      }
    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
    }
```
