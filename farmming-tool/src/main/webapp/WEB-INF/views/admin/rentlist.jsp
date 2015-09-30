<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.history').on('click', '.status', function() {
			var id = $(this).parents('.historyItem').attr('id');
			var status = $(this).attr('id');
			var current = $(this);
			
			$.ajax({
				url: 'changeStatus.action',
				type: 'post',
				data : {
					'historyNo' : id,
					'status' : status
				},
				success : function() {
					if(status == 1) {
						current.attr('id', '2');
						current.attr('value', '대여 대기');
					} else if(status == 2) {
						current.attr('id', '3');
						current.attr('value', '대여 중');
					} else if(status == 3) {
						current.attr('id', '4');
						current.attr('value', '대여 완료');
						current.attr('disabled', 'disabled');
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<table class="history" style="border: solid 1px">
	<tr>
		<th>대여번호</th>
		<th>이름</th>
		<th>아이디</th>
		<td>기계명</td>
		<td>대여날짜</td>
		<td>상태</td>
	</tr>
		<c:forEach var="history" items="${ historys }">
			<tr class="historyItem" id="${ history.historyNo }">
				<th>${ history.historyNo }</th>
				<th>${ history.memberName }</th>
				<th>${ history.memberId }</th>
				<td>${ history.machineName }</td>
				<td>${ history.historyRentalDateToString }</td>
				<td>
				<c:choose>
					<c:when test="${ history.historyStatus == 1 }">
						<input type="button" id="${ history.historyStatus }" class="status" value="대여 승인 대기">
					</c:when>
					<c:when test="${ history.historyStatus == 2}">
						<input type="button" id="${ history.historyStatus }" class="status" value="대여 대기">
					</c:when>
					<c:when test="${ history.historyStatus == 3}">
						<input type="button" id="${ history.historyStatus }" class="status" value="대여 중">
					</c:when>
					<c:when test="${ history.historyStatus == 4}">
						<input type="button" disabled id="${ history.historyStatus }" class="status" value="대여 완료">
					</c:when>
					<c:otherwise>
						<input type="button" id="${ history.historyStatus }" class="status" value="알 수 없음">
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>