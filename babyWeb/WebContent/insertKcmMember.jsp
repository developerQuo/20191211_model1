<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<% request.setCharacterEncoding("EUC-KR");%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String birth = request.getParameter("birth");
	String postno = request.getParameter("postno");
	String juso = request.getParameter("juso");
	
	KcmMemberDAO kdao = null;
	boolean flag = false;
	KcmMemberVO kmvo = new KcmMemberVO();
	kmvo.setKid(id);
	kmvo.setKpw(pw);
	kmvo.setKname(name);
	kmvo.setKemail(email);
	kmvo.setKhp(hp);
	kmvo.setKbirth(birth);
	kmvo.setKpostno(postno);
	kmvo.setKjuso(juso);
	
	kdao = new KcmMemberDAOImpl();
	flag = kdao.insertKcmMember(kmvo);
	if (flag){
		System.out.println(" 회원가입 성공!");
%>
	<script>
		//http://localhost:8088/babyWeb/members.jsp
		location.href = "member/jsp/selectKcmMember.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원가입을 실패했습니다...");
		//http://localhost:8088/babyWeb/index.html
		location.href = "member/jsp/registerKCMMember.html";
	</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원가입</title>
		
	</head>
	<body>
		
	</body>
</html>