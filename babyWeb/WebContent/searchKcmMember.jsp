<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO"%>
<%@ page import="bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	
		<%
			String mem = request.getParameter("mem");
			KcmMemberVO kvo = new KcmMemberVO();
			kvo.setKmem(mem);
			
			KcmMemberDAO kmdao = new KcmMemberDAOImpl();
			List<KcmMemberVO> aList = kmdao.searchKcmMember(kvo);
		%>
		<table align="center" border="1">
			<tr>
				<td colspan="12" align="center">ȸ������</td>
			</tr>
			<tr>
				<td align="center"><B>ȸ����ȣ</B></td>
				<td align="center"><B>���̵�</B></td>
				<td align="center"><B>��й�ȣ</B></td>
				<td align="center"><B>�̸�</B></td>
				<td align="center"><B>�̸���</B></td>
				<td align="center"><B>��ȭ��ȣ</B></td>
				<td align="center"><B>�������</B></td>
				<td align="center"><B>�����ȣ</B></td>
				<td align="center"><B>�ּ�</B></td>
				<td align="center"><B>��������</B></td>
				<td align="center"><B>������</B></td>
				<td align="center"><B>������</B></td>
			</tr>
			
			<%
				Iterator<KcmMemberVO> iter = aList.iterator();
				if (iter != null){
					while (iter.hasNext()){
						kvo = iter.next();
			%>
			<tr>
				<td align="center"><%= kvo.getKmem() %></td>
				<td align="center"><%= kvo.getKid() %></td>
				<td align="center"><%= kvo.getKpw() %></td>
				<td align="center"><%= kvo.getKname() %></td>
				<td align="center"><%= kvo.getKemail() %></td>
				<td align="center"><%= kvo.getKhp() %></td>
				<td align="center"><%= kvo.getKbirth() %></td>
				<td align="center"><%= kvo.getKpostno() %></td>
				<td align="center"><%= kvo.getKjuso() %></td>
				<td align="center"><%= kvo.getKdeleteYN() %></td>
				<td align="center"><%= kvo.getKinsertdate() %></td>
				<td align="center"><%= kvo.getKupdatedate() %></td>
			</tr>
		<%
				}
			}
		%>
			
		</table>
	</body>
</html>