## gradle 설치
___
- gradle.org로 들어가서 설치를 진행합니다.

- 저는 C:\tools 에 설치하였습니다.




## 윈도우 환경변수 설정
___
>시스템 환경 변수 편집 > 고급 > 환경 변수 > 시스템변수

- Path에 gradle 설치한 경로를 넣습니다

- C:\tools\gradle-7.1.1\bin 






## gradle 생성하기
___

```
gradle init
```

- cmd에 들어가 자신이 원하는 폴더에 들어갑니다.

    - 저는 test 파일을 생성 후 명령어를 입력하였습니다.







## gradle 명령어 보기
___
```
gradle tasks --all
```

- 해당 명령어를 입력하면 gradle 명령어를 볼 수 있습니다.






## gradle 실행시키기
___
```
gradle -q run
```


- 해당 파일의 Java파일을 실행합니다.






## gradle 빌드하기
___



```
gradle build
```

- 배포를 할 수 있게 하는 명령어입니다.






## gradle clean
___
```
gradle clean
```


- build 파일을 삭제합니다.






## 이클립스 import 준비
___


- 이클립스에 import 하는 법

    - .project

    - .classpath

    - .settings




```
plugins {



    id 'application'

    id 'eclipse'

}



repositories {

    

    dependencies.

    mavenCentral()

}



dependencies {

   

    testImplementation 'junit:junit:4.13.2'



   

    implementation 'com.google.guava:guava:30.1-jre'

}



application {

   

    mainClass = 'test.App'

}
```


- build.gradle에 들어가서 plugin의 id에 `'eclipse'`를 추가해줍니다.






