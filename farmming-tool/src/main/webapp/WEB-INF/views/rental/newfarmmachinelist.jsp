<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="/farmingtool/resources/js/rentallist.js"></script>

<div id="ac2">
<h6 style="color: blue">대여 희망 기계를 선택해주세요</h6>
	<select id="machine1" name="machine1" class="rental_option2">
		<option value="" selected="selected">기계선택1-대분류</option>
		<c:forEach var="type" items="${types}" >
			<option value="${type.typeNo}">${type.typeName}</option>
		</c:forEach>
	</select> &nbsp;
	<select id="machine2" class="rental_option2">
		<option value="" class="basic_type" selected="selected">기계선택2-소분류</option>
		<c:forEach var="farmMachine" items="${farmMachineList}" >
			<option value="${farmMachine.fmNo}" class="${farmMachine.typeNo}" style="display: none">${farmMachine.fmName}</option>
		</c:forEach>
	</select> &nbsp;
</div>
