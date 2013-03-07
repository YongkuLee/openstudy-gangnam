<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>
</head>
<body>
<form action="update.jsp" method="post">
<input type="hidden" name="articleId" value="${article.id }" />
<input type="hidden" name="p" value="${param.p }" />
제목 : <input type="text" name="title" size="20" value="${article.title }" /> <br>
글암호 : <input type="password" name="password"> <br>
글내용 : <br>
<textarea name="content" rows="5" cols="40">${article.content }</textarea>
<br>
<input type="submit" value="수정" />
</form>
</body>
</html>