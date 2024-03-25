<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>mStandard.jsp</title>
    <link rel="stylesheet" href="resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>


<!--모달 창 영역 -->
<div id="standardModal" class="modal2">
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
                    <li data-step-name="biz" class="">
                        <div>
                            <span>업체추천</span>
                        </div>
                    </li>
                    <li data-step-name="info" class="">
                        <div>
                            <span>정보입력</span>
                        </div>
                    </li>
                    <li data-step-name="date" class="">
                        <div>
                            <span>날짜선택</span>
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
                <h4>원하는 서비스 선택하기</h4>
                <div>원하는 서비스를 클릭 해 주세요.</div>
            </div>
            <div class="modal_leftside_question">
                <h5>바로문의</h5>
                123-456-7890
            </div>
        </div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>서비스를 선택해 주세요</h3>
					<span id="closeStandardModal" class="close">&times;</span>
				</div>
				<div class="standardModal_center_body">
					<div>
						<div>					
							<!-- db 데이터 넣는 곳 -->
						</div>
					
				
					</div>
				</div>
				<div class="modal_center_footer">
					<button id="privBtn">이전</button>
					<button id="nextBtn2">다음</button>	
					
					
				</div>
			</div>
			<div class="modal_rightside">
				<div class="modal_rightside_header">
				<p>요약</p>
				</div>
				<div class="service_box">
				<div class="selectedSize" ></div>
				<div class="selectedService" >
					<span id="selectedService"></span>
				</div>
				</div>
				
			</div>
		</div>
</div>
<script>
    $(document).ready(function() {
        var standardModal = $('#standardModal');
        var privBtn = $('#privBtn');
        var nextBtn2 = $('#nextBtn2');
        var closeStandardModal = $('#closeStandardModal');

        privBtn.click(function() {
            standardModal.css('display', 'none');
            $('#sizeModal').css('display', 'block');
        });

        nextBtn2.click(function() {
            // 다음 단계로 진행하는 로직 구현
            // 선택한 서비스 정보를 저장하고 다음 모달 창을 표시하거나 서버로 데이터 전송
            // ...
        });

        closeStandardModal.click(function() {
            standardModal.css('display', 'none');
        }); 
    });

</script>


</body>
</html>