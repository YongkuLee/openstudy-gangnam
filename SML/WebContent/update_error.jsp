<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 실패</title>
</head>
<body>
에러 :
<c:choose>
	<c:when test="${exceptionType == 'ArticleNotFoundException' }">
	수정할 게시글이 존재하지 않습니다.
	</c:when>
	<c:when test="${exceptionType == 'InvalidPasswordException'}">
	암호를 잘못 입력하셨습니다.
	</c:when>
</c:choose>
<br>
<a href="list.jsp?p=${param.p }">목록보기</a>
</body>
</html>