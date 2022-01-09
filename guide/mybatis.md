## Mybatis pk키를 다시 재활용해서 사용하고 싶을 때

오라클은 AUTO_INCREMENT가 없고 Sequence에서 값을 가져와서 Insert를 해줘야 하기 때문에 아래와 같이 한다.
(Mysql인 경우 useGeneratedKeys="true" keyColumn="[DB칼럼]" keyProperty="[자바DTO]")

<selectKey keyProperty="id" resultClass="int">
  SELECT SEQ_ID.nextval From DUAL
</selectKey>

## DAO와 Mybatis .xml파일의 연결방법

1. @ComponentScan 사용

- Repository구현 클래스에서 mapper의 namespace를 사용하여 연결하는 방식으로 interface, class, mapper 3가지를 모두 구현해줘야 한다.

2. @MapperScan 사용

- @MapperScan 방식은 이번에 새롭게 알게 된 방식으로 기존의 @ComponentScan에서 필요했던 interface 구현 클래스를 필요로 하지 않는다.
- Repository interface와 mapper만으로 DB에 접근하여 기존에 하던 동작을 그대로 수행할 수 있기 때문에 하나의 Repository에 대해 파일 하나가 줄어드게 된다.

@ComponentScan과 다른점은?

- @ComponentScan대신에 @MapperScan을 등록해줬다는 것이다.
- 기존의 interface구현 클래스에 있던 어노테이션이 interface에 @Mapper로 새롭게 추가되었다는 것이다.
- namespace에 mapper를 지칭하는 이름이 들어가는 대신에 매핑될 interface가 들어갔다는 것이다.
- 매핑될 interface와 mapper는 interface의 메서드 이름과 mapper의 id값을 일치시켜 원하는 작업을 수행하도록 해주는 방식이다.

< 자동스캔을 사용하는데는 3가지 방법 >
참고 : https://mybatis.org/spring/ko/mappers.html

- <mybatis:scan/> 엘리먼트 사용
- @MapperScan 애노테이션 사용
- 스프링 XML파일을 사용해서 MapperScannerConfigurer를 등록

## REFERENCE

https://jforj.tistory.com/75 (마이바티스, 스프링 설명 괜찮다.)
