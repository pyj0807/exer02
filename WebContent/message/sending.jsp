<%@page import="beans.MessageDao"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	String serial = UUID.randomUUID().toString().split("-")[0];
	String sender = request.getParameter("sender");
	String reciver = request.getParameter("reciver");
	String content = request.getParameter("content");
	String createdate = request.getParameter("createdate");
	String receivedate = request.getParameter("receivedate");
	java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
	
	MessageDao mdao = new MessageDao();
	
	

%>	







<%@ include file="/layout/bottom.jspf"%>