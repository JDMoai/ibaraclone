<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>modalmain</title>
    
   <link rel="stylesheet" href="resources/css/modal.css">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script> 
    $(document).ready(function() {
        var modal = $('#myModal');
        var btn = $('#openModal');
        var span = $('.close');  

        btn.click(function() {
            modal.css('display', 'block');
        });

        span.click(function() {
            modal.css('display', 'none');
            sizeModal.css('display', 'none');
        });

        $(window).click(function(event) {
            if (event.target == modal[0]) {
                modal.css('display', 'none');
            }
        });

        $('.openSizeModal').click(function(){
            var option = $(this).data('option');
            $('#modalFrame').attr('src', 'modal/mSize?option=' + option);
            $('.modal_center').hide();
            $('.modal_rightside').show();
        });
        window.addEventListener('message', function(event) {
            if (event.origin !== window.location.origin)           
            	return;
            var selectedOption = event.data.option;
            var selectedSize = event.data.size;
            $('.modal_center').show(); // 모달창의 중앙 부분을 다시 표시합니다.
            $('.modal_rightside').hide(); // 모달창의 오른쪽 부분을 숨깁니다.
            // 선택한 옵션과 평수 값을 표시하는 코드를 추가합니다.
            // ...
        }, false);
    });
</script>


	<!-- 모달 창 영역 -->
	<div id="myModal" class="modal">
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
					<h4>어떤 서비스가 필요하신가요?</h4>
					<div>필요한 서비스를 선택해 주세요.</div>
				</div>
				<div class="modal_leftside_question">
					<h5>바로문의</h5>
					123-456-7890
				</div>
			</div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>서비스 선택</h3>
					<span class="close">&times;</span>
				</div>
				<div class="modal_center_body">
					<div class="row">
						<a href="">
							<div class="item1">
								<img src="resources/img/modalimg/company.png" alt="Icon 1"
									class="icon1"> <span>업체 먼저 둘러보기</span>
							</div>
						</a> <a href="#" class="openSizeModal" data-option="custom">
							<div class="item2">
								<img src="resources/img/modalimg/custom.png" alt="Icon 2"
									class="icon2"> <span>스탠다드 커스텀 인테리어 시공하기</span>
							</div>
						</a> <a href="#" class="openSizeModal" data-option="premium">
							<div class="item3">
								<img src="resources/img/modalimg/premium.png" alt="Icon 3"
									class="icon3"> <span>프리미엄 커스텀 인테리어 시공하기</span>
							</div>
						</a> <a href="">
							<div class="item4">
								<img src="resources/img/modalimg/kitchen.jpg" alt="Icon 4"
									class="icon4"> <span>주방만 시공하기</span>
							</div>
						</a> <a href="">
							<div class="item5">
								<img src="resources/img/modalimg/bath.jpg" alt="Icon 5"
									class="icon5"> <span>욕실만 시공하기</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="modal_rightside" style="display: none;">
				 <iframe id="modalFrame" src="" frameborder="0" style="width: 100%; height: 100%;"></iframe>
			</div>
		</div>
	</div>


</body>
</html>