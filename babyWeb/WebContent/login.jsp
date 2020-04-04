<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO" %>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("EUC-KR"); // 들어오는 데이터를 EUC-KR로 인코딩  %>
<%
	// request : 내장형 오브젝트
	// getParameter() 함수는 외부에서
	// jsp에 요청하는 데이터를 받는 함수.
	// 데이터는 문자열로 받는다.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println(id);
	out.println(pw);
	
	
	// Web Server와 Servlet Container를 연결하는 작업.
	// 이 작업을 하기전에 데이터 검증을 필수로 한다. - 데이터가 없으면 작업이 의미없기 때문.
	KcmMemberDAO kdao = new KcmMemberDAOImpl();
	KcmMemberVO kvo = null;
	kvo = new KcmMemberVO();
	kvo.setKid(id);
	kvo.setKpw(pw);
	
	List<KcmMemberVO> aList = kdao.loginKcmMember(kvo);
	
	if (aList.size() == 1){
%>
		<script>
			alert("로그인 성공!");
			location.href = "/babyWeb/index.html";
		</script>
<%
	}else{
%>
		<script>
			alert("로그인 실패 ㅜㅜ");
			location.href = "/babyWeb/login.html";
		</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		Hello JSP
	</body>
</html>