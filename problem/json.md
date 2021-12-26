제이슨 데이터를 자바스크립트에서 배열로 받을 때 

- 데이터를 받아와서 반복문을 돌려 테이블에 넣고 싶다.
- for문 돌려서 row에다가 cell을 집어넣으려고 함
- insertRow(), insertCell()
- 배열을 어떻게 읽어야 할 지 모르겠다.

서버에 있는 제이슨 데이터를 받아온다.
JSON.parse(request.responseText);

해당 길이를 출력해봤는데 undefined가 떳음
var test = JSON.parse(request.responseText);
console.log(test);
> undefined

해결책으로 Object.keys(), Object.values(), Object.entries()이 있다는 것을 발견

const count = Object.keys(obj).length; 했는데.. 배열 길이가 1로 나온다 계속..
{data: Array(3)} ==> length : 1 
나는 안에있는 3개의 데이터 즉 length 3을 원하고 반복문을 돌려 꺼내길 원함

var ex_obj = { 'a' : '1st', 'b' : '2nd', 'c' : '3rd', 'd' : '4th' };
console.log("ex_obj의 길이 = "+Object.keys(ex_obj).length);
이렇게 하면 4개가 나온다 뭐가 문제일까 JSON.parse()하면서 문제가 발생한거 같긴하다.
서버에서는 잘 나오는 데이터가 자바스크립트에서는 왜 안되지?

다시해보니 Object.keys(obj).length로 했을 땐 1, JSON.parse(request.responseText).배열대표이름.length하니까 길이는 재대로 나왔다.





