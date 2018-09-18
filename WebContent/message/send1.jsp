<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
	
	<form action="<%=application.getContextPath() %>/message/sending.jsp" method="post">
	<p>
		받을사람(*)<br/>
		<input type="text" placeholder="write receiver" style="width: 220px; padding: 5px">
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content" style="height: 300px; width: 220px; padding: 5px; resize:nine;" ></textarea>
	</p>
	<button type="submit">메세지 전송</button>
	</form>
<%@ include file="/layout/bottom.jspf"%>
