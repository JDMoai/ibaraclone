<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="UTF-8">
<title>고객정보창</title>
<link rel="stylesheet" href="resources/css/modal.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- mInfo.jsp -->
	<!-- 평수 선택 모달 창 영역 -->
	<div id="infoModal" class="modal" data-prev-modal="">
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
					<h4>정보 입력</h4>
					<div>연락을 드릴 수 있는 고객님의 정보를 입력해 주세요!</div>
				</div>
				<div class="modal_leftside_question">
					<h5>바로문의</h5>
					123-456-7890
				</div>
			</div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>고객 정보 입력</h3>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
					<div class="modal_center_body">
						<div class="infoRow">
							<div class="users"></div>
							<form id="nonMemberForm"
								action="<%=request.getContextPath()%>/modal/insertNonMember"
								method="post">
								<div class="item12">
									<label for="name">성함</label> <input type="text" id="name"
										name="name" required>
								</div>
								<div class="item13">
									<label for="email">이메일</label> <input type="email" id="email"
										name="email" required>
								</div>
								<div class="item14">
									<label for="phone">전화번호</label> <input type="tel" id="phone"
										name="phone" class="phone" required>
								</div>
								<div class="item15">
									<label for="password">비밀번호</label> <input type="password"
										id="password" name="pw" required>
								</div>
								<div class="item16">
									<label for="confirmPassword">비밀번호확인</label> <input
										type="password" id="confirmPassword" name="confirmPassword"
										required>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="modal_center_footer">
					<button id="infoPrivBtn">이전</button>
					<button id="infoNextBtn">다음</button>

				</div>
			</div>

			<div class="modal_rightside">
				<div class="modal_rightside_header">
					<p>요약</p>
				</div>
				<div class="modal_rightside_body">
					<div class="service_box">
						<div class="selectedSize"></div>
						<div class="selectedService">
							<span id="selectedService"></span>
							<div class="checkedItems" id="checkedItems">
								<!-- 선택한 상품들을 동적으로 생성 -->
							</div>
						</div>
						<div class="questionAsk" id="questionAsk">
							<div>
								시공공간종류: <span class="place_result" id="place_result"></span>
							</div>
							<div>
								시공환경: <span class="circs_result" id="circs_result"></span>
							</div>
							<div>
								시공주소: <span class="addr_result" id="addr_result"></span>
							</div>
							<div>
								희망시공일자: <span class="wantdate_result" id="wantdate_result"></span>
							</div>
							<div>
								희망상담시간: <span class="wanttime_result" id="wanttime_result"></span>
							</div>
							<div>
								추가요청사항: <span class="request_result" id="request_result"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal_rightside_footer">
					<div class="expPrice">예상 견적</div>
					<div>
						<div class="selectedService">
							<span id="selectedService"></span>
						</div>
					</div>
					<div class="selectedItems" id="selectedItems">
						<!-- 선택한 상품들을 동적으로 생성 -->
					</div>
					<div class="totalPrice">
						<div>합계</div>
						<div class="totalPriceValue">0 만원</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
var selectedItems = {};
var checkedItems = {};
$(document).ready(function() {
				var infoModal = $('#infoModal');
				
				function openModal(modalId) {
					$(modalId).css('display', 'block');	

				}

				function closeModal(modalId) {
					$(modalId).css('display', 'none');
				}

				$(document).on('click', '.close', function() {
					closeModal('#infoModal');
				});

				$(document).on('click', '#infoPrivBtn', function() {
					closeModal('#infoModal');
					openModal('#askModal');
				});
				
				$(document).on('click', '#infoNextBtn', function() {
					 var password = $('#password').val();
					    var confirmPassword = $('#confirmPassword').val();
					    
					    if (password !== confirmPassword) {
					        alert('비밀번호가 일치하지 않습니다.');
					        return;
					    }
					    
					    
					    var modalCompleteDto = {
					            m_addr: $('.addr_result').text(),
					            m_tel: $('.phone').val(),
					            m_content: $('.selectedService').text(),
					            m_size: $('.selectedSize').text(),
					            m_request: $('.request_result').text(),
					            m_price: $('.totalPriceValue').text(),
					            m_wanttime: $('.wanttime_result').text(),
					            m_wantdate: $('.wantdate_result').text(),
					            m_circs: $('.circs_result').text(),
					            m_place: $('.place_result').text(),
					            m_type: $('#selectedService').text()
					        };
					    
					    
					    $.ajax({
					        type: 'POST',
					        url: '<%=path%>/modal/insertNonMember',
					        data: $('#nonMemberForm').serialize(),
					        success: function(response) {
					            openModal(response);

					            $.ajax({
					                type: 'POST',
					                url: '<%=path%>/modal/updateModalComplete',
					                data: JSON.stringify(modalCompleteDto),
					                contentType: 'application/json',
					                success: function() {
					                    // 업데이트 성공 시 처리할 로직
					                    alert('견적이 완료되었습니다.');
					                    closeModal('#infoModal');
					                    openModal('#completeModal');
					                },
					                error: function() {
					                    alert('AJAX updateModalComplete = 오류가 발생했습니다.');
					                }
					            });
					        },
					        error: function() {
					            alert('AJAX insertNonMember = 오류가 발생했습니다.');
					        }
					   
					           
				});
			});
});

// updateModalComplete 메서드 호출
<%-- $.ajax({
    type: 'POST',
    url: '<%=path%>/modal/updateModalComplete',
    data: JSON.stringify(modalCompleteDto),
    success: function() {
        // 업데이트 성공 시 처리할 로직
        alert('견적이 완료되었습니다.');
        closeModal('#infoModal');
        openModal('#completeModal');
    },
    error: function() {
        alert('updateModalComplete = 오류가 발생했습니다.');
    }
});
},
error: function() {
alert('insertNonMember = 오류가 발생했습니다.');
} --%>

</script>

</body>
</html>