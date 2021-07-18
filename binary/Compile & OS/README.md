## 기계어와 OS

> 혹시 당신의 소스파일이 다른 데스크탑이나 노트북에서 열리지 않은 경우가 있나요?
> 그렇다면 2가지를 고려해볼 필요가 있습니다.

- OS의 일치여부
  - 각 OS(Windows, Mac OS, Linux)에 따라 기계어 배치방법이 다르다.
- CPU의 일치여부
  - CPU마다 기계어에 대한 규칙이 다르다.
  - 호환이 되는 CPU는 잘 동작한다.

### 📌 OS는 다르고 CPU는 같은경우는?

![01_os는 다르고 cpu는 같은경우1](https://user-images.githubusercontent.com/86590036/126062076-02861aec-2157-48e3-9d13-f78c7554a030.jpg)

- 소스파일은 각 OS에 맞는 컴파일러를 통해 컴파일된다.

![02_os는 다르고 cpu는 같은경우1](https://user-images.githubusercontent.com/86590036/126062089-8fb270ec-37ac-4144-b1d5-9185190b8c0f.jpg)

- Windows용 컴파일러로 컴파일 하였기 때문에 다른 OS에서 열 수 없다.
- CPU가 같아도 이미 OS에서부터 접근이 막혀버리기 때문이다.

### 📌 OS는 같고 CPU가 다른경우는?

![03_os는 같고 cpu는 다른경우1](https://user-images.githubusercontent.com/86590036/126062111-ee61a353-9466-484e-8b05-0c0907fe34a3.jpg)

- 같은 Windows 컴파일러를 통해 컴파일 하였다면 OS까지는 괜찮으나 CPU의 호환여부에 따라 실행될 수도 안 될수도 있다.
- 만약 CPU 제조사들끼리 동일한 규칙을 적용(호환)했다면 실행가능하다.
