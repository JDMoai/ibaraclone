<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function selectOption() {
			$.ajax({
				type: "post",
				async: true,
				url: "optionSet",
				data: {
					"product_id" : "${product.product_id }",
					"option_id" : event.target.value
				},
				success: function(data) {
					var htmlText = "";
					for (var i in data) {
						htmlText = htmlText + '<option value="' + data[i].option_id + '">' + data[i].name + '</option>';
					}
					$("#subOptionSet").append(htmlText);
				}
			});
		}
	</script>
	<style>
		.selectedProductCard {
			disply: inline-block;
			width: 300px;
			height: 50px;
			background-color: #f0f0f0;
		}
	</style>
</head>
<body>
	
	<h3>product.jsp</h3>
	
	id: ${product.product_id } <br />
	이름: ${product.name } <br />

	<c:choose>
	
		<c:when test="${singleOption ne null }">
			<div class="selectedProductCard">
				${singleOption.name } <br />
				${singleOption.product_data_dto.price }
			</div>
		</c:when>
		
		<c:when test="${subOptionSet ne null }">
			<select name="optionSet" id="optionSet">
				<option selected disabled>${optionSet.name }</option>
				<c:forEach items="${options }" var="o">
					<option value="${o.option_id }">${o.name }</option>
				</c:forEach>
			</select>
			<select name="subOptionSet" id="subOptionSet">
				<option selected disabled>${subOptionSet.name }</option>
			</select>
		</c:when>
		
		<c:otherwise>
			<select name="optionSet" id="optionSet">
				<option selected disabled>${optionSet.name }</option>
				<c:forEach items="${options }" var="o">
					<option value="${o.option_id }">${o.name }&nbsp;&nbsp;
					${o.product_data_dto.price }원</option>
				</c:forEach>
			</select>
		</c:otherwise>
		
	</c:choose>
</body>
</html>