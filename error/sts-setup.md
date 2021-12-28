## 📌 STS설치 오류

---

## 🟣 오류메세지

- 🗸 sts를 설치하고 실행시켰는데 다음과 같은 에러메세지가 나타났습니다.
  ![1번](https://user-images.githubusercontent.com/86590036/147558023-e4572d03-f4ac-4f7c-8bd7-763442668df8.png)

![2번](https://user-images.githubusercontent.com/86590036/147558091-ade7b701-e0ff-45cb-b306-41faf42b8547.png)

- 🗸 또한 우측 하단에 위치하는 Spring Explorer에도 warning 관련 문구가 떴고 대부분 eclipse관련이였습니다.

## 🟣 원인

- 🗸 1. 압축 실패

- 🗸 2. 경로이름이 긴 문제 (윈도우에서는 경로 길이 제한이 있음)

- 🗸 3. 설치 경로에 한글이 들어가 있음

## 🟣 해결책

![알집압축](https://user-images.githubusercontent.com/86590036/147558358-0220f062-6d11-4048-acef-9ad3423609a0.jpg)

![알집압축2](https://user-images.githubusercontent.com/86590036/147558388-a92027ff-f3dc-42b4-a359-facc2c988f71.jpg)

- 해당 문제인가 싶어 폴더명을 줄여보았다.

![11](https://user-images.githubusercontent.com/86590036/147558473-cc2d1fac-fb19-468b-b936-dd6b72af34e6.jpg)

- 그러나 아직도 실패.. 지정된 경로를 찾을 수 없다고 나온다.

![알집압축3 지정된 경로 못찾음](https://user-images.githubusercontent.com/86590036/147558528-8bcfc542-90f2-4b1d-b5d0-e9ef2a1cbdb2.jpg)

- 구글링을 해보니 알집말고 반디집으로 풀라는 의견이 있어서 반디집을 다운받고 풀어봤다.

[반디집 다운로드가 필요하시면 클릭해주세요](https://kr.bandisoft.com/bandizip/)

- 결과는 잘 풀렸다 !!! sts 실행해보니 깔끔하게 잘 나온다.

![good](https://user-images.githubusercontent.com/86590036/147558785-66302935-f15a-4fad-bd08-3407fa47c8d1.jpg)

## 🟣 REFERENCE

https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=dream_time92&logNo=220775119979

https://breakdawn.tistory.com/entry/%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4-%EC%8B%A4%ED%96%89-%EC%97%90%EB%9F%AC

https://commontoday.tistory.com/32
