<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평형 선택 모달창</title>
    <link rel="stylesheet" href="resources/css/modal.css">
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
    <h2>평형 선택</h2>
    
    <button onclick="openModal('sizeModal')">평형 선택</button>
    
    <div id="sizeModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('sizeModal')">&times;</span>
            <h3>평형을 선택해주세요</h3>
            <input type="number" id="pyeongInput" value="0">
            <button onclick="increasePyeong()">+</button>
            <button onclick="decreasePyeong()">-</button>
            <br><br>
            <button onclick="confirmSize()">확인</button>
        </div>
    </div>
    
    <script>
        let selectedPyeong = 0;
        
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
            document.getElementById("pyeongInput").value = selectedPyeong;
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }
        
        function increasePyeong() {
            selectedPyeong++;
            document.getElementById("pyeongInput").value = selectedPyeong;
        }
        
        function decreasePyeong() {
            if (selectedPyeong > 0) {
                selectedPyeong--;
                document.getElementById("pyeongInput").value = selectedPyeong;
            }
        }
        
        function confirmSize() {
            selectedPyeong = document.getElementById("pyeongInput").value;
            closeModal('sizeModal');
            // 선택한 평형 정보를 다음 단계에서 사용할 수 있도록 저장하거나 전달하는 로직을 추가해주세요.
            console.log("선택한 평형: " + selectedPyeong);
        }
    </script>
</body>
</html>