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
				<div class="Modal_center_header">
					<h3>추가 질문</h3>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
				<div class="Modal_center_body">
					<div>
						<div class="">
					
						</div>	
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
							<div id="checkedItems"></div>
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
					<div id="selectedItems">
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
					if (modalId === '#askModal') {
				        setTimeout(function() {
				            updateSelectedItems();
				            updateTotalPrice();
				        }, 0);
				    }
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
				// 선택한 상품들을 업데이트하는 함수
			    function updateSelectedItems() {
			    	console.log('Updating Selected Items...');
			        var selectedItemsDiv = $('#selectedItems');
			        selectedItemsDiv.empty();

			        for (var itemName in selectedItems) {
			            if (selectedItems.hasOwnProperty(itemName)) {
			                var item = selectedItems[itemName];
			                var itemPrice = item.price;
			                var itemQuantity = item.quantity;
			                var totalPrice = itemPrice * itemQuantity;
			                var itemDiv = $('<div>').text(itemName);
			                var priceDiv = $('<div>').text(totalPrice + '만원');
			                selectedItemsDiv.append(itemDiv).append(priceDiv);
			            }
			        }

			        var checkedItemsDiv = $('#checkedItems');
			        checkedItemsDiv.empty();

			        var isFirst = true;

			        for (var itemName in checkedItems) {
			            if (checkedItems.hasOwnProperty(itemName)) {
			                var itemText = itemName;
			                if (isFirst) {
			                    itemText = '추가 ' + itemText;
			                    isFirst = false;
			                }
			                
			                var itemDiv = $('<div id="itemText">').text(itemText);
			                checkedItemsDiv.append(itemDiv);
			            }
			        }
			    }

			    // 총 가격을 업데이트하는 함수
			    function updateTotalPrice() {
			    	console.log('Updating Total Price...');
			        var totalPrice = 0;
			        for (var itemName in selectedItems) {
			            if (selectedItems.hasOwnProperty(itemName)) {
			                var item = selectedItems[itemName];
			                var itemPrice = item.price;
			                var itemQuantity = item.quantity;
			                totalPrice += itemPrice * itemQuantity;
			            }
			        }
			        $('#totalPriceValue').text(totalPrice + ' 만원');
			    }

				askModal.on('show', function() {
				    // 세션에서 선택한 상품 정보와 체크된 항목 정보를 가져옴
				    var selectedItems = '${sessionScope.selectedItems}';
			        var checkedItems = '${sessionScope.checkedItems}';

			        console.log('Selected Items from Session:', selectedItems);
			        console.log('Checked Items from Session:', checkedItems);
			        
			        if (selectedItems && checkedItems) {
			        	console.log('Selected Items:', selectedItems);
			            console.log('Checked Items:', checkedItems);
			            
			            selectedItems = JSON.parse(selectedItems);
			            checkedItems = JSON.parse(checkedItems);
			            
				        window.selectedItems = selectedItems;
				        window.checkedItems = checkedItems;
				        
				        updateSelectedItems();
				        updateTotalPrice();
				        
				        // 체크된 항목 표시
				        var checkedItemsDiv = $('#checkedItems');
				        checkedItemsDiv.empty();
				        
				        for (var itemName in checkedItems) {
				            if (checkedItems.hasOwnProperty(itemName)) {
				                var itemDiv = $('<div>').text(itemName);
				                checkedItemsDiv.append(itemDiv);
				            }
				        }
				       
				    }
				});
				
			});
</script>

</body>
</html>