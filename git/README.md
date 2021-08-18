## git log 확인하기

```git
git log

git log --oneline

git log --oneline -3  // 최근 commit 3개만 본다.

git log --author="minsung" // minsung이 작업한 내용만

git log --grep="project"  // project가 포함된 내용만

git log --oneline --graph --all

// alias.xxx => xxx에 원하는 커스텀 명령어를 지정하면 된다.
git config --global alias.hist "log --graph --all --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(white)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --date=short"
```

## git branch

```
git branch // 내 local

git branch --all // remote까지 다

// switch랑 checkout 둘 중 하나만 알고 있어도 됨

git switch 브랜치명 // 원하는 브랜치로 이동

git switch -C 브랜치명 // 브랜치 생성과 동시에 이동

git checkout // 원하는 브랜치로 이동

git checkout -b 브랜치명 // 브랜치 생성과 동시에 이동

git branch --merged // 현재 브랜치에 merge된 브랜치를 보여줌

git branch --no-merged // 현재 브랜치에 merge되지 않은 브랜치 보여줌

git branch -d 브랜치명 // 로컬에서 삭제
git push origin --delete 브랜치명 // 원격에서도 삭제

git branch --move 이전브랜치명 바뀐브랜치명 // 이름 변경
git push --set-upstream origin 바뀐브랜치명 // 원격에서도 변경

git hist main..test  // main에서 test 브랜치까지 commit내역 보여줌
```
