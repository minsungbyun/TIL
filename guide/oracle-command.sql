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



