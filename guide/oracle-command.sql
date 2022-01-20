

############################### 테이블 , 컬럼, 코멘트 조회 ########################################

-- 테이블 목록 조회 (접속한 계정)
SELECT * FROM tabs;
SELECT * FROM USER_TABLES;

-- 테이블 코멘트 조회
SELECT * FROM USER_TAB_COMMENTS;

-- 컬럼 조회
SELECT * FROM USER_TAB_COLUMNS;

-- 컬럼 코멘트 조회
SELECT * FROM USER_COL_COMMENTS;

--테이블 Comment 설정
COMMENT ON TABLE [테이블명] IS [Comment];

--컬럼 Comment 설정
COMMENT ON COLUMN [테이블명].[컬럼명] IS [Comment];

--테이블 전체 comment 조회
SELECT  table_name, table_type, comments FROM USER_TAB_COMMENTS WHERE comments IS NOT NULL; 

--컬럼 전체 comment 조회
SELECT table_name, column_name, comments FROM USER_COL_COMMENTS WHERE comments IS NOT NULL; 

--테이블 Comment 삭제
COMMENT ON [테이블명] IS '';

--컬럼 Comment 삭제
COMMENT ON COLUMN [테이블명].[컬럼명] IS ''; 


############################### 무결성 조건들 ########################################

-- 제약조건
-- PRIMARY KEY
ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] PRIMARY KEY(컬럼명)
-- FOREIGN KEY
CONSTRAINT [제약조건 명] FOREIGN KEY([컬럼명])
REFERENCES [참조할 테이블 이름]([참조할 컬럼])
[ON DELETE CASCADE | ON DELETE SET NULL]
-- UNIQUE
CONSTRAINT [제약조건 명] UNIQUE([컬럼명])
-- CHECK
ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] [제약조건](범위)


############################### 시퀀스 ########################################

CREATE SEQUENCE [시퀀스명]
INCREMENT BY [증감숫자] -- 증감숫자가 양수면 증가 음수면 감소 디폴트는 1
START WITH [시작숫자] -- 시작숫자의 디폴트값은 증가일때 MINVALUE 감소일때 MAXVALUE
NOMINVALUE OR MINVALUE [최솟값] -- NOMINVALUE : 디폴트값 설정, 증가일때 1, 감소일때 -1028 
                               -- MINVALUE : 최소값 설정, 시작숫자와 작거나 같아야하고 MAXVALUE보다 작아야함
NOMAXVALUE OR MAXVALUE [최대값] -- NOMAXVALUE : 디폴트값 설정, 증가일때 1027, 감소일때 -1
                               -- MAXVALUE : 최대값 설정, 시작숫자와 같거나 커야하고 MINVALUE보다 커야함
CYCLE OR NOCYCLE --CYCLE 설정시 최대값에 도달하면 최소값부터 다시 시작 NOCYCLE 설정시 최대값 생성 시 시퀀스 생성중지
CACHE OR NOCACHE --CACHE 설정시 메모리에 시퀀스 값을 미리 할당하고 NOCACHE 설정시 시퀀스값을 메로리에 할당하지 않음

ALTER SEQUENCE [시퀀스명]
INCREMENT BY [증가값]
NOMINVALUE OR MINVALUE [최솟값] 
NOMAXVALUE OR MAXVALUE [최대값]
CYCLE OR NOCYCLE [사이클 설정 여부]
CACHE OR NOCACHE [캐시 설정 여부]

DROP SEQUENCE [시퀀스명]

SELECT test_seq.CURRVAL from dual;
SELECT test_seq.NEXTVAL from dual;

@ NEXTVAL, CURRVAL 사용 가능

-   SELECT 문 
 -  INSERT문의 SELECT절, VALUE절
 -  UPDATE 문 SET 절

@ NEXTVAL, CURRVAL 사용 불가능

 -  VIEW의 SELECT절
 -  SELECT문의 DISTINCT 키워드
 -  SELECT문의 GROUP BY, HAVING, ORDER BY 절
 -  SELECT, DELETE, UPDATE문의 서브 쿼리
 -  CREATE TABLE, ALTER TABLE의 DEFAULT 

## 시퀀스 조회

SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_NAME';
SELECT LAST_NUMBER FROM USER_SEQUENCES;

## NEXTVAL 초기화

1. 시퀀스의 현재 값을 확인합니다.

-- SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = '시퀀스 명';
SELECT [시퀀스명].CURRVAL FROM DUAL;

2. 시퀀스의 INCREMENT 를 현재 값만큼 빼도록 설정합니다. (현재값이 155인 경우)

ALTER SEQUENCE 시퀀스명 INCREMENT BY -155;

3. 시퀀스의 NEXTVAL값을 조회합니다. (NEXTVAL = 0)

SELECT 시퀀스명.NEXTVAL FROM DUAL;

4. 시퀀스의 INCREMENT 를 1로 설정 합니다.

ALTER SEQUENCE 시퀀스명 INCREMENT BY 1;

############################### IDENTITY ########################################

## Oracle 12c 버전부터는IDENTITY 사용 가능

generated always as IDENTITY

## IDENTITY 초기화

ALTER TABLE test MODIFY(id GENERATED AS IDENTITY (START WITH 1));​

