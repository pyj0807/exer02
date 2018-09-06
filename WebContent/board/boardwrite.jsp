<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	
%>
<h1>게시판</h1>
<p>
	<form method="post" action="<%=application.getContextPath()%>/board/wrote.jsp" enctype="multipart/form-data">
	<p>
		제 목 : <input type="text" name="title" style="width: 250px; padding: 5px"/><br/>
		<br/>
		게시글 : <br/> 
		<br/>
		<textarea name="content" style="height: 300px; width: 300px; padding: 5px; resize: none; font-family: inherit;"
		placeholder="write a message"></textarea><br/>
	</p>
	<p>
		파일첨부<br /> <input type="file" style="width: 320px; padding: 5px;" name="attach" />
	</p>
	<button type="submit" style="width: 330px; padding: 5px;">글 공유</button>
</form>
<%@ include file="/layout/bottom.jspf"%>