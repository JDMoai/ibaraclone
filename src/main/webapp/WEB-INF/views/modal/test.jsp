<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>평수 선택</title>
    <link rel="stylesheet" href="resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
    $(document).ready(function() {
    	var sizeInput = $('#sizeInput');
        var decreaseBtn = $('#decreaseSize');
        var increaseBtn = $('#increaseSize');
   
        
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
        $('#closeSizeModal').click(function() {
            window.parent.postMessage({ action: 'close' }, '*');
        });
    });
</script>



<!-- 모달 창 영역 -->
	<div id="sizeModal" class="modal">
		<div class="modal_content">
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>평형을 알려주세요.</h3>
				</div>
				<div class="modal_center_body">
					<div class="size-control">
						<button id="decreaseSize">-</button>
						<input type="number" id="sizeInput" value="10" min="1" max="100"
							readonly>
						<button id="increaseSize">+</button>
					</div>
					
					<input type="hidden" id="sizeOption"
						value="<%= request.getParameter("option") %>">
					
				</div>
				<div class="modal_center_footer2">
					<button id="privBtn">이전</button>
					<button id="nextBtn">다음</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html> --%>