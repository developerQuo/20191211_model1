<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAO" %>
<%@ page import="bitcamp.java142.ch5.board.dao.KcmHelloBoardDAOImpl" %>
<%@ page import="bitcamp.java142.ch5.board.vo.KcmHelloBoardVO" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<%
	List<KcmHelloBoardVO> aList = null;
	KcmHelloBoardVO khbvo = null;
	
	String isudType = request.getParameter("ISUD_TYPE");
	String chkInKno = request.getParameter("chkInKno");
	String ksubject = request.getParameter("ksubject");
	String kname = request.getParameter("kname");
	String kpw = request.getParameter("kpw");
	String kmemo = request.getParameter("kmemo");
	String kdeleteyn = "Y";
	System.out.println(   isudType + " : " 
						+ chkInKno + " : "
						+ ksubject + " : "
						+ kname + " : "
						+ kpw + " : "
						+ kmemo + " : "
						+ kdeleteyn);
	if (isudType != null){
		System.out.println("isudType >>> " + isudType);
		boolean bool = "I".equals(isudType.toUpperCase());
		
		if (bool){
			KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
			khbvo = new KcmHelloBoardVO(ksubject
									   ,kname
									   ,kpw
									   ,kmemo
									   ,kdeleteyn);
			int nCnt = khbdao.insertKcmHelloBoard(khbvo);
			
			if (nCnt == 1){
%>
				<script>
					alert("글쓰기 성공!");
					//http://localhost:8088/babyWeb/board/kcmHelloBoardSelectAll.jsp
					location.href="/babyWeb/board/kcmHelloBoardSelectAll.jsp";
				</script>
<%
			}else{
%>
				<script>
					alert("글쓰기 실패ㅜㅜ");
					//http://localhost:8088/babyWeb/board/kcmHelloBoard.html
					location.href="/babyWeb/board/kcmHelloBoard.html";
				</script>
<%
			}
		}else{
			out.println("ISUD_TYPE를 확인하세요.");
		}
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 글쓰기</title>
	</head>
	<body>
	
	</body>
</html>