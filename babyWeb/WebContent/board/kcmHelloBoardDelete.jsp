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
		boolean bool = "D".equals(isudType.toUpperCase());
		
		if (bool){
			KcmHelloBoardVO khbvo = null;
			List<KcmHelloBoardVO> aList = null;
			KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
			
			khbvo = new KcmHelloBoardVO();
			khbvo.setKno(chkInKno);
			aList = khbdao.searchKcmHelloBoard(khbvo);
			int nCnt = aList.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>삭제 내용 확인</title>
		<script type="text/javascript">
			function boardDeleteFunction(str){
				var strValue = str;
				alert(strValue);
				
				if ('DOK' == strValue){
					//http://localhost:8088/babyWeb/board/kcmHelloBoardDeleteOK.jsp
					document.boardDelete.action="/babyWeb/board/kcmHelloBoardDeleteOK.jsp";
					
					alert( 'DOK >>> ' + document.boardDelete.action);
				}
				if ('SALL' == strValue){
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					document.boardDelete.action="/babyWeb/board/kcmHelloBoardSelectAll.jsp";
					
					alert( 'SALL >>> ' + document.boardDelete.action);
				}
				document.boardDelete.submit();
			}
		</script>
	</head>
	<body>
		<center>
		<form name="boardDelete" method="POST">
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">게시판 글 삭제하기</td>
				</tr>
<%				
				if (nCnt <= 1){
					Iterator<KcmHelloBoardVO> iter = aList.iterator();
					while(iter.hasNext()){
						KcmHelloBoardVO khbvo_2 = iter.next();
%>
				<tr>
					<td align="center">글번호</td>
					<td><input type="text" name="kno" id="kno" size="20" readonly value=<%= khbvo_2.getKno() %>></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="ksubject" id="ksubject" size="53" disabled value=<%= khbvo_2.getKsubject() %>></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="kname" id="kname" size="53" disabled value=<%= khbvo_2.getKname() %>></td>
				</tr>
				<tr>
					<td align="center">입력일</td>
					<td><input type="text" name="kinsertdate" size="20" disabled value=<%= khbvo_2.getKinsertdate() %>></td>
				</tr>
				<tr>
					<td align="center">수정일</td>
					<td><input type="text" name="kupdatedate" size="20" disabled value=<%= khbvo_2.getKupdatedate() %>></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="kmemo" id="kmemo" cols="50" rows="10" disabled><%= khbvo_2.getKmemo() %></textarea></td>
				</tr>
<%
					}
%>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="ISUD_TYPE" value="DOK">
						<input type="button" value="글삭제" onclick="boardDeleteFunction('DOK')">
						<input type="button" value="글목록" onclick="boardDeleteFunction('SALL')">
					</td>
				</tr>
			</table>
		</form>
<%
				}else{
%>
		<script>
			alert(" 삭제할 데이터가 없습니다. ");
		</script>
<%
				}
		}
	}
%>
	</center>
	</body>
</html>