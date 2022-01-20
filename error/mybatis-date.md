## 📌 Oracle DB의 날짜 데이터 출력 시 null발생 + 날짜 포멧 변경

---

## 🟣 오류메세지

![null문제](https://user-images.githubusercontent.com/86590036/148865702-4430918f-0ccf-4ddc-bb55-ee83f895ab3f.jpg)

### < 오류코드 >

## 🟣 원인

- DB에 date로 넣은 값을 자바 객체에서 꺼낼 때, null을 반환하는 현상

- DB에 등록일을 나타내는 REG_DT를 설정하였고 자바 DTO에서는 registeredDate로 설정하였는데
  테스트를 하던 도중 date 값이 null이 들어오는 현상발견

- DB column과 자바 property간의 mapping 불일치

- 날짜 출력시 포멧이 원하는대로 나오지 않았다.

## 🟣 해결책

DB는 snake_case인데 자바는 camelCase이다. 그렇다면 camelCase로 받을 수 있게 설정하면 되겠다.

DB로부터 Query는 성공적으로 수행했지만, 결과를 DTO에 넣지 못하여 내용은 null이 된 것이다.

1. 가장 단순하게는 mapper query에서 별명을 주는 것이다.
2. mybatis-config.xml에 `<setting name="mapUnderscoreToCamelCase" value="true" />` 추가

[mybatis-config.xml 수정]

- mybatis-config configuration에서 typeAliases와 settings를 동시에 쓸 수 없어서 typeAliases(패키지명을 포함한 DTO를 쓰지 않게끔 생략가능하게 별명을 붙인다.)를 사용하였고 settings의 mapUnderscoreTocamelCase(DB의 언더바를 자바 camelCase랑 호환시킨다.) 대신에 boardMapper.xml의 쿼리문에 DTO와 같은 별명을 부여하였다

- boardMapper.xml 코드는 아래에 있다.

![mybatis-config에서의 오류](https://user-images.githubusercontent.com/86590036/148865698-5ef5f2e0-7f86-462d-bdf7-755d623444e6.jpg)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

  <typeAliases>
    <package name="com.oneday.bms.board.dto"/>
  </typeAliases>

  <mappers>
 	 <package name="com.oneday.bms.board.dao"/>
  </mappers>

</configuration>

<!--
  <settings>
       <setting name="mapUnderscoreToCamelCase" value="true" />
        <setting name="callSettersOnNulls" value="false"/>
        <setting name="jdbcTypeForNull" value="NULL"/>
   </settings>
    -->
<!-- callSettersOnNulls true: 쿼리 결과 필드가 null인 경우, 누락이 되서 나오는데 누락이 안되게 하는 설정-->
<!-- jdbcTypeForNull 쿼리에 보내는 파라미터가 null인 경우, 오류 발생하는 것 방지  예) #{search.user} -->


```

[BoardDAOTest.java 수정 전]

![테스트케이스](https://user-images.githubusercontent.com/86590036/148865708-0015b29f-f4c6-4daf-b1aa-d989b008bde3.jpg)

[BoardDAOTest.java 수정 후]

![오류코드](https://user-images.githubusercontent.com/86590036/148866633-81488337-6922-47b1-b38e-01ea6173c66f.jpg)

```java
@Test
	public void testGetBoardContent() throws Exception {
		BoardDTO boardDTO = boardDAO.getBoardContent(1);
		logger.info("boardContent = {}", boardDTO);

		if (boardDTO != null) {
			logger.info("번호 : {}", boardDTO.getId());
			logger.info("제목: {}", boardDTO.getTitle());
			logger.info("내용 : {}", boardDTO.getContent());
			logger.info("카테고리 : {}", boardDTO.getCategory());
			logger.info("태그 : {}", boardDTO.getTag());
			logger.info("조회수 : {}", boardDTO.getViewCount());
			logger.info("작성자 : {}", boardDTO.getWriter());
			logger.info("작성일 : {}", boardDTO.getRegDate());
			logger.info("수정일 : {}", boardDTO.getEditDate());
		} else {
			logger.info("데이터가 없습니다");
		}

	}
```

### 날짜 포멧은 어떻게 나타낼까?

테스트케이스는 정상적으로 돌아가지만 날짜형식이 내가 원하는 방식이 아니다.
https://okky.kr/article/807824 에서나랑 똑같은 고민을 하고 계신분이 있었다.

![결과1](https://user-images.githubusercontent.com/86590036/148870533-679368f7-655c-4ea6-9c27-9bad5dbaf9f2.jpg)

해결 방법은 2가지가 있다.

1. SELECT TO_CHAR(start_date, 'YY/MM/DD') FROM TABLE 와 같이
   date 타입을 char 타입으로 변환해서 값을 가져오는 방법

- 기존에 있던 DTO 타입을 String으로 수정

2.  Date 타입을 유지하고 싶다면 JSTL fmt를 사용해도 되고 자바 로직자체로 형변환된 값을 뷰로 넘겨주는 방법

나는 1번 방법을 사용해서 문제를 해결하기로 하고 DTO의 타입을 Date에서 String으로 변경하였다.

[BoardDTO.java 수정 전]

![자바dto](https://user-images.githubusercontent.com/86590036/148865706-a706cb62-7052-42d9-bc06-fef79098c8fd.jpg)

[BoardDTO.java 수정 후]

![자바dto string으로 변경](https://user-images.githubusercontent.com/86590036/148865705-b9450579-b8db-4bf2-8c3b-dceadb51017f.jpg)

DTO 변경에 따라서 xml도 수정이 필요했고 Oracle 날짜 변환 문법 중 TO_CHAR(reg_date, 'YY/MM/DD')를 사용하였다.

[boardMapper.xml 수정]

![mybatis-config에서의 해결방법](https://user-images.githubusercontent.com/86590036/148865700-ece08993-e128-4e7f-a561-013feb346817.jpg)

[날짜 포멧팅을 위한 boardMapper.xml 수정]

![mapper에 to char추가](https://user-images.githubusercontent.com/86590036/148865697-4e5f43ab-bd2f-44b7-8363-b09dbfc5baf4.jpg)

```xml
<!-- DAO 자동생성 -->
<mapper namespace="com.oneday.bms.board.dao.BoardDAO">

	<select id="getBoardList" resultType="BoardDTO">

		SELECT
			id,
			category,
			title,
			content,
			tag,
			view_count viewCount,
			writer,
			TO_CHAR(reg_date, 'YY/MM/DD') regDate,
			TO_CHAR(edit_date, 'YY/MM/DD') editDate
		FROM
			bms_board
		ORDER BY
			id DESC

	</select>
```

[날짜 포멧팅 후 결과]

![결과2](https://user-images.githubusercontent.com/86590036/148870536-c55ee262-af06-4e3f-b188-f670d43fb62f.jpg)
