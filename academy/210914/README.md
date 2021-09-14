interface >> able ~할 수 있는  출력하는 것을 허락한다.

BufferedOutput BufferedInput 데코레이터 추가
private static final long serialVersionUID = 1280L; 시리얼 값 직렬화 도메인에 적용한다.
필드가 바뀌더라도 시리얼 uid가 같으면 기존 데이터를 읽을 수 있다.

오리지널 데이터를 설명하는 데이터 = meta data = tag = markup(출판용어) = element(기술용어)

이기종 = 다른 기기 종류 (ex Java App <--> C App / Windows <--> Linux)
표준 포맷으로 만든 바이너리 파일은 이기종간 교환 가능

자바 시리얼 데이터는 표준 포맷이 아니기 때문에 이기종 언어 호환이 되지 않는다.

텍스트 형식은 이기종간 읽고 쓸 수 있다.
바이너리 형식으로 출력한 것은 해당 포맷을 알지 못하면 읽고 쓸 수가 없다.

MIME (Multi-purpose Internet Mail Extensions) 타입
- 인터넷상에서 데이터를 보내고 받을 떄 어떤 형식의 데이터인지 알려주는 이름
국제적으로 표준 포맷이 정의되어 있다.
- 지금은 웹 상에서 데이터를 주고 받을때도 사용한다.