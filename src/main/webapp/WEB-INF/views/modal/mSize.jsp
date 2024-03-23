<%@ page language="java" contentType="text/html; charset=UTF-8"
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
   <div id="sizeModal" class="modal">
    <div class="modal-content">
        <span id="closeSizeModal" class="close">&times;</span>
        <h3>평형을 알려주세요.</h3>
        <div class="size-control">
            <button id="decreaseSize">-</button>
            <input type="number" id="sizeInput" value="10" min="1" max="100" readonly>
            <button id="increaseSize">+</button>
        </div>
        <p>평</p>
        <input type="hidden" id="sizeOption" value="">
        <button id="confirmSize">다음</button>
    </div>
</div>

<script>
    $(document).ready(function() {
        var sizeInput = $('#sizeInput');
        var decreaseBtn = $('#decreaseSize');
        var increaseBtn = $('#increaseSize');

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
            window.opener.postMessage({ option: selectedOption, size: selectedSize }, '*');
            window.close();
        });
    });
</script>
</body>
</html>