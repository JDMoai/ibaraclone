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
<div id="askModal" class="modal" data-prev-modal="">
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
                <h4>추가 질문</h4>
                <div>현장환경에 따라 시공비/운임비/운송비/양중비(기타비용)이 추가 될 수 있습니다.</div>
            </div>
            <div class="modal_leftside_question">
                <h5>바로문의</h5>
                123-456-7890
            </div>
        </div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>추가 질문</h3>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
				<div class="modal_center_body">
                <div class="row">               
                    <div class="item6">
                        <span>item6</span>
                    </div>
                    <div class="item7">
                       	<input type="text" id="sample5_address" placeholder="희망시공 주소를 입력해주세요" >
						<input type="button" id="sample5_address2" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                    </div>
                    <div class="item8">
                        <span>item8</span>
                    </div>
                    </a>                                      
                </div>
                	
            </div>
				</div>
				
				<div class="modal_center_footer">
					<button id="askPrivBtn">이전</button>
					<button id="askNextBtn">다음</button>	
						
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
						<div id="totalPriceValue">0 만원</div>
					</div>
				</div>
			</div>
		</div>
</div>


<script>
var selectedItems = {};
var checkedItems = {};
$(document).ready(function() {
				var askModal = $('#askModal');
				
				function openModal(modalId) {
					$(modalId).css('display', 'block');	

				}

				function closeModal(modalId) {
					$(modalId).css('display', 'none');
				}

				$(document).on('click', '.close', function() {
					closeModal('#askModal');
				});

				$(document).on('click', '#askPrivBtn', function() {
					closeModal('#askModal');
					openModal('#serviceCheckModal');
				});
				
			});
</script>


<!-- 주소api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4efcfe1bb89f6b2d141d4e7298e8efee&libraries=services"></script>
<script>
    
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                
            }
        }).open();
        new daum.Postcode({
            onclose: function(state) {
                //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                if(state === 'FORCE_CLOSE'){
                    //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

                } else if(state === 'COMPLETE_CLOSE'){
                    //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                    //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
                }
            }
        });
        
    }
    
</script>
</body>
</html>