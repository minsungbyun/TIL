## 링킹(linking)과 라이브러리(library)

function이나 structure, class 등의 코드를 모아둔 파일을 **라이브러리(libary)** 라고 한다.

### 동적 연결 라이브러리(dynamic linking library) vs 정적 연결 라이브러리(static linking library)

![링킹과 라이브러리1](https://user-images.githubusercontent.com/86590036/132627881-6186e52d-d904-4fa6-8227-7b3aeb3c7b2c.jpg)

링킹(linking)은 프로그램에서 호출하는 외부함수가 들어있는 라이브러리를 함께 묶어서 실행 파일을 만드는 것을 말한다.

여기서 중요한 특징이 있는데

.lib은 파일 전체가 실행파일에 포함되며, .dll 파일은 실행파일에 포함되지 않으며 파일정보만 포함된다.

프로그램에서 가리키는 .dll 파일을 메모리에 따로 로딩하며 다른 실행파일이 동일한 .dll을 필요로 하는경우 같이 가리켜서 사용 가능하다. 이를 통해 중복로딩을 막음으로서 메모리를 절약할 수 있다.

반면 \*lib은 중복으로 로딩이 가능하다.

![링킹과 라이브러리2](https://user-images.githubusercontent.com/86590036/132627894-b2d8290c-ba53-4389-9264-cbaeb0e093fc.jpg)

![링킹과 라이브러리3](https://user-images.githubusercontent.com/86590036/132627913-b524f5bc-b03a-4d4c-8c23-b1c5bb1fa62c.jpg)

![링킹과 라이브러리4](https://user-images.githubusercontent.com/86590036/132627929-31e0e9b5-66fb-4b5c-9df4-6193eaf21b2e.jpg)
