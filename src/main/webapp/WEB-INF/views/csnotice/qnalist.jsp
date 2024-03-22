<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>qnalist</h3>

<hr />
		<table class="" border="1px">
		<tr class="">
			<td class="">NO</td>
			<td class="">제목</td>
			<td class="">이름</td>
			<td class="">날짜</td>
			<td class="">조회수</td>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr class="">
				<td class="">${dto.nbno }</td>
				<td class="">
					<a href="qnacontent?nbno=${dto.nbno }">${dto.nbtitle }</a>
				</td>
				<td class="">${dto.nbwriter }</td>
				<td class="">${dto.nbdate }</td>
				<td class="">${dto.nbhit }</td>
			</tr>
		</c:forEach> 
		</table>
		<a href="qnawriteview">글쓰기</a>
	<hr />
	
	
		<form action="qnalist" method="post">
		<c:if test="${searchVo.page>1 }">
			<a href="qnalist?page=1&sk=${searchKeyword}&nbtitle=${nbtitle==true?'nbtitle':''}
					&nbcontent=${nbcontent==true?'nbcontent':''}"><i class="fa-solid fa-angles-left"></i></a>
			<a href="qnalist?page=${searchVo.page-1 }&sk=${searchKeyword}&nbtitle=${nbtitle==true?'nbtitle':''}
					&nbcontent=${nbcontent==true?'nbcontent':''}"><i
				class="fa-solid fa-circle-chevron-left"></i></a>
		</c:if>

		<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }"
			var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page }">
					<span style="color: gold; font-weight: bold;">${i } &nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="qnalist?page=${i }&sk=${searchKeyword}&nbtitle=${nbtitle==true?'nbtitle':''}
					&nbcontent=${bcontent==true?'bcontent':''}" style="text-decoration: none;">${i }</a> &nbsp;
			</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${searchVo.page < searchVo.totPage}">
			<a href="qnalist?page=${searchVo.page+1 }&sk=${searchKeyword}&nbtitle=${nbtitle==true?'nbtitle':''}
					&nbcontent=${nbcontent==true?'nbcontent':''}"><i class="fa-solid fa-circle-chevron-right"></i></a>
			<a href="qnalist?page=${searchVo.totPage }&sk=${searchKeyword}&nbtitle=${nbtitle==true?'nbtitle':''}
					&nbcontent=${nbcontent==true?'nbcontent':''}"><i class="fa-solid fa-angles-right"></i></a>
		</c:if>
		
		<div>
			<c:choose>
				<c:when test="${nbtitle }">
					<input type="checkbox" name="searchType" value="nbtitle" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="nbtitle" />
				</c:otherwise>
			</c:choose>
			제목
				
				<c:choose>
				<c:when test="${nbcontent }">
					<input type="checkbox" name="searchType" value="nbcontent" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="nbcontent" />
				</c:otherwise>
			</c:choose>
			내용
			
			<input type="text" name="sk" value="${searchKeyword }"/>
			<input type="submit" value="검색" />			
		</div>
	</form>
</body>
</html>