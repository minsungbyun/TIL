## 📌 Uncaught ReferenceError : resources is not defined

---

## 🟣 오류메세지

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'dataSource' defined in file xxx: BeanPostProcessor before instantiation of bean failed; xxxFailed to introspect Class [org.springframework.aop.aspectj.AspectJExpressionPointcut] from ClassLoader [ParallelWebappClassLoader

![에러내용](https://user-images.githubusercontent.com/86590036/149251086-7e078961-2318-4546-8338-ae6d5ec97c1c.jpg)

## 🟣 원인

- 트랜잭션 설정 과정 중 pom.xml의 aspectJ의 설정 문제

## 🟣 해결책

- aspetj의 artifactId를 변경한다. (asepctjrt > aspectweaver)

[pom.xml 수정 전]

![pom xml 파일](https://user-images.githubusercontent.com/86590036/149251079-d1027525-9451-442a-b21e-db17c96d678f.jpg)

[pom.xml 수정 후]

![pom xml 파일변경 후](https://user-images.githubusercontent.com/86590036/149251080-9d70cddc-cd95-4a9a-9148-99667f4f64ec.jpg)

[pom.xml 수정 후 메이븐 update]

![적용](https://user-images.githubusercontent.com/86590036/149251088-d3e857f3-c380-4347-9ab9-4f8452208467.jpg)

[tx-context.xml]

![tx-context xml 파일](https://user-images.githubusercontent.com/86590036/149251085-f43e2cb3-ba31-4efd-983a-5ea42568d2b3.jpg)

[해결완료]

![해결완료](https://user-images.githubusercontent.com/86590036/149251091-61a1285e-7ca5-4728-910a-7910591382ca.jpg)
