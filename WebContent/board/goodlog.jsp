<%@page import="beans.BoardDao"%>
<%@page import="beans.GoodDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("logid");
	int no = Integer.parseInt(request.getParameter("no"));
	Map m = new HashMap();
		m.put("actor", id);
		m.put("target", no);
	
	GoodDao gdao = new GoodDao();
	int r = gdao.addLog(m);
	if(r==1){
		BoardDao board = new BoardDao();
		board.upGoodlog(no);
		response.sendRedirect(application.getContextPath() + "/board/view.jsp?no=" + no);
	}else {
	
%>    
    
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf"%>
<h1>《추천하기》</h1>
<p>이미 삭제된 글, 혹은 추천하신글입니다.</p>





<%@ include file="/layout/bottom.jspf"%>
<%
	}
%>