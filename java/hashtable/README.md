HashTable 

HashTable은 <key,value> 형태로 데이터를 저장한다. 이 때 해시 함수(Hash Function)을 이용하여 key값을 기준으로 고유한 식별값인 해시값을 만든다. (hashcode가 해시값을 만드는 역할을 한다.) 이 해시값을 버킷(Bucket)에 저장한다.

하지만 HashTable 크기는 한정적이기 때문에 같은 서로 다른 객체라 하더라도 같은 해시값을 갖게 될 수도 있다.
이것을 **해시 충돌(Hash Collisions)**이라고 한다.
이런 경우 아래와 같이 해당 버킷(Bucket)에 LinkedList 형태로 객체를 추가한다.