<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>답변쓰기</title>
</head>
<body>
<form action="reply.jsp" method="post">
<input type="text" name="parentArticleId" value="${param.parentId}" />
<input type="text" name="p" value="${param.p}"/>
제목 : <input type="text" name="title" size="20" value="re:" /><br>
작성자 : <input type="text" name="writerName"/><br>
글암호 : <input type="password" name="password"/><br> 
글내용 : <br>
<textarea name="content" rows="5" cols="40" ></textarea> <br>
<input type="submit" value="전송" />
</form>
</body>
</html>