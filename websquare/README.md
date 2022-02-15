## WebSquare5

[웹스퀘어5 SP4 개발 가이드.pdf](https://github.com/minsungbyun/happy-share/files/8008187/5.SP4.pdf)
[웹스퀘어5 스니핏 가이드.pdf](https://github.com/minsungbyun/happy-share/files/8008190/5.pdf)
[웹스퀘어5 심화 가이드.pdf](https://github.com/minsungbyun/happy-share/files/8008191/5.pdf)
[웹스퀘어5 웹 접근성 가이드.pdf](https://github.com/minsungbyun/happy-share/files/8008192/5.pdf)
[WRM Release Note.pdf](https://github.com/minsungbyun/happy-share/files/8053657/WRM.Release.Note.pdf)


DataCollection 
- DataList(다수건)
- DataMap(단건)
자식에서 부모의 데이터를 바라볼 수 있다.
부모에서 자식의 데이터를 못 바라본다.

f1 - help(속성, 이벤트, API)

이벤트 적용하는 방법
1. Property > 이벤트 탭 > 원하는 이벤트 선택 후 script 버튼 누르기
2. Design > Component 우클릭 > 이벤트

debugger; 

Component id는 자동으로 전역변수로 쓸 수 있다. 
document.getElementById("ipt1"); 쓸 수 있지만 ipt1 전역변수로 바로 사용하면 된다.

실행과정
1. script에 있는 function, event 생성
2. design component 그리기
3. 속성부여
4. script에 있는 onpageload 수행

> 최초로 등록할 것 있으면 onpageload에 작성하라 

보통 퍼블리셔가 css파일 만들어서 import해서 사용한다.

Outline의 Head탭의 활용도가 높다.
js, css import

화면보면서 dataCollection 넣고 싶을 때 Outline의 Head탭에서 dataCollection 추가한다.

textBox,span - 내용 넣을 때 사용한다.
progressbar - 편집은 안되고 보여주기만 가능하다.
multiSelect - 다중선택 (모바일, 태블릿에서는 사용불가)

응용/심화 샘플
- <페이지 구현> 1번 CRUD 다 되어 있어서 초보자들이 참고하기 좋다
- <기능> 17번 캘린더 관련
- <기능> 13번 아코디언 관련

button 따로 없고 trigger가 기본이다.
버튼처럼 생겼지만 input에 자체 css입힌것이라고 생각하면 된다.
image, button, anchor(<a>와 유사하다.)

<파일 업로드 관련>
C:WRM/RESOURCE/webSquare_home/license
C:WRM/RESOURCE/webSquare_home/config/webSquare.xml - 파일관련설정

multiupload - html5_transparent 설정 필수 (default - flash)

Group - 자식 객체를 갖는 컴포넌트 (html <table> <div>와 비슷)
Generator - 반복 노드 표현

Iframe 사용하지 않는다. 대신 Wframe 사용하는데 jsp include개념이다. 이를 사용하였을 시 문제점은 부모 자식간의 아이디 충돌문제가 이있다.
Wframe은 이를 내부적으로 개선하여 아이디가 중복되지 않게 한다.

<static, absoute>
static을 자주 쓴다. - 너비, 높이는 조정가능하지만 위치는 이동하지 못한다, 렌더링 순서 꼬이지 않는다.
absoute는 편하긴 하지만 웹 실행 관점에서 보면 올바르지 못하다. 위치 마음대로 옮길 수 있다. (왼쪽 > 오른쪽, 위 > 아래 렌더링이여야 올바르다.)

table 만들때 tablelayout사용한다.
부모선택 f2 or ctrl + p

유사한 패턴 그리는 것은 snippets 설정
스니핏을 사용하지, 처음부터 다 그리지는 않는다.

목록성 컴포넌트 - 클릭해서 설정 바꿀 수 있다.
selectbox - choose option(선택 시 빈값 넘어간다)
radio - addItem()
1. 하드코딩
2. script 탭에서 api추가 (인덱스를 생략하면 자동으로 0부터 들어간다)
3. db에서 데이터 binding
> 3번을 가장 많이 사용한다.
DataList와 연계를 가장 많이 쓴다.
하드코딩하거나 addItem으로 추가하기보다는 DB에서 데이터를 받아오는 경우가 많다.
> dataMap, dataList로 받아와서 component와 연동시킨다.

웹브라우저에서 보는 법 
> 크롬에서 ctrl + 마우스우클릭 > dataCollection보기

**Submission**

reference - request
target - response
url action - 서블릿 주소
process message - submission 수행 시 disable
> 실행되고 있는 화면 disable / 조회하는 동안 다른 작업 못하게한다.

submit - 전처리함수
submitdone - callback 함수 후처리
submiterror - 통신에러(예외처리)

submissionId는 전역변수로 등록되지 않는다. 그래서 $p를 써야한다.
$p.executeSubmission("submissionId") 나머지 파라미터는 하위호환성으로 남겨둬서 안써도 된다.
ex) $p.executeSubmission("btn_search")

조회 시 실행되는 값을 보려면 ctrl + 우클릭으로 "현재화면 디버그 실행"을 누르면 "현재 화면 디버그 중단"이라고 뜬다. 그 이후 조회 버튼을 누르면 데이터가 넘어가는 것을 볼 수 있다.
디버그 창은 더블클릭하거나 확인 버튼을 누르면 꺼지니 조심하자

1. 잘설정했는데 값이 넘어오지 않는다면 기본값을 확인해보자
> submission reference를 클릭하고 property에서 defaultValue를 설정해준다.

2. script api를 사용한다.
dataCollection 결과값을 화면 상의 component와 연동시킨다.
Outline > Head > response keyinfo를 Design의 component에 드래그앤드롭 > 매핑됨 > refresh > 조회 누르면 적용됨

DataCollection의 id[request(reference), response(target)]는 servlet에 있는 key값 그대로 쓴다.

만약 id를 바꾼다면 sevlet에 매핑된 key값이랑 다르니까 당연히 값이 나오지 않는다.
그렇다면 servlet을 건들지 않고 화면단에서 id를 바꿀 수 있는 방법은 없을까?
id를 변경한 후 테스트에서 key값에 servlet key값을 적어준다.

타입변경
DataList > DataMap
DataMap > DataList

* DataMap, DataList의 dialog에 excel표 값을 ctrl + v하면 자동으로 다 들어가며, 메모장에 있는 내용을 복사해도 들어간다.

* Submission > DataCollection > Single Mode 누르면 id 없이 날라간다.

* Submission의 id는 전역변수로 올라가지 않는다.

<기본 값 설정>

1. defalutValue > submission 수행 시 기본 값
2. script > dc_reqUserInfo.set("EMP_CD","1000001");

<결과 data를 component와 연결하기>
response된 dataMap(dataList)의 key와 component를 binding한다.(완료되면 component의 좌측상단에 초록색 네모가 뜬다)

1. 단건 데이터는 dataMap, 대량 데이터는 dataList
> id 설정하고 key설정 (db컬럼)
2. URL Action은 java주소 매핑
3. reference , target 등록
4. submission test에서 request data의 SampleValue_0을 변경해서 send로 response 잘 나오는지 확인
5. script의 submit등록해서 기본값 세팅해본다. 확인되어서 동적으로 바인딩하려면 해당 코드는 주석으로 막는다.
ex) dc_reqCode.set("GRP_CD","02");
6. submission을 실행시켜야하는데 어디서 실행시킬꺼냐? (버튼 클릭할 때, 페이지 로드될 때등) 
$p.executeSubmission("sub_search"); 적고 웹페이지 띄워서 ctrl + 우클릭 > 현재화면 디버그로 본다.
7. refresh하는데 만약 onpageload에 $p를 설정했을경우 현재화면 디버그 > f5누르지 말고 ctrl + 우클릭 > 새로고침을 클릭한다.

이거 다 언제하냐 공통코드 할 경우 한번에 하자

공통코드 바인딩 된 것(해당 컴포넌트 더블클릭) 날린다. bindingItemSet체크 푼다.
js/eduCommon.js > setCommonCode검색 (목록 컴포넌트 제목을 db데이터로 가져올 때 일괄처리 할 수 있다.)

현재 화면에서 필요한것은 submission 직접 만들어서 한다.
공통함수 만들 때는 한번에 그렇지 않은 경우에는 동적으로 한다.

1. submission
2. 공통코드 조회
3. 데이터 객체, 통신 객체 관리

gridview는 높이를 준다.
gridview는 전체속성과 개별속성 따로있다. 
우선순위는 컬럼 > 그리드
이벤트는 전체만 가진다. api도

*dataCollection과 gridview를 연결시킨다.
dataCollection을 드래그 앤 드롭 시켜서 gridview에 놓는다.
신규생성을 누르면 dataList 기준으로 안그린 부분 그린다.

gridview속성
autofit - 남는 공간 없이 표현할 때
autoFitMinWidth - 특정 픽셀 이하로 떨어질 때 잘리지 않게
columnMove - 칼럼 위치 바꿀 수 있다.
sortable - 정렬여부 (더블클리갛면)
rowNumVisible - 숫자카운팅
rowStatusVisible - 상태값 표시 (변동 있을 때)
inputType - gridview 내용에 들어 갈 type 설정 (select, calendar)
viewType - 해당 inputType이 보일건지 아닌지

컬럼별로 어떻게 이벤트를 제어하나요?
> col,row로 하면 해당 컬림이 바뀔때마다 코드를 바꿔줘야해서 유지보수에 좋지않다. 그래서 colId를 사용하면 좋다.

1. 이벤트 파라미터에 colId가 있는 경우
> colId를 사용해서 조건으로 해결한다.
2. 이벤트 파라미터에 colId가 없는 경우
> ex) var colId = ui_memberList.getColumnID(col);로 colId구해서 사용한다.

detail 정보 매핑하기

사용하고 있는 dataList가 gridview와 매핑되어있죠? 얘는 다수의 건을 처리해야하기 때문에 gridview로 표현해야합니다.

하지만 밑의 detail 데이터는 1건만 표시하죠? 그러면 dataList를 연결시킬 수 없다 말이죠

하지만 master(부모)쪽이 gridview이면 가능해요. gridview는 무엇을 가지고 있죠? 클릭할 때 마다 focus 되어있는 rowindex를 갖죠. focus index기준으로 그 값하고 연결시킬 수 있어요.
> 부모가 gridview면 직접 바인딩 가능하다

하지만 master가 gridview가 아니면 안된다. 테이블만 있을 때는 dataList와 직접 바인딩이 안된다.

gridview api는 dataList api와 뗼레야 뗼 수 없다. 거의 같이 사용한다.
data crud관련된 것은 dataList가 가지고 있다.

gridview가 가지고 있는 focus index를 구할 수 있다.

delete vs remove (상태만 변경 vs 실제 데이터 삭제)
삭제된 데이터를 obj에 담을 수 있다.
다중삭제도 가능하다.

엑셀과 관련된 api는 gridview에 있다.
option은 json형태로 많이 제공한다.



<파일 업로드 관ㄹ
