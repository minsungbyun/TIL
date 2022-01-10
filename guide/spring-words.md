##################################################################################
RedirectAttributes

addAttribute() vs addFlashAttribute()

- rttr.addAttribute로 전달한 값은 url뒤에 붙으며, 리프레시해도 데이터가 유지된다
- rttr.addFlashAttribute로 전달한 값은 url뒤에 붙지 않는다.
  일회성이라 리프레시할 경우 데이터가 소멸한다. 또한 2개이상 쓸 경우, 데이터는 소멸한다. 따라서 맵을 이용하여 한번에 값 전달해야한다.

##################################################################################

@ModelAttribute 선언 후 자동으로 진행되는 작업들은 다음과 같다.

① @ModelAttribute 어노테이션이 붙은 객체를 자동으로 생성한다.
이때 @ModelAttribute가 지정되는 클래스는 빈 클래스라야 한다.
그리고 getter와 setter가 명명 규칙에 맞게 만들어져 있어야 한다.

② 생성된 오브젝트에 HTTP로 넘어 온 값들을 자동으로 바인딩한다.

       위의 코드의 경우는 name=Gildong&age=25seq=327 이렇게 들어오는
       name, age, seq의 값이 MemberInfo의 해당 변수의 setter를 통해서
       해당 멤버 변수에로 binding된다.

③ @ModelAttribute 어노테이션이 붙은 객체가
자동으로 Model 객체에 추가되고 따라서 MemberInfo 객체가 .jsp 뷰단까지 전달이 된다.
