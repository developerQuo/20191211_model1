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
	String kno = request.getParameter("kno");
	String ksubject = request.getParameter("ksubject");
	String kname = request.getParameter("kname");
	String kmemo = request.getParameter("kmemo");
	
	if("UOK".equals(isudType.toUpperCase())){
		System.out.println(" ISUD_TYPE >>> " + isudType);
		
		KcmHelloBoardVO khbvo = null;
		KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
		
		khbvo = new KcmHelloBoardVO(kno,
									ksubject,
									kmemo);
		int nCnt = khbdao.updateKcmHelloBoard(khbvo);
		if (nCnt == 1){
			System.out.println(" 수정성공 페이지로 보내기 ");
%>
			<script>
				alert("게시판 글수정 성공!");
				//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
				location.href="/babyWeb/board/kcmHelloBoardSelectAll.jsp";
			</script>
<%
		}else{
			out.println(" 에러 페이지로 보내기 ");
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