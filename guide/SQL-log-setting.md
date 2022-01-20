## 콘솔창에 현재 실행되는 SQL 문장이 출력 되도록 설정 하는 방법

1. [pom.xml] 추가
   https://mvnrepository.com/artifact/org.bgee.log4jdbc-log4j2/log4jdbc-log4j2-jdbc4.1/1.16

```
 	<!-- https://mvnrepository.com/artifact/org.bgee.log4jdbc-log4j2/log4jdbc-log4j2-jdbc4 -->

	<dependency>
	    <groupId>org.bgee.log4jdbc-log4j2</groupId>
	    <artifactId>log4jdbc-log4j2-jdbc4</artifactId>
	    <version>1.16</version>
	</dependency>

```

2. [dataSource-context.xml] 데이터베이스 접속 설정이 들어 있는 설정파일 수정

```
<!--dataSource 객체 설정 -->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
	<!--  	<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" />-->  //기존
   	  <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />   //변경
	<!-- 	<property name="url" value="jdbc:oracle:thin:@localhost:1521/XE" /> -->           //기존
		<property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521/XE" />          //변경
		<property name="username" value="c##id"></property>
		<property name="password" value="password"></property>
	</bean>

```

3. [log4jdbc.log4j2.properties] 추가

```
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator

```

4. [log4j.xml] 추가
   자세한 설명은 https://freehoon.tistory.com/113 참고

```
<!-- SQL Logger -->
	<logger name="jdbc.sqltiming" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/>
	</logger>

	<logger name="jdbc.sqlonly" additivity="false">
		<level value="info"/>
		<appender-ref ref="console"/>
	</logger>

	<logger name="jdbc.audit" additivity="false">
		<level value="warn"/>
		<appender-ref ref="console"/>
	</logger>

	<logger name="jdbc.resultset" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/>
	</logger>

	<logger name="jdbc.resultsettable" additivity="false">
		<level value="info"/>
		<appender-ref ref="console"/>
	</logger>
```
