<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>
<table border="1">
	<c:if test="${listModel.totalPageCount > 0}">
		<tr>
			<td colspan="5">
			${listModel.startRow } - ${listModel.endRow }
			[${listModel.requestPage } / ${listModel.totalPageCount }]
			</td>
		</tr>
	</c:if>
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	<c:choose>
		<c:when test="${listModel.hasArticle == false}">
			<tr>
				<td colspan="5">
				게시글이 없습니다.
				</td>
			</tr>	
		</c:when>
		<c:otherwise>
		<c:forEach var="article" items="${listModel.articleList }">
			<tr>
				<td>${article.id }</td>
				<td>
					<c:if test="${article.level > 0 }">
					<c:forEach begin="1" end="${article.level }">-
					</c:forEach>&gt;
			 	 	</c:if>
			 	 	<c:set var="query" value="articleId=${article.id }&p=${listModel.requestPage }">
			 	 	</c:set>
			 	 	<a href="<c:url value="/read.jsp?${query}"></c:url>">${article.title }</a>
				</td>
				<td>${article.writerName }</td>
				<td>${atricle.postingDate }</td>
				<td>${article.readCount }</td>
			</tr>
		</c:forEach>	
			<tr>
				<td colspan="5">
					<c:if test="${beginPage > 10 }">
						<a href="<c:url value="/list.jsp?p=${beginPage-1 }" ></c:url>">이전</a>
					</c:if>
					<c:forEach var="pno" begin="${beginPage }" end="${endPage }">
						<a href='<c:url value="/list.jsp?p=${pno }" ></c:url>'>[${pno }]</a>
					</c:forEach>
					<c:if test="${endPage < listModel.totalPageCount }">
						<a href='<c:url value="/list.jsp?p=${endPage + 1 }"></c:url>'>다음</a>
					</c:if>
				</td>
			</tr>
		</c:otherwise>	
	</c:choose>
		<tr>
			<td colspan="5">
				<a href="writeForm.jsp">글쓰기</a>
			</td>
		</tr>
</table>
</body>
</html>