<%@page import="chap17.service.UpdateArticleService"%>
<%@page import="chap17.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="updateRequest" class="chap17.model.UpdateRequest"></jsp:useBean>
<jsp:setProperty property="*" name="updateRequest"/>
<%
	String viewPage = null;
	try {
		Article article = UpdateArticleService.getInstance().update(updateRequest);
		request.setAttribute("updatedArticle", article);
		viewPage = "/update_success.jsp";
	} catch(Exception e) {
		request.setAttribute("updateException",	e);
		viewPage = "/update_error.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>"></jsp:forward>