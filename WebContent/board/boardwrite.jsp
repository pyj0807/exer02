<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<h1>게시판</h1>
<p>
	<form action="<%=application.getContextPath()%>/board/wrote.jsp" method="post">
	<p>
		작성자 : <%=session.getAttribute("logid") %> <br/>
		제 목 : <input type="text" name="title" style="padding: 5px"/><br/>
		게시글 : <br/> 
		<textarea name="content" style="height: 300px; width: 600px; padding: 5px; resize: none; font-family: inherit;"
		placeholder="write a message"></textarea><br/>
		첨부파일 : <input type="file" name="attach">
		<button type="button">작성</button>


</p>

<%@ include file="/layout/bottom.jspf"%>