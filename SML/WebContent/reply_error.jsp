<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 실패</title>
</head>
<body>
에러:
<c:choose>
	<c:when test="${exceptionType == 'ArticleNotFoundException'}">
	답변을 등록할 게시글이 존재하지 않습니다.
	</c:when>
	<c:when test="${exceptionType == 'CannotReplyArticleException'}">
	답변 글을 등록할 수 없는 게시글입니다.
	</c:when>
	<c:when test="${exceptionType == 'LastChildAleadyExistsException'}">
	등록할 수 있는 답변 개수를 초과했습니다.
	</c:when>
</c:choose>
<br>

<a href='<c:url value='/list.jsp?p=${param.p}'></c:url>'>목록보기</a>
</body>
</html>