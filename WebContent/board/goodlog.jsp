<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>    
<%
	GoodDao gdao = new GoodDao();
	BoardDao bdao = new BoardDao();
	String id = (String)session.getAttribute("logid");
	int no = Integer.parseInt(request.getParameter("no"));
	Map m = new HashMap();
		m.put("actor", id);
		m.put("target", no);
	
	int n = gdao.addLog(m);
	
	
%>    
    
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf"%>

<%if(n==1){%>
	삭제된 글이던가, 데이터를 가져올수가 없습니다.
<%}else{ %>
	
<%} %>




<%@ include file="/layout/bottom.jspf"%>