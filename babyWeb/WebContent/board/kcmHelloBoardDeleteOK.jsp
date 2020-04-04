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
	String kno = request.getParameter("kno");
	String kdeleteyn = "N";
	if (isudType != null){
		System.out.println("isudType >>> " + isudType);
		boolean bool = "DOK".equals(isudType.toUpperCase());
		
		if (bool){
			KcmHelloBoardVO khbvo = null;
			KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
		
			khbvo = new KcmHelloBoardVO(kno,
										kdeleteyn);
			int nCnt = khbdao.deleteKcmHelloBoard(khbvo);
			if (nCnt > 0){
%>
				<script>
					alert("삭제성공!!");
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					location.href="/babyWeb/board/kcmHelloBoardSelectAll.jsp";
				</script>
<%				
			}else{
				out.println(" 삭제실패! 목록으로 돌아가기 ");
%>
				<script>
					alert("삭제실패!!");
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					location.href="/babyWeb/board/kcmHelloBoardSelectAll.jsp";
				</script>
<%
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>