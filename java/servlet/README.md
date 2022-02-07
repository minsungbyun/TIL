서블릿은 클래스단위로 url매핑한다.

- Spring의 @Controller, @RequestMapping이랑 같다.
  서블릿은 반드시 HttpServlet을 상속받아야하며 Service()를 오버라이딩해야한다.

서블릿 - lazy-init (지연된 초기화) loadOnStartup 미리 초기화 우선순위
스프링 - early-init

Scope 기본객체
page pageContext
request request
session session
application application

<%=값%> 편하게 할려고 나온것이 EL
<% ~ %> 편하게 할려고 나온것이 JSTL
