1. CASE WHEN THEN ELSE
2. DECODE
3. TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
4. NVL2
5. 'SYSTEM'

NUMERIC
VARCHAR

집계함수

- SUM, AVG, COUNT, MAX, MIN

GROUP BY vs PARTITION BY
공통점: 데이터를 그룹화한다.
차이점: PARTITION BY를 사용하면, GROUP BY와는 달리 기존 행의 세세한 정보들은 사라지지 않고
그대로 유지됩니다. 즉, 기존의 데이터와 집계된 값을 함께 나란히 볼 수 있다는 이야기입니다.
GROUP BY는 이전의 기존 데이터가 하나로 합쳐지는 바람에 같이 볼 수 없었던 점, 기억하시죠?
이것이 GROUP BY와 PARTITION BY의 차이점입니다

PARTITION BY - 어떤 컬럼을 기준으로 행을 집계할지?

일반적인 집계 함수를 OVER 와 함께 윈도우 함수로 사용하면 기존 데이터를 그대로 유지한 채 새로운 집계 값을 구할 수 있습니다.

집계함수 vs 윈도우 함수

- GROUP BY로 그룹핑된 컬럼에 대해서 HAVING 조건절을 사용할 경우 집계된 컬럼으로 조건 사용가능하다.
  이런경우 HAVING절에 집계함수가 없어도 된다.
- GROUP BY 표현식이 아닌 값은 기술될 수 없다.
- HAVING에는 집계함수 사용가능 그리고 GROUP BY의 컬럼

NULL이 포함된 연산의 결과는 NULL이다.
NULL은 0과 ""와는 다르다.
NULL + 사칙연산 = NULL
NULL이 포함된 컬럼의 AVG(컬럼)에서 NULL은 연산에서 제외된다.
COUNT(\*) - NULL 포함 개수
COUNT(컬럼) - NULL 제외 개수
분모가 0이 들어가는 경우 연산 자체가 에러를 발생시킨다.

https://kimsyoung.tistory.com/entry/GROUP-BY-vs-PARTITION-BY-%EC%9C%A0%EC%82%AC%EC%A0%90%EA%B3%BC-%EC%B0%A8%EC%9D%B4%EC%A0%90

실수한 부분
WHERE 조건절 + NOT 위치 햇갈렸음

SELECT _ FROM TABLE WHERE user_id NOT IN ('user1','user2'); (x)
SELECT _ FROM TABLE WHERE NOT user_id IN ('user1','user2'); (o)
=> WHERE AND

IN, EXIST의 쿼리 접근법은 다르다.

IN - WHERE절 뒤의 서브쿼리부터 접근한다.
EXIST - 하나의 행에 접근해서 WHERE절 뒤의 서브쿼리에 결과가 존재하는지 확인

NOT IN => != AND

SELECT LISTAGG(name, ',') WITHIN GROUP(ORDER BY name) name
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');

DML 문장을 제외하고는 COMMIT, ROLLBACK의 사용이 무의미하다.
DML 문장을 제외한 나머지는 문장이 실행됨과 동시에 COMMIT 된 상태와 같다.
UPDATE문에서 이렇게도 가능하다.

update employees
set (job_id, salary) = (select job_id, salary
from employees
where employee_id = 205)
where employee_id = 115;

DML 문장은 서브 쿼리를 사용하여 다른 테이블의 데이터들도 이용할 수 있다.
하지만 원래 존재하던 테이블에 대해서 DML 작업을 하는 것은 많은 제약 조건들 때문에 에러를 발생시키는 경우가 많

LONG 타입 컬럼은 서브쿼리를 사용하여 테이블을 생성할 때 복사되지 않는다.
LONG 타입 컬럼은 GROUPY BY나 ORDER BY절에 포함될 수 없다.
LONG 타입 컬럼에는 제약조건이 정의하지 못한다.
LONG 타입 컬럼에는 제약조건이 정의하지 못한다.

CHAR 타입은 고정된 데이터 길이를 가지고 컬럼에만 지정하는 것을 추천한다.
길이가 짧은 쪽을 긴 쪽과 길이를 맞추어 비교
하지만 CHAR와 VARCHAR2형과 비교하는 경우에는 예외다.

TRUNC("값","옵션") - 소수점, 날짜의 시간을 없앨 때 사용한다.
