<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
String path=request.getContextPath();
%>
<meta charset="UTF-8">
<title>상품체크창</title>
 	<link rel="stylesheet" href="resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
</head>
<body>

<!-- 평수 선택 모달 창 영역 -->
	<div id="completeModal" class="modal" data-prev-modal="">
		<div class="modal_content">
			<div class="modal_leftside">
				<div class=modal_leftside_progress>
					<ul>
						<li data-step-name="services" class="">
							<div>
								<span>어떤 서비스가 필요하신가요?</span>
							</div>
						</li>
						<li data-step-name="service_select" class="">
							<div>
								<span>원하는 서비스 선택하기</span>
							</div>
						</li>
						<li data-step-name="ask" class="">
							<div>
								<span>추가질문</span>
							</div>
						</li>
						
						<li data-step-name="info" class="">
							<div>
								<span>정보입력</span>
							</div>
						</li>
						
						<li data-step-name="complete" class="">
							<div>
								<span>견적완료</span>
							</div>
						</li>
					</ul>
				</div>
				<div class="modal_leftside_content">
					<h4>견적 완료</h4>
					<div>견적이 완료되었습니다. 확인 후 1,2 영업일 내 연락 드리겠습니다.</div>
				</div>
				<div class="modal_leftside_question">
					<h5>바로문의</h5>
					123-456-7890
				</div>
			</div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>견적 완료</h3>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
					<div class="modal_center_body">
						<div class="row">

							<div class="item6">
								<div class="place">
									<label for="place_l">시공공간종류</label> <select
										placeholder="선택해주세요" class="place_s">
										<option value>선택해주세요</option>
										<option value="아파트">아파트</option>
										<option value="빌라">빌라</option>
										<option value="오피스텔">오피스텔</option>
										<option value="단독주택">단독주택</option>
									</select>
								</div>
							</div>
							<div class="item7">
								<div class="circs">
									<label for="circs_l">시공환경</label> <select placeholder="선택해주세요"
										class="circs_s">
										<option value>선택해주세요</option>
										<option value="신축(5년 미만)">신축(5년 미만)</option>
										<option value="구축(10년 이상)">구축(10년 이상)</option>
									</select>
								</div>
							</div>
							<div class="item8">
								<div class="addr">
									<label for="sample5_address"></label> <input type="text"
										id="sample5_address" placeholder="시공하실 주소를 입력해주세요"> <input
										type="button" id="sample5_address2"
										onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								</div>
							</div>
							<div class="item9">
								<div class="wantdate">
									<label for="wantdate_l">희망시공일자</label> <select
										placeholder="선택해주세요" class="wantdate_s">
										<option value>선택해주세요</option>
										<option value="1달 이내">1달 이내</option>
										<option value="1달~2달 이내">1달~2달 이내</option>
										<option value="2달~3달 이내">2달~3달 이내</option>
										<option value="3달 이후">3달 이후</option>
									</select>
								</div>
							</div>
							<div class="item10">
								<div class="wanttime">
									<label for="wanttime_l">희망상담시간</label> <select
										placeholder="선택해주세요" class="wanttime_s">
										<option value>선택해주세요</option>
										<option value="09:00~10:00">09:00~10:00</option>
										<option value="10:00~11:00">10:00~11:00</option>
										<option value="11:00~12:00">11:00~12:00</option>
										<option value="12:00~13:00">12:00~13:00</option>
										<option value="13:00~14:00">13:00~14:00</option>
										<option value="14:00~15:00">14:00~15:00</option>
										<option value="15:00~16:00">15:00~16:00</option>
										<option value="16:00~17:00">16:00~17:00</option>
										<option value="17:00~18:00">17:00~18:00</option>
									</select>
								</div>
							</div>
							<div class="item11">
								<div class="request">
									<label for="request_id"></label>
									<textarea placeholder="추가로 요청하실 사항이 있으시면 적어주세요!"
										class="request_ta" id="request_id" cols="60" rows="3"></textarea>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
var selectedItems = {};
var checkedItems = {};
$(document).ready(function() {
				var completeModal = $('#completeModal');
				
				function openModal(modalId) {
					$(modalId).css('display', 'block');	

				}

				function closeModal(modalId) {
					$(modalId).css('display', 'none');
				}

				$(document).on('click', '.close', function() {
					closeModal('#askModal');
				});

				
				
				
				
			});
</script>

</body>
</html>