## 오라클 관련 가이드

- 오라클 DB download

1. https://www.oracle.com/
2. Products > Oracle Database
3. Download Oracle Database 19c
4. Windows zip

- 오라클 SQL Developer download

1. https://www.oracle.com/downloads/
2. Developer Tools
3. SQL Developer
4. Windows zip

- sqlplus 접속 및 사용자 생성

1. cmd > sqlplus
2. sys /as sysdba 접속
3. 유저생성
   CREATE USER c##id IDENTIFIED BY password;
4. 권한주기
   GRANT connect, resource, dba TO c##id;
5. 연결확인
   CONNECT c##id/password;
   SHOW USER;

- 오라클 tnsnames.ora 위치
  C:\app\minsung\product\18.0.0\dbhomeXE\network\admin

- 샘플 데이터
  https://www.oracletutorial.com/getting-started/oracle-sample-database/

- oracle maven dependency 설정
  https://hanhyx.tistory.com/43
