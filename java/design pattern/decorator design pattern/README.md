## Decorator 패턴을 이용해서 파일 I/O를 더 쉽게 출력해보자

![디자인패턴1](https://user-images.githubusercontent.com/86590036/132300025-7cb999fe-7748-411d-a86c-257047f9ea33.jpg)

![디자인패턴2](https://user-images.githubusercontent.com/86590036/132300046-0e957ebc-ef7d-4805-a059-bcfed189024f.jpg)

![디자인패턴3](https://user-images.githubusercontent.com/86590036/132300076-2981f378-6ea5-44e5-a44e-02d550a6b2f4.jpg)

![디자인패턴4](https://user-images.githubusercontent.com/86590036/132300103-6ee22d79-e82d-44e7-881b-424ea50d7175.jpg)

### 📌 DataOutputStream을 사용해보자

1. 게시글 출력

```java
 // 게시글 데이터를 파일로 내보내기(저장하기, 쓰기)
    try (
        // 파일에 바이트를 출력하는 객체
        FileOutputStream out = new FileOutputStream("board.data");
        DataOutputStream out2 = new DataOutputStream(out)) {
      // 출력할 게시글 개수를 먼저 저장한다.
      out2.writeInt(boardList.size());

      for (Board board : boardList) {
        // 1) 게시글 번호 4바이트 출력
        out2.writeInt(board.getNo());

        // 2) 게시글 제목 출력
        out2.writeUTF(board.getTitle());

        // 3) 게시글 내용 출력
        out2.writeUTF(board.getContent());

        // 4) 게시글 등록일 출력
        out2.writeUTF( board.getRegisteredDate().toString());

        // 5) 게시글 조회수 출력
        out2.writeInt(board.getViewCount());

        // 6) 게시글 작성자 번호 출력
        out2.writeInt(board.getWriter().getNo());

        // 7) 게시글 작성자 이름 출력
        out2.writeUTF(board.getWriter().getName());
      }

      System.out.println("게시글 저장 완료!");

    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
    }

```

2. 게시글 저장

```java
 // 파일에서 게시글 데이터를 가져오기(로딩하기, 읽기)
    // => 저장할 때 사용한 규칙에 따라 읽어야 한다.
    // => 즉 파일 포맷에 맞춰 읽는다.
    try (
        // 파일에서 바이트를 읽어 오는 일을 하는 객체
        FileInputStream in = new FileInputStream("board.data");
        // 읽어온 바이트를 가공하여 primitive 타입의 값이나 String 객체로 가공하는 일을 하는 객체
        DataInputStream in2 = new DataInputStream(in); ) {
      int size = (in.read() << 24) | (in.read() << 16) | (in.read() << 8) | in.read();
      for (int i = 0; i < size; i++) {
        Board board = new Board();

        // 1) 게시글 번호 읽기
        board.setNo(in2.readInt()); // writerInt()로 출력한 데이터를 읽을 때 사용

        // 2) 게시글 제목 읽기
        board.setTitle(in2.readUTF()); // writerUTF()로 출력한 데이터를 읽을 때 사용

        // 3) 게시글 내용 읽기
        board.setContent(in2.readUTF());

        // 4) 게시글 등록일 읽기
        board.setRegisteredDate(Date.valueOf(in2.readUTF()));

        // 5) 게시글 조회수 읽기
        board.setViewCount(in2.readInt());

        // 6) 작성자 정보 읽기
        Member writer = new Member();

        // - 작성자 번호 읽기
        writer.setNo(in2.readInt());

        // - 작성자 이름 읽기
        writer.setName(in2.readUTF());

        // - 게시글에 작성자 정보 저장
        board.setWriter(writer);

        // 목록에 게시글 저장
        boardList.add(board);
      }

      System.out.println("게시글 로딩 완료!");

    } catch (Exception e) {
      System.out.println("파일에서 게시글을 읽어 오는 중 오류 발생!");
    }
  }
```

### 📌 serialize

![디자인패턴5](https://user-images.githubusercontent.com/86590036/132308400-f5a66707-8ea8-44ea-ab03-f0b98ea1895f.jpg)

![디자인패턴6](https://user-images.githubusercontent.com/86590036/132308439-4ed544df-ec87-4e11-8a9c-b93913952741.jpg)

implements Serializable : 직렬화 할 수 있어요 표시 / 인터페이스 안에 아무것도 없다.

[직렬화]

```java
@SuppressWarnings("serial")
public class Board implements Serializable {
  private int no;
  private String title;
  private String content;
  private Member writer;
  private Date registeredDate;
  private int viewCount;
  private int like;
```

### 📌 ObjectOutputStream을 사용해보자

[출력]

```java
 try (
        // 파일에 바이트를 출력하는 객체
        FileOutputStream out = new FileOutputStream("board.data2");

        // 출력할 객체의 모든 필드 값을 바이트 배열에 담는 일을 하는 객체
        ObjectOutputStream out2 = new ObjectOutputStream(out)) {

      // 출력할 게시글 개수를 먼저 저장한다.
      out2.writeInt(boardList.size());

      for (Board board : boardList) {
        out2.writeObject(board);
      }

      System.out.println("게시글 저장 완료!");

    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
      e.printStackTrace();
    }

  }
```

[리팩토링]

```java
 // 게시글 데이터를 파일로 내보내기(저장하기, 쓰기)
    try (

        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("board.data3"))) {

      out.writeObject(boardList);

      System.out.println("게시글 저장 완료!");

    } catch (Exception e) {
      System.out.println("게시글을 파일에 저장 중 오류 발생!");
      e.printStackTrace();
    }

  }
```

[입력]

```java
 try (
        // 파일에서 바이트를 읽어 오는 일을 하는 객체
        FileInputStream in = new FileInputStream("board.data");

        // 직렬화 방식으로 출력된 바이트를 읽어 객체의 필드 값으로 복원하는 일을 하는 객체
        ObjectInputStream in2 = new ObjectInputStream(in); ) {

      int size = in2.readInt();

      for (int i = 0; i < size; i++) {
        boardList.add((Board)in2.readObject());
      }

      System.out.println("게시글 로딩 완료!");

    } catch (Exception e) {
      System.out.println("파일에서 게시글을 읽어 오는 중 오류 발생!");
    }
  }
```

[리팩토링]

```java
try (ObjectInputStream in = new ObjectInputStream(new FileInputStream("board.data3")); ) {
      boardList.addAll((List<Board>) in.readObject());


      System.out.println("게시글 로딩 완료!");

    } catch (Exception e) {
      System.out.println("파일에서 게시글을 읽어 오는 중 오류 발생!");
    }
  }
```

### 📌 어떤 스트림을 쓸 것인지는 판단에 맡긴다.

![디자인패턴7](https://user-images.githubusercontent.com/86590036/132308464-78fcf9b1-b5a2-4980-92ac-086d9e09743f.jpg)
