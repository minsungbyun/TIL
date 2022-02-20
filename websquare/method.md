참고문서
Common_API_Docs > index.html > com

기본 셋팅은 onpageload에서 한다.

com.sendPostData()
com.sendAjax()

- setDisabled(true)
- com.setDisableAccordion()

scwin.param = com.getParameter();
scwin.param.function등으로 사용

1. com.selectCommonCode("XX001","Default","ds_XX001","null, "DataCollection명\_id")
2. com.selectCommonCode("XX001","Default","ds_XX001")

------------------<button 관련>-----------------------
버튼 클릭 시 sweetAlert 경고창 띄우기 (파라미터 4개)
com.sweetAlert("alert","알림메세지","메세지내용", function() {})
com.sweetAlert("confirm","확인메세지","메세지내용", function() {})
3번째 파라미터 = ex) 메세지내용, com.getCmmnMessage(500,"데이터")
4번째 파라미터 = ex) "", null, function(isReturnValue), function(result)
\*\* 5번째, 6번째는 있는 것도 있고 없는 것도 있다.
5번째 파라미터 = true
6번째 파라미터 = ""

------------------<style 관련>-----------------------
xxx.setStyle("display","")
xxx.setStyle("display","none")
xxx.getStyle()

------------------<popup 관련>-----------------------
버튼 클릭 시 popup 닫기

com.openPopup(com.parseUrl(""),{} , {})
com.openPopup(com.parseUrl("팝업띄울xml"),
{id : "팝업띄울xml파일", popupName: "팝업이름", modal: true, width: xx, height: xx} , {callbackFn: ""})

-- 팝업 창 xml script에서 설정
com.closePopup();
