<%@page import="chap17.service.WriteArticleService"%>
<%@page import="chap17.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="writingRequest" class="chap17.model.WritingRequest"></jsp:useBean>
<jsp:setProperty name="writingRequest" property="*"></jsp:setProperty>
<%
	Article postedArticle = WriteArticleService.getInstance().write(writingRequest);
	request.setAttribute("postedArticle", postedArticle);
%>

<html>
<head>
<title>게시글 작성</title>
</head>
<body>
게시글을 등록했습니다.
<br>
<a href='<c:url value="/list.jsp"/>'>목록보기</a>
<a href='<c:url value="/read.jsp?articleId=${postedArticle.id }"></c:url>'>게시글 읽기</a>
</body>
</html>