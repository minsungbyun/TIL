## 내장함수(m:1)

ascll
char / chr
ltrim
rtrim
trim (leading, tailing, both) from
substr
substring
concat
||
length
len
lower
upper

ESCAPE

- LIKE 연산으로 '%' 나 '\_' 가 포함된 문자를 검색하고자 할때 사용된다.
- '%'나 '\_' 앞에 ESCAPE로 특수문자를 지정하면 검색할 수 있다.
- 특수문자는 아무거나 상관없이 사용 가능하다

SELECT _ FROM TEST2 WHERE DEPT*NM LIKE '%@*%' ESCAPE '@';
SELECT _ FROM TEST2 WHERE DEPT*NM LIKE '%#*%' ESCAPE '#';

TOP(SQL SERVER) 상위N명
SELECT TOP [조회할 레코드 수] [컬럼명] FROM [테이블명] WHERE [조건절]

ROWNUM, ORDER BY의 실행순서
ORDER BY 절이 맨 마지막에 실행되기 때문에 순서 주의!!

NULL
산술연산자 = NULL
비교연산자 = UNKNOWN
오름차순 = 맨 마지막 (ORACLE)
오름차순 = 맨 처음 (SQL SERVER)

NVL
NVL2
ISNULL
NULLIF
COALESCE

## 숫자형 함수

SUBSTR("문자열", "시작위치", "길이")
[앞에서부터 문자열을 자르는 방법]
[뒤에서부터 문열을 자르는 방법]

INSTR( [문자열], [찾을 문자 값], [찾기를 시작할 위치(1,-1)], [찾은 결과의 순번(1...n)] )
문자열에서 원하는 문자를 찾을 때 INSTR 함수를 사용
https://gent.tistory.com/22

LPAD("값", "총 문자길이", "채움문자")
ex) 1, 10, 123 -> 00001, 00010, 00123
RPAD("값", "총 문자길이", "채움문자")

replace(컬럼명, '찾을문자', '변환문자')

## 날짜함수

TO_CHAR
TO_DATE

NATURAL JOIN 중복 X
USING 중복 X
