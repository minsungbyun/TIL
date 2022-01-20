1. Mapper 파일에 namespace 클래스명을 소문자로 적었다.
   ex) com.oneday.bms.board.boardDAO > com.oneday.bms.board.BoardDAO

function 철자 실수
jquery 선택자 표시 안하고 바로 아이디 적음
controller 고치고 왜 계속 안되나 싶었는데 서버 다시 껏다가 안켰다

문자열 들어온거 비교하는데 ==를 쓰는 바보가 있다? 그게나야
어쩐지 전부다 맞는데 안된다 했다 휴

페이징 처리 할 떄 mapper query에서 시작과 끝 조건을 걸어주지 않았다. startList endList를 써야하는데 왜 startPage endPage를 쓰냐
mapper에서 parameterType 선언할때 패키지명을 포함하지 않았다.

페이징 forEach문에서 begin < 0 이라는 에러가 떳는데 아무리 해결해봐도 계속 에러가 떳다.
logger로 찍어봤는데 값은 잘 넘어왔는데 왜 에러가 발생하지?
알고보니까 Pagination.java에서 변수 할당을 해주지 않았다. 실컷 계산식 다 써놓고 결과값을 필드에 할당을 안해주니까 당연히 값이 안넘어오지
물론 view에서 forEach문의 코드 문제는 없었다.
하필 Pagination만 빼고 controller, service, dao, mapper, query를 다 살펴봤는데 저기서 에러가 나다니...
또한 페이징 처리하는 javascript에서 page와 range를 구하는 공식을 잘못 계산하였다.
