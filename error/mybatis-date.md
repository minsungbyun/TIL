## ๐ Oracle DB์ ๋ ์ง ๋ฐ์ดํฐ ์ถ๋ ฅ ์ null๋ฐ์ + ๋ ์ง ํฌ๋ฉง ๋ณ๊ฒฝ

---

## ๐ฃ ์ค๋ฅ๋ฉ์ธ์ง

![null๋ฌธ์ ](https://user-images.githubusercontent.com/86590036/148865702-4430918f-0ccf-4ddc-bb55-ee83f895ab3f.jpg)

### < ์ค๋ฅ์ฝ๋ >

## ๐ฃ ์์ธ

- DB์ date๋ก ๋ฃ์ ๊ฐ์ ์๋ฐ ๊ฐ์ฒด์์ ๊บผ๋ผ ๋, null์ ๋ฐํํ๋ ํ์

- DB์ ๋ฑ๋ก์ผ์ ๋ํ๋ด๋ REG_DT๋ฅผ ์ค์ ํ์๊ณ  ์๋ฐ DTO์์๋ registeredDate๋ก ์ค์ ํ์๋๋ฐ
  ํ์คํธ๋ฅผ ํ๋ ๋์ค date ๊ฐ์ด null์ด ๋ค์ด์ค๋ ํ์๋ฐ๊ฒฌ

- DB column๊ณผ ์๋ฐ property๊ฐ์ mapping ๋ถ์ผ์น

- ๋ ์ง ์ถ๋ ฅ์ ํฌ๋ฉง์ด ์ํ๋๋๋ก ๋์ค์ง ์์๋ค.

## ๐ฃ ํด๊ฒฐ์ฑ

DB๋ snake_case์ธ๋ฐ ์๋ฐ๋ camelCase์ด๋ค. ๊ทธ๋ ๋ค๋ฉด camelCase๋ก ๋ฐ์ ์ ์๊ฒ ์ค์ ํ๋ฉด ๋๊ฒ ๋ค.

DB๋ก๋ถํฐ Query๋ ์ฑ๊ณต์ ์ผ๋ก ์ํํ์ง๋ง, ๊ฒฐ๊ณผ๋ฅผ DTO์ ๋ฃ์ง ๋ชปํ์ฌ ๋ด์ฉ์ null์ด ๋ ๊ฒ์ด๋ค.

1. ๊ฐ์ฅ ๋จ์ํ๊ฒ๋ mapper query์์ ๋ณ๋ช์ ์ฃผ๋ ๊ฒ์ด๋ค.
2. mybatis-config.xml์ `<setting name="mapUnderscoreToCamelCase" value="true" />` ์ถ๊ฐ

[mybatis-config.xml ์์ ]

- mybatis-config configuration์์ typeAliases์ settings๋ฅผ ๋์์ ์ธ ์ ์์ด์ typeAliases(ํจํค์ง๋ช์ ํฌํจํ DTO๋ฅผ ์ฐ์ง ์๊ฒ๋ ์๋ต๊ฐ๋ฅํ๊ฒ ๋ณ๋ช์ ๋ถ์ธ๋ค.)๋ฅผ ์ฌ์ฉํ์๊ณ  settings์ mapUnderscoreTocamelCase(DB์ ์ธ๋๋ฐ๋ฅผ ์๋ฐ camelCase๋ ํธํ์ํจ๋ค.) ๋์ ์ boardMapper.xml์ ์ฟผ๋ฆฌ๋ฌธ์ DTO์ ๊ฐ์ ๋ณ๋ช์ ๋ถ์ฌํ์๋ค

- boardMapper.xml ์ฝ๋๋ ์๋์ ์๋ค.

![mybatis-config์์์ ์ค๋ฅ](https://user-images.githubusercontent.com/86590036/148865698-5ef5f2e0-7f86-462d-bdf7-755d623444e6.jpg)

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
<!-- callSettersOnNulls true: ์ฟผ๋ฆฌ ๊ฒฐ๊ณผ ํ๋๊ฐ null์ธ ๊ฒฝ์ฐ, ๋๋ฝ์ด ๋์ ๋์ค๋๋ฐ ๋๋ฝ์ด ์๋๊ฒ ํ๋ ์ค์ -->
<!-- jdbcTypeForNull ์ฟผ๋ฆฌ์ ๋ณด๋ด๋ ํ๋ผ๋ฏธํฐ๊ฐ null์ธ ๊ฒฝ์ฐ, ์ค๋ฅ ๋ฐ์ํ๋ ๊ฒ ๋ฐฉ์ง  ์) #{search.user} -->


```

[BoardDAOTest.java ์์  ์ ]

![ํ์คํธ์ผ์ด์ค](https://user-images.githubusercontent.com/86590036/148865708-0015b29f-f4c6-4daf-b1aa-d989b008bde3.jpg)

[BoardDAOTest.java ์์  ํ]

![์ค๋ฅ์ฝ๋](https://user-images.githubusercontent.com/86590036/148866633-81488337-6922-47b1-b38e-01ea6173c66f.jpg)

```java
@Test
	public void testGetBoardContent() throws Exception {
		BoardDTO boardDTO = boardDAO.getBoardContent(1);
		logger.info("boardContent = {}", boardDTO);

		if (boardDTO != null) {
			logger.info("๋ฒํธ : {}", boardDTO.getId());
			logger.info("์ ๋ชฉ: {}", boardDTO.getTitle());
			logger.info("๋ด์ฉ : {}", boardDTO.getContent());
			logger.info("์นดํ๊ณ ๋ฆฌ : {}", boardDTO.getCategory());
			logger.info("ํ๊ทธ : {}", boardDTO.getTag());
			logger.info("์กฐํ์ : {}", boardDTO.getViewCount());
			logger.info("์์ฑ์ : {}", boardDTO.getWriter());
			logger.info("์์ฑ์ผ : {}", boardDTO.getRegDate());
			logger.info("์์ ์ผ : {}", boardDTO.getEditDate());
		} else {
			logger.info("๋ฐ์ดํฐ๊ฐ ์์ต๋๋ค");
		}

	}
```

### ๋ ์ง ํฌ๋ฉง์ ์ด๋ป๊ฒ ๋ํ๋ผ๊น?

ํ์คํธ์ผ์ด์ค๋ ์ ์์ ์ผ๋ก ๋์๊ฐ์ง๋ง ๋ ์งํ์์ด ๋ด๊ฐ ์ํ๋ ๋ฐฉ์์ด ์๋๋ค.
https://okky.kr/article/807824 ์์๋๋ ๋๊ฐ์ ๊ณ ๋ฏผ์ ํ๊ณ  ๊ณ์ ๋ถ์ด ์์๋ค.

![๊ฒฐ๊ณผ1](https://user-images.githubusercontent.com/86590036/148870533-679368f7-655c-4ea6-9c27-9bad5dbaf9f2.jpg)

ํด๊ฒฐ ๋ฐฉ๋ฒ์ 2๊ฐ์ง๊ฐ ์๋ค.

1. SELECT TO_CHAR(start_date, 'YY/MM/DD') FROM TABLE ์ ๊ฐ์ด
   date ํ์์ char ํ์์ผ๋ก ๋ณํํด์ ๊ฐ์ ๊ฐ์ ธ์ค๋ ๋ฐฉ๋ฒ

- ๊ธฐ์กด์ ์๋ DTO ํ์์ String์ผ๋ก ์์ 

2.  Date ํ์์ ์ ์งํ๊ณ  ์ถ๋ค๋ฉด JSTL fmt๋ฅผ ์ฌ์ฉํด๋ ๋๊ณ  ์๋ฐ ๋ก์ง์์ฒด๋ก ํ๋ณํ๋ ๊ฐ์ ๋ทฐ๋ก ๋๊ฒจ์ฃผ๋ ๋ฐฉ๋ฒ

๋๋ 1๋ฒ ๋ฐฉ๋ฒ์ ์ฌ์ฉํด์ ๋ฌธ์ ๋ฅผ ํด๊ฒฐํ๊ธฐ๋ก ํ๊ณ  DTO์ ํ์์ Date์์ String์ผ๋ก ๋ณ๊ฒฝํ์๋ค.

[BoardDTO.java ์์  ์ ]

![์๋ฐdto](https://user-images.githubusercontent.com/86590036/148865706-a706cb62-7052-42d9-bc06-fef79098c8fd.jpg)

[BoardDTO.java ์์  ํ]

![์๋ฐdto string์ผ๋ก ๋ณ๊ฒฝ](https://user-images.githubusercontent.com/86590036/148865705-b9450579-b8db-4bf2-8c3b-dceadb51017f.jpg)

DTO ๋ณ๊ฒฝ์ ๋ฐ๋ผ์ xml๋ ์์ ์ด ํ์ํ๊ณ  Oracle ๋ ์ง ๋ณํ ๋ฌธ๋ฒ ์ค TO_CHAR(reg_date, 'YY/MM/DD')๋ฅผ ์ฌ์ฉํ์๋ค.

[boardMapper.xml ์์ ]

![mybatis-config์์์ ํด๊ฒฐ๋ฐฉ๋ฒ](https://user-images.githubusercontent.com/86590036/148865700-ece08993-e128-4e7f-a561-013feb346817.jpg)

[๋ ์ง ํฌ๋ฉงํ์ ์ํ boardMapper.xml ์์ ]

![mapper์ to char์ถ๊ฐ](https://user-images.githubusercontent.com/86590036/148865697-4e5f43ab-bd2f-44b7-8363-b09dbfc5baf4.jpg)

```xml
<!-- DAO ์๋์์ฑ -->
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

[๋ ์ง ํฌ๋ฉงํ ํ ๊ฒฐ๊ณผ]

![๊ฒฐ๊ณผ2](https://user-images.githubusercontent.com/86590036/148870536-c55ee262-af06-4e3f-b188-f670d43fb62f.jpg)
