## Error01 : git

[git 협업 시 발생하는 충돌]

- 2명이 동시에 같은 공간에서 작업한다면?
- 1명이 push 후 나머지 1명은 git commit 까지 진행 후 git pull 하고 겹치는 부분을 지우고 최종적으로 push한다.

```
git add .
git commit -m "commit message"

git pull
```

## Error02 : eclipse

[Eclipse import]

workspace가 겹칠 때 해결 방법

에러메세지를 확인해보면 된다.

사용자 홈 디렉토리에 있는 eclipse workspace에 있는 import 하고자하는 폴더를 삭제한다.
해당폴더가 중복되어서 import가 되지 않은 것이다.

## Error03 : java

[객체 생성 순서에 따른 에러]

생성자로 해당 클래스의 주소를 주입할 때 객체를 선언한 순서가 중요하다. 순서를 반대로 하면 에러가 발생한다.

if ~ else 문을 처리할 때도 순서에 따라 실행결과가 달라질 수 있다.

## Error04 : java

[객체 이동 시 new를 여러 번 사용한 경우]
