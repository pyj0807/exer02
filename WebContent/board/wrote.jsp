<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>    
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="java.util.*" %>
<%
	BoardDao bdao = new BoardDao();
	Map data = new HashMap();
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true,"UTF-8");
	Part part;
	while( (part = parser.readNextPart() ) != null){
		if(part.isParam()){
			ParamPart param = (ParamPart)part;
			data.put(param.getName(), param.getValue());
		}else{
			FilePart file = (FilePart)part;
			
			
			
			data.put("attach", "url");
		}
	}
	
	bdao.addBoard(data);
%>
