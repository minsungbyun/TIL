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
