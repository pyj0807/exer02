<%@ page import="java.sql.Date"%>
<%@ page import="java.util.UUID"%>
<%@ page import="beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String code = UUID.randomUUID().toString().split("-")[0];
	String sender = (String) session.getAttribute("logid");
	String receiver = request.getParameter("receiver");
	String content = request.getParameter("content");
	Date createdate = new Date(System.currentTimeMillis());

	MessageDao mdao = new MessageDao();
	int r = mdao.addMessage(code, sender, receiver, content, createdate);

	if (r != 1) {
		response.sendRedirect(application.getContextPath() + "/message/send.jsp?rst=fail");
	} else {
%>
<%@ include file="/layout/top.jspf"%>
<h1>《쪽지 전송》</h1>
<p>
	<%=receiver %> 님에게 쪽지를 발송하였습니다.<br/>
</p>
<p>
	<a href="<%=application.getContextPath()%>/message/box.jsp"><button type="button">쪽지목록</button></a>
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">쪽지작성</button></a>
</p>
<%@ include file="/layout/bottom.jspf"%>
<%
	}
%>

