<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO" %>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("EUC-KR"); // ������ �����͸� EUC-KR�� ���ڵ�  %>
<%
	// request : ������ ������Ʈ
	// getParameter() �Լ��� �ܺο���
	// jsp�� ��û�ϴ� �����͸� �޴� �Լ�.
	// �����ʹ� ���ڿ��� �޴´�.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println(id);
	out.println(pw);
	
	
	// Web Server�� Servlet Container�� �����ϴ� �۾�.
	// �� �۾��� �ϱ����� ������ ������ �ʼ��� �Ѵ�. - �����Ͱ� ������ �۾��� �ǹ̾��� ����.
	KcmMemberDAO kdao = new KcmMemberDAOImpl();
	KcmMemberVO kvo = null;
	kvo = new KcmMemberVO();
	kvo.setKid(id);
	kvo.setKpw(pw);
	
	List<KcmMemberVO> aList = kdao.loginKcmMember(kvo);
	
	if (aList.size() == 1){
%>
		<script>
			alert("�α��� ����!");
			location.href = "/babyWeb/index.html";
		</script>
<%
	}else{
%>
		<script>
			alert("�α��� ���� �̤�");
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