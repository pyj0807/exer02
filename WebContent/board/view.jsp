<%-- 특정 키에 해당하는 데이터 출력 --%>
<%@page import="beans.BoardDao"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no= Integer.parseInt(request.getParameter("no"));
	BoardDao board = new BoardDao();
	Map one =board.getOneByNo(no);
%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf"%>
<h1>《상세보기》</h1>
<%if(one == null) { %>
	<p>
		이미 삭제된 글이나, DB 장애로 인해 데이터를 불러올수 없습니다. 
	</p>
<%}else { %>
	<p style="text-align: left">
		<b style="font-size: large;"><%=one.get("TITLE") %></b>
	</p>
	<p style="text-align: left">
		<small><i>작성자</i> <%=one.get("WRITER") %> / <i>작성일</i> <%=one.get("LEFTDATE") %>  / <i>추천</i> <%=one.get("GOOD") %></small>
	</p>
	<hr/>
	<p style="text-align: left; min-height: 300px; font-size: smaller;"> 
		<%= ((String)one.get("CONTENT")).replace("\n", "<br/>") %>
	</p>
	<hr/>
	<p style="text-align: left">
		<%if(one.get("ATTACH") != null) { %>
		첨부파일 :   <a href="<%=application.getContextPath() %><%=one.get("ATTACH") %>" download >다운로드</a>
		<%} %>
	</p>
	<a style="text-align: center;" href="<%=application.getContextPath()%>/board/goodlog.jsp?no=<%=one.get("NO")%>"><b><button>추천</button></b></a>
	<a style="text-align: center;" href="<%=application.getContextPath()%>/board/list.jsp?no=<%=one.get("NO")%>"><b><button>목록</button></b></a>
<%} %>
	
	
<%@ include file="/layout/bottom.jspf"%>

