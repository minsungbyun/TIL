[ block tag ]

- 자신의 내용과 앞뒤 태그의 내용을 다른 라인에 출력하는 태그
- 자신의 내용만으로 한 라인을 독점해서 출력하는 태그(*)
- 영역(구조)을 만들때 사용 > 컨테이너 역할 > 레이아웃 구성(틀 만들기)
- 내용물의 크기와 상관없이 너비는 항상 100%, 높이는 내용물의 크기에 맞춰 변화

대표적인 block 태그 <div>

<address>, <article>, <aside>, <audio>, <blockquote>, <canvas>, <dd>, <div>, <dl>, <fieldset>, <figcaption>, <figure>, <footer>, <form>, <h1>, <h2>, <h3>, <h4>, <h5>, <h6>, <header>, <hgroup>, <hr>, <noscript>, <ol>, <output>, <p>, <pre>, <section>, <table>, <ul>, <video>

[ inline tag ] 

- 자신의 내용과 앞뒤 태그의 내용을 같은 라인에 출력하는 태그
- 구성 요소 역할을 한다.(출력 내용 역할)
- 내용물의 크기가 태그의 영역이 된다.

대표적인 inline 태그 <span>

<a>, <abbr>, <acronym>, <b>, <bdo>, <big>, <br/>, <button>, <cite>, <code>, <dfn>, <em>, <i>, <img>, <input>, <kbd>, <label>, <map>, <object>, <q>, <samp>, <small>, <script>, <select>, <span>, <strong>, <sub>, <sup>, <textarea>, <tt>, <var>

태그 중첩 규칙
1. 블럭 태그는 자식으로 또다른 블럭 태그 or 인라인 태그를 가질 수 있다.
2. 인라인태그는 자식으로 또다른 인라인태그만 올 수 있다.(블럭태그는 올 수 없다.)
3. 예외] 블럭 태그 중 <p>태그는 자식으로 인라인 태그만 가질 수 있다.

