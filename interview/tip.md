CS는 보통 질문하면 기본적인 개념 숙지도 안된분들 많아서 일단 기본적인 개념부터 잘정리해서 말씀하시는게 좋습니다

기본적인 개념부터 시작해서 아는 만큼 대답하면 면접관이 꼬리질문할텐데
거기서 잘대답하시면됩니다 간혹 거기서 경우의수로 현업에서 어떻게 쓸거같냐 어디서 적용할수있을지
이런거까지 미리 생각해서 정리하신다면 베스트입니다

눈팅하다가 제 경험 팁좀드리면
면접에서 sqld자격증 보시고

1. 쿼리튜닝경험(힌트사용답변)
2. 옵티마이저설명
3. 모든 sql에 힌트를 적용해야할까에 대한 생각

이렇게 흘러가서 합격했던 경험이있어요 지금있는회사는git sta아니지만 ㅎㅎ 참고해보세요

컨텍스트 스위칭 설명하려면 멀티 스레드 멀티 프로세스 얘기할 거 같네여

그리고 얘네들이 서로 스케줄링 되면서 실행되는 거라고 하고

멀티 스레드가 멀티 프로새스보다 컨텍스트 스위칭 오버헤드가 낮은 이유 얘기할 거 같네요

Q. 안녕하세요 혹시 로드밸런싱을 위해서 리버스 프록시를 쓴다면 리버스 프록시 서버에 트래픽이 많이 몰리게 되면 어떻게 하나요?

A.뜻을 명확히 하자면은 nginx plus와 같은 WS를 사용해서 트래픽 분산을 하고 있는데, 그 WS가 뻗으면 어떻게 해야하느냐는 의미신가요?

보통의 경우에는 아예 별도의 로드벨런서를 준비하거나 정말 트래픽이 큰 곳인 경우에는 하드웨어적인 장비를 준비해둡니다.
WS가 뻗지 않도록 한다는 측면에서는 스케일아웃, 스케일업 하는 것이 타당하겠죠.

하드웨어 레벨로 가는 경우는 정말 트래픽이 과도한 경우이기 때문에 조금 더 찾아보시면 좋을 것 같습니다.
