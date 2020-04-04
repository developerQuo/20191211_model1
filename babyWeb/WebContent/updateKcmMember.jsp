<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>비밀번호 변경</title>
		
	</head>
	<body>
		<%
			String mem = request.getParameter("mem");
			String pw = request.getParameter("pw");

			KcmMemberVO kmvo = new KcmMemberVO();
			kmvo.setKmem(mem);
			
			KcmMemberDAO kmdao = new KcmMemberDAOImpl();
			boolean flag = kmdao.updateKcmMember(kmvo, pw);
			System.out.println("flag >>>> " + flag);
			if (flag){
		%>
			<script>
				alert("성공적으로 변경되었습니다.");
				//http://localhost:8088/babyWeb/members.jsp
				//location.href = "/babyWeb/selectKcmMember.jsp";
				location.href = "/babyWeb/searchKcmMember.jsp?mem=" + "<%= mem %>";
				// 위와같이 쿼리스트링을 쓰는 것은 야매이므로 지양한다.
			</script>
		<%
			}else{
		%>
			<script>
				alert("오류가 발생했습니다.");
				//http://localhost:8088/babyWeb/index.html
				location.href = "/babyWeb/registerKCMMember.html";
			</script>
		<%
			}
		%>
	</body>
</html>

<!-- 
<script>
			function checkPw(){
				alert("(log) checkPw entered");
				//var pw1 = document.getElementById("pwVal").value;
				//var pw2 = document.getElementById("checkPwVal").value;
				
				//alert(pw1);
				//alert(pw2);
			}
		</script>

<form name="pwUpdateForm" 
			  method = "POST">
			<table align="center" border="1">
				<tr><td colspan="2" align="center"><label> 비밀번호 변경 </label></td></tr>
				<tr>
					<td align="center"><label for="pw"> 비밀번호 </label></td>
					<td align="center"><input type = "text" name = "pw" id="pwVal"></td>
				</tr>
				<tr>
					<td align="center"><label for="checkPw"> 비밀번호 확인 </label></td>
					<td align="center"><input type = "text" name = "checkPw" id="checkPwVal"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인" onclick="checkPw()">
						<input type="reset" value="되돌리기">
					</td>
				</tr>
				
			</table>
			
		</form> 
		-->