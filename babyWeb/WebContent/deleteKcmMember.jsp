<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������ ����</title>
	</head>
	<body>
		<%
			String mem = request.getParameter("mem");
			
			KcmMemberVO kmvo = new KcmMemberVO();
			kmvo.setKmem(mem);
			
			KcmMemberDAO kmdao = new KcmMemberDAOImpl();
			boolean flag = kmdao.deleteKcmMember(kmvo);
			if (flag){
		%>
			<script>
				alert("���������� �����Ǿ����ϴ�.");
				//http://localhost:8088/babyWeb/members.jsp
				location.href = "/babyWeb/selectKcmMember.jsp";
			</script>
		<%
			}else{
		%>
			<script>
				alert("������ �߻��߽��ϴ�.");
				//http://localhost:8088/babyWeb/index.html
				location.href = "/babyWeb/registerKCMMember.html";
			</script>
		<%
			}
		%>
	</body>
</html>