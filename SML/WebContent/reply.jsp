<%@page import="chap17.service.ReplyArticleService"%>
<%@page import="chap17.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="replyingRequest" class="chap17.model.ReplyingRequest">
<<jsp:setProperty property="*" name="replyingRequest"/>
</jsp:useBean>
<%
	String viewPage = null;
	try {
		Article postedArticle = ReplyArticleService.getInstance().reply(replyingRequest);
		request.setAttribute("replyingRequest", replyingRequest);
		viewPage = "/reply_success.jsp";
	} catch(Exception e) {
		viewPage = "/reply_error.jsp";
		request.setAttribute("replyException", e);
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>
<html>

<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>