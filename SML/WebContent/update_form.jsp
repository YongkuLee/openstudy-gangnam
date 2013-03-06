<%@page import="chap17.service.ArticleNotFoundException"%>
<%@page import="chap17.service.ReadArticleService"%>
<%@page import="chap17.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String viewPage = null;
	try {
		int articleId = Integer.parseInt(request.getParameter("articleId"));
		Article article = ReadArticleService.getInstance().getArticle(articleId);
		viewPage = "/update_form_view.jsp";
		request.setAttribute("article", article);
	} catch(ArticleNotFoundException ex) {
		viewPage = "/article_not_found.jsp";
	}
%>
<jsp:forward page="<%=viewPage%>"></jsp:forward>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>