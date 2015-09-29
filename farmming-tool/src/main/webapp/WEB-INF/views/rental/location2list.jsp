<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="/farmingtool/resources/js/rentallist.js"></script>

<select id="location2" class="rental_option">
	<option value="" class="" selected="selected">지역선택2-시/군/구</option>
	<c:forEach var="location2" items="${location2s}" >
		<option value="${location2.locationNo2}" class="" >${location2.locationName2}</option>
	</c:forEach>
</select><br/><br/>


