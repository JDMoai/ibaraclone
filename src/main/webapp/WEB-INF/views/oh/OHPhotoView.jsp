<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OH - OHPhotoView.jsp</title>
	<link rel="stylesheet" href="../resources/css/oh.css" />	
</head>
<body>

	<div class="container">
		
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<li><a href="">집영상</a></li>
					<li><a href="">#category</a></li>
				</ul>
			</div>							
						
			<h3>집사진</h3>
				
			<button><a href="OHPhotoWriteView">글쓰기</a></button>
				
			<hr />				
				
			<form action="">
				
				<label for="sorting">정렬</label>
				<select name="sorting" id="sorting">
					<option value="">선택</option>
					<option value="latest">최신순</option>
					<option value="popular">인기순</option>
					<option value="views">조회순</option>
				</select>
				
				<label for="sortingMethod">정렬방식</label>
				<select name="sortingMethod" id="sortingMethod">
					<option value="">선택</option>
					<option value="ascending">오름차순</option>
					<option value="descending">내림차순</option>
				</select>
				
				<br />
				<hr />				
				
				<label for="residence">주거형태</label>
				<select name="residence" id="residence">
					<option value="">선택</option>
					<option value="">원룸&오피스텔</option>
					<option value="">아파트</option>
					<option value="">빌라&연립</option>
					<option value="">단독주택</option>
					<option value="">사무공간</option>
					<option value="">상업공간</option>
					<option value="">기타</option>
				</select>				
				
				<label for="room">공간</label>
				<select name="room" id="room">
					<option value="">선택</option>
					<option value="">원룸</option>
					<option value="">거실</option>
					<option value="">침실</option>
					<option value="">주방</option>
					<option value="">욕실</option>
					<option value="">아이방</option>
					<option value="">드레스룸</option>
					<option value="">서재&작업실</option>
					<option value="">베란다</option>
					<option value="">사무공간</option>
					<option value="">상업공간</option>
					<option value="">가구&소품</option>
					<option value="">현관</option>
					<option value="">외관&기타</option>
				</select>								
				
				<label for="style">스타일</label>
				<select name="style" id="style">
					<option value="">선택</option>
					<option value="">모던</option>
					<option value="">북유럽</option>
					<option value="">빈티지</option>
					<option value="">내추럴</option>
					<option value="">프로방스&로맨틱</option>
					<option value="">클래식&앤틱</option>
					<option value="">한국&아시아</option>
					<option value="">유니크</option>
				</select>								
				
				<label for="skill">셀프/전문가</label>
				<select name="skill" id="skill">
					<option value="">선택</option>
					<option value="">셀프</option>
					<option value="">전문가</option>
				</select>								
				
				<br />
				<hr />					
				
				<label for="search">검색기준</label>
				<select name="search" id="search">
					<option value="">선택</option>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">#category</option>
				</select>				
			
				<input type="text" name="" value="" />
				<input type="submit" name="" value="검색" />
			
			</form>
			
			<div class="OHPhotoViewflexContainer">
				<!-- 1번 <div class="box"> 테이블 표현 -->			
				<div class="box">
					<table width="500" border="1">
						<!-- 테이블 제목 -->
						<tr>
							<th>번호</th>
							<th>사용자</th>
							<th>제목</th>
							<th>내용</th>
						</tr>
						<!-- 테이블 내용 -->
						<c:forEach items="${ohPhotoView }" var="dto">
							<tr>
								<td>${dto.pb_no }</td>
								<td>${dto.pb_user }</td>
								<td>${dto.pb_title }</td>
								<td>${dto.pb_content }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 전체 <div class="box"> 반복문 사용, 게시물 표현 -->
				<c:forEach items="${ohPhotoView }" var="dto" varStatus="status">
					<div class="box">
						<div>pb_no: ${dto.pb_no }</div>
						<div>pb_user: ${dto.pb_user }</div>	
						<div>pb_title: ${dto.pb_title }</div>	
						<div>pb_content: ${dto.pb_content }</div>
						<div>pa_no: ${dto.ohPhotoAttach.pa_no }</div>
						<div>pa_attach: ${dto.ohPhotoAttach.pa_attach }</div>
						<div>pb_no: ${dto.ohPhotoAttach.pb_no }</div>
						<a href="OHPhotoDetailView?pb_no=${dto.pb_no }">
							<img src="../resources/upload/oh/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진" height="300px" width="300px"/>
						</a>
					</div>
				</c:forEach>
	
			</div>
			
		</div>
			
		<footer>
			<h1>footer</h1>
		</footer>
	</div>	
	
</body>
</html>