## ๐ Uncaught ReferenceError : resources is not defined

---

## ๐ฃ ์ค๋ฅ๋ฉ์ธ์ง

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'dataSource' defined in file xxx: BeanPostProcessor before instantiation of bean failed; xxxFailed to introspect Class [org.springframework.aop.aspectj.AspectJExpressionPointcut] from ClassLoader [ParallelWebappClassLoader

![์๋ฌ๋ด์ฉ](https://user-images.githubusercontent.com/86590036/149251086-7e078961-2318-4546-8338-ae6d5ec97c1c.jpg)

## ๐ฃ ์์ธ

- ํธ๋์ญ์ ์ค์  ๊ณผ์  ์ค pom.xml์ aspectJ์ ์ค์  ๋ฌธ์ 

## ๐ฃ ํด๊ฒฐ์ฑ

- aspetj์ artifactId๋ฅผ ๋ณ๊ฒฝํ๋ค. (asepctjrt > aspectweaver)

[pom.xml ์์  ์ ]

![pom xml ํ์ผ](https://user-images.githubusercontent.com/86590036/149251079-d1027525-9451-442a-b21e-db17c96d678f.jpg)

[pom.xml ์์  ํ]

![pom xml ํ์ผ๋ณ๊ฒฝ ํ](https://user-images.githubusercontent.com/86590036/149251080-9d70cddc-cd95-4a9a-9148-99667f4f64ec.jpg)

[pom.xml ์์  ํ ๋ฉ์ด๋ธ update]

![์ ์ฉ](https://user-images.githubusercontent.com/86590036/149251088-d3e857f3-c380-4347-9ab9-4f8452208467.jpg)

[tx-context.xml]

![tx-context xml ํ์ผ](https://user-images.githubusercontent.com/86590036/149251085-f43e2cb3-ba31-4efd-983a-5ea42568d2b3.jpg)

[ํด๊ฒฐ์๋ฃ]

![ํด๊ฒฐ์๋ฃ](https://user-images.githubusercontent.com/86590036/149251091-61a1285e-7ca5-4728-910a-7910591382ca.jpg)
