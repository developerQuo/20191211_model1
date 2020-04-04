# __20191211_model1__
## 비트캠프 두번째 개인프로젝트: model1 게시판

### 시스템 아키텍처
<p align="center">
<img src="/img/system_architecture.JPG" width="80%" height="60%" title="시스템아키텍처"></img>
</p>
* JSP에서 사용자의 요청에 응답하고 웹페이지를 보여주도록 구현.
* Dao에서는 interface와 implement로 나누어 구현.
	+ ConnProperty 클래스에는 DB로그인 정보와 JDBC드라이버 정보를 저장. connection을 닫는 함수도 함께 정의.
	+ Chaebun 클래스에는 회원번호를 생성. (구분자1자리 + 숫자4자리)
	+ SqlMap 클래스에는 채번, CRUD 쿼리를 StringBuffer로 작성.

### 메인 페이지
***
<p align="center">
<img src="/img/main.png" width="60%" height="40%" title="메인"></img>
</p>

### 로그인 페이지
***
<p align="center">
<img src="/img/회원 로그인.png" width="60%" height="40%" title="로그인"></img>
</p>

### 회원가입 페이지
***
<p align="center">
<img src="/img/회원 가입.png" width="60%" height="40%" title="회원 가입"></img>
</p>

### 회원목록 페이지
***
<p align="center">
<img src="/img/회원 목록.png" width="60%" height="40%" title="회원 목록"></img>
</p>

### 게시판 목록
***
<p align="center">
<img src="/img/게시판 목록.png" width="60%" height="40%" title="게시판 목록"></img>
</p>

### 게시판 글쓰기 페이지
***
<p align="center">
<img src="/img/게시판 글쓰기.png" width="60%" height="40%" title="게시판 글쓰기"></img>
</p>

### 게시판 수정 페이지
***
<p align="center">
<img src="/img/게시판 수정.png" width="60%" height="40%" title="게시판 수정"></img>
</p>

### 게시판 삭제 페이지
***
<p align="center"> 
<img src="/img/게시판 삭제.png" width="60%" height="40%" title="게시판 삭제"></img>
</p>
