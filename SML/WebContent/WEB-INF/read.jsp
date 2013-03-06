<%@page import="chap17.service.ArticleNotFoundException"%>
<%@page import="chap17.service.ReadArticleService"%>
<%@page import="chap17.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int articleId = Integer.parseInt(request.getParameter("articleId"));
	String viewPage = null;
	try {
		Article article = ReadArticleService.getInstance().readArticle(articleId);
		request.setAttribute("article", article);
		viewPage = "/read_view.jsp";
	} catch(ArticleNotFoundException ex) {
		viewPage = "/articel_not_found.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>
