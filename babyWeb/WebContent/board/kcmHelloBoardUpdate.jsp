<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAO" %>
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.board.vo.KcmHelloBoardVO" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%
	String isudType = request.getParameter("ISUD_TYPE");
	String chkInKno = request.getParameter("chkInKno");
	
	if (isudType != null){
		System.out.println("isudType >>> " + isudType);
		boolean bool = "U".equals(isudType.toUpperCase());
		
		if (bool){
			KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
			
			KcmHelloBoardVO khbvo = new KcmHelloBoardVO();
			khbvo.setKno(chkInKno);
			
			List<KcmHelloBoardVO> aList = khbdao.searchKcmHelloBoard(khbvo);
			int nCnt = aList.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�Խ��� �ۼ���</title>
		<script type="text/javascript">
			function boardUpdateFunction(str){
				var strValue = str;
				alert(strValue);
				
				if ('UOK' == strValue){
					http://localhost:8088/babyWeb/board/kcmHelloBoardUpdateOK.jsp
					document.boardUpdate.action = "/babyWeb/board/kcmHelloBoardUpdateOK.jsp";
					alert( 'UOK >>> ' + document.boardUpdate.action);
				}
				if ('SALL' == strValue){
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					document.boardUpdate.action = "/babyWeb/board/kcmHelloBoardSelectAll.jsp";
					alert( 'SALL >>> ' + document.boardUpdate.action);
				}
				
				document.boardUpdate.submit();
			}
		</script>
	</head>
	<body>
		<center>
			<form name="boardUpdate" method="POST">
				<table border="1" align="center">
<%
					if(nCnt <= 1){
						for (int i=0; i<nCnt; i++){
							KcmHelloBoardVO khbvo_2 = aList.get(i);
%>
					<tr>
						<td colspan="2" align="center">�Խ��� �� �����ϱ�</td>
					</tr>
					<tr>
						<td align="center">�۹�ȣ</td>
						<td><input type="text" name="kno" id="kno" size="20" readonly value=<%= khbvo_2.getKno() %>></td>
					</tr>
					<tr>
						<td align="center">����</td>
						<td><input type="text" name="ksubject" id="ksubject" size="53" value=<%= khbvo_2.getKsubject() %>></td>
					</tr>
					<tr>
						<td align="center">�̸�</td>
						<td><input type="text" name="kname" id="kname" size="53" value=<%= khbvo_2.getKname() %>></td>
					</tr>
					<tr>
						<td align="center">�Է���</td>
						<td><input type="text" name="kinsertdate" size="20" disabled value=<%= khbvo_2.getKinsertdate() %>></td>
					</tr>
					<tr>
						<td align="center">������</td>
						<td><input type="text" name="kupdatedate" size="20" disabled value=<%= khbvo_2.getKupdatedate() %>></td>
					</tr>
					<tr>
						<td align="center">����</td>
						<td><textarea name="kmemo" id="kmemo" cols="50" rows="10"><%= khbvo_2.getKmemo() %></textarea></td>
					</tr>
<%
				}
%>
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="ISUD_TYPE" value="UOK">
							<input type="button" value="�ۼ���" onclick="boardUpdateFunction('UOK')">
							<input type="button" value="�۸��" onclick="boardUpdateFunction('SALL')">
						</td>
					</tr>
				</table>
			</form>
<%
			}else{
%>			
						<script>
							alert(" ������ �����Ͱ� �����ϴ�. ");
						</script>
<%
			}

		}else{
			
		}
	}else{
		
	}
%>
		</center>
	</body>
</html>
