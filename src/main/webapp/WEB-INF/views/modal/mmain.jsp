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
        var sizeModal = $('#sizeModal');
        var openSizeModalBtn = $('.openSizeModal');
        var closeSizeModalBtn = $('#closeSizeModal');
        var sizeInput = $('#sizeInput');
        var decreaseBtn = $('#decreaseSize');
        var increaseBtn = $('#increaseSize');
        var modalRightside = $('.modal_rightside');

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

        openSizeModalBtn.click(function() {
            var option = $(this).data('option');
            $('#sizeOption').val(option);
            modal.css('display', 'none');
            sizeModal.css('display', 'block');
        });

        closeSizeModalBtn.click(function() {
            sizeModal.css('display', 'none');
            modal.css('display', 'block');
        });

        decreaseBtn.click(function() {
            var currentSize = parseInt(sizeInput.val());
            if (currentSize > 1) {
                sizeInput.val(currentSize - 1);
            }
        });

        increaseBtn.click(function() {
            var currentSize = parseInt(sizeInput.val());
            if (currentSize < 100) {
                sizeInput.val(currentSize + 1);
            }
        });

        $('#confirmSize').click(function() {
            var selectedOption = $('#sizeOption').val();
            var selectedSize = sizeInput.val();
            modalRightside.append(`<div>선택한 옵션: ${selectedOption}</div><div>선택한 평수: ${selectedSize}평</div>`);
            sizeModal.css('display', 'none');
            modal.css('display', 'block');
        });
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
                        <img src="resources/img/modalimg/company.png" alt="Icon 1" class="icon1"> <span>업체 먼저 둘러보기</span>
                    </div>
                    </a>
                    <a href="#" class="openSizeModal" data-option="custom">
                    <div class="item2">
                        <img src="resources/img/modalimg/custom.png" alt="Icon 2" class="icon2"> <span>스탠다드 커스텀 인테리어 시공하기</span>
                    </div>
                    </a>
                    <a href="#" class="openSizeModal" data-option="premium">
                    <div class="item3">
                        <img src="resources/img/modalimg/premium.png" alt="Icon 3" class="icon3"> <span>프리미엄 커스텀 인테리어 시공하기</span>
                    </div>
                    </a>
                    <a href="">
                    <div class="item4">
                        <img src="resources/img/modalimg/kitchen.jpg" alt="Icon 4" class="icon4"> <span>주방만 시공하기</span>
                    </div>
                    </a>
                    <a href="">
                    <div class="item5">
                        <img src="resources/img/modalimg/bath.jpg" alt="Icon 5" class="icon5"> <span>욕실만 시공하기</span>
                    </div>  
                    </a>                   
                </div>
            </div>
        </div>
        <div class="modal_rightside">
            <!-- 선택한 옵션과 평수가 표시될 영역 -->
        </div>
    </div>
</div>

<!-- 평수 선택 모달 창 영역 -->
<div id="sizeModal" class="modal">
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
                <h3>평수 선택</h3>
                <span id="closeSizeModal" class="close">&times;</span>
            </div>
            <div class="sizeModal_center_body">              
                <div>
                <h3>평형을 알려주세요.</h3>
                <div class="max_size">최대 평형 99</div>
                <div ><input type="hidden" id="sizeOption" value=""></div>
                <div class="size-control">
                    <button id="decreaseSize">-</button>
                    <input type="number" id="sizeInput" value="10" min="1" max="100" readonly>
                    <button id="increaseSize">+</button>
                </div>
                </div>
            </div>
				<div class="modal_center_footer">
					<button id="privBtn">이전</button>
					<button id="nextBtn">다음</button>
				</div>
			</div>
    </div>
</div>

</body>
</html>