<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAO" %>
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.board.vo.KcmHelloBoardVO" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 목록</title>
		<style type="text/css">
			.tt{
				text-align : center;
				font-weight : bold;
			}
		</style>
		<script type="text/javascript">
			function boardFunction(str){
				var strValue = str;
				alert(strValue);
				
				if ('I' == strValue){
					//http://localhost:8088/babyWeb/board/kcmHelloBoardInsert.html
					document.boardForm.action = "/babyWeb/board/kcmHelloBoardInsert.html";
					alert(' I >>> ' + document.boardForm.action);
				}
				if ('SALL' == strValue){
					document.boardForm.ISUD_TYPE.value = "SALL";
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					document.boardForm.action = "/babyWeb/board/kcmHelloBoardSelectAll.jsp";
					alert(' SALL >>> ' + document.boardForm.action);
				} 
				if ('U' == strValue){
					document.boardForm.ISUD_TYPE.value = "U";
					//http://localhost:8088/babyWeb/board/kcmHelloBoardUpdate.jsp
					document.boardForm.action = "/babyWeb/board/kcmHelloBoardUpdate.jsp";
					alert(' U >>> ' + document.boardForm.action);
				}
				if ('D' == strValue){
					document.boardForm.ISUD_TYPE.value = "D";
					//http://localhost:8088/babyWeb/board/kcmHelloBoardDelete.jsp
					document.boardForm.action = "/babyWeb/board/kcmHelloBoardDelete.jsp";
					alert(' D >>> ' + document.boardForm.action);
				}
				
				document.boardForm.submit();
			}
		</script>
	</head>
	<body>
		<%
			KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
			List<KcmHelloBoardVO> aListAll = khbdao.selectKcmHelloBoard();
			int nCnt = aListAll.size();
		%>
		<center>
			<form name="boardForm" method="POST">
				<table border="1" align="center">
					<thead>
						<tr>
							<td colspan="10" align="center">
								<h2>게시판</h2>
							</td>
						</tr>
						<tr>
							<td colspan="10" align="right">
								<input type="button" value="글쓰기" onclick="boardFunction('I')">
								<input type="button" value="글목록" onclick="boardFunction('SALL')">
								<input type="button" value="글수정" onclick="boardFunction('U')">
								<input type="button" value="글삭제" onclick="boardFunction('D')">
							</td>
						</tr>
						<tr>
							<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
							<td class="tt">글번호</td>
							<td class="tt">제목</td>
							<td class="tt">이름</td>
							<td class="tt">비밀번호</td>
							<td class="tt">내용</td>
							<td class="tt">입력일</td>
							<td class="tt">수정일</td>
						</tr>
					</thead>
<%
					for (int i=0; i < nCnt; i++){
						KcmHelloBoardVO khbvo = aListAll.get(i);
%>					
						<tbody>
						<tr>
							<td align="center">
								<input type="checkbox" name="chkInKno"
										id="chkInKno"  value=<%= khbvo.getKno() %>
										onclick="checkOnly(this)">
							</td>
							<td align="center"><%= khbvo.getKno() %></td>
							<td align="center"><%= khbvo.getKsubject() %></td>
							<td align="center"><%= khbvo.getKname() %></td>

							<td align="center"><%= khbvo.getKpw() %></td>
							<td align="center"><%= khbvo.getKmemo() %></td>
							<td align="center"><%= khbvo.getKinsertdate() %></td>
							<td align="center"><%= khbvo.getKupdatedate() %></td>						
						</tr>
<%
					}
%>						
						<tr>
							<td colspan="10" align="right">
								<input type="hidden" name="ISUD_TYPE">
								
								<input type="button" value="글쓰기 " onclick="boardFunction('I')">
								<input type="button" value="글목록" onclick="boardFunction('SALL')">
								<input type="button" value="글수정" onclick="boardFunction('U')">
								<input type="button" value="글삭제" onclick="boardFunction('D')">
							</td>
						</tr>
						</tbody>
				</table>
			</form>
		</center>
	</body>
</html>