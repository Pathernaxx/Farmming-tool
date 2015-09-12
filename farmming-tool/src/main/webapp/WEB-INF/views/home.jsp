<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
</head>
<style>
.container {
  width: 100%;
  height: 100%;
  margin: 0 0 auto;
  background-image: url('/farmingtool/resources/images/mainback.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
</style>
<body>
<div class="container">
  <div class="outer">
    <div class="inner">
      <input type="button" name="rental" value="대여" onclick="location.href='/farmingtool/rental/rentalmain.action'">
      <input type="button" name="사전" value="사전" onclick="location.href='/farmingtool/dictionary/view.action'"> 
    </div>
  </div>
</div>
</body>
</html>
