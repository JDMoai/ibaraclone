<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String selectedItems = request.getParameter("selectedItems");
    String checkedItems = request.getParameter("checkedItems");
    
    session.setAttribute("selectedItems", selectedItems);
    session.setAttribute("checkedItems", checkedItems);
%>
</body>
</html>