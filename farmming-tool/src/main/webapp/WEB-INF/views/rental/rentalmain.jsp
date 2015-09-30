<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FARM MACHINE</title>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
 
    <link rel='Stylesheet' href='/farmingtool/resources/styles/rentalmain.css' />
    <script src="/farmingtool/resources/js/rentallist.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Calendar CSS -->
	<link rel="stylesheet" href="/farmingtool/resources/styles/zabuto_calendar.min.css">
	<link rel="stylesheet" href="/farmingtool/resources/styles/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>

	<!-- Calendar Theme JavaScript -->
	<script src="/farmingtool/resources/js/zabuto_calendar.min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function (){
	  $(".ajaxfarmlist").click(function( event ) {
	      var fmID = $(this).attr('id'); 
	         $("#sp1").empty();
	         
	         $.ajax({
	            url : "/farmingtool/dictionary/ajaxfmList.action",
	            async : false,
	            type : "GET",
	            data : {
	               typeNo : fmID
	            },
	            success : function(fmBytypeNo){
	               if (fmBytypeNo != null){
	                  $.each(fmBytypeNo, function(index, listitem){
	                     var html=

			       			  "<div class='item' >"+
			  					"<div class='detail1' style='float: left; border: .3em'>"+
			  					  "<img src='/farmingtool/resources/images/fmimage/"+listitem.fmPicture+"' width='200px' height='180px' style='padding-right: 4px'>"+
			  					    "<p>"+listitem.fmName+"</p>"+
			  						"<hr />"+
			  					"</div>"+
			  					"<div class='detail2' style='float: left; border: .3em; width: 500px;height: 498px; overflow: auto;'>"+
			  					 "<table>"+
			  					  "<tr>"+
								  "<td><br>⊙ 구조 <br>"+listitem.fmStructure+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 기능및용도 <br>"+listitem.fmFunction+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 종류 <br>"+listitem.fmKinds+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 보급과정 <br>"+listitem.fmDimentions+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 부착용작업기 <br>"+listitem.fmWorkingMachine+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 특징 <br>"+listitem.fmCharacteristic+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 개요 <br>"+listitem.fmOutline+"</td>"+
								  "</tr>"+
								  "<tr>"+
								   "<td><br>⊙ 필요성 <br>"+listitem.fmNecessity+"</td>"+
								  "</tr>"+					  
								 "</table>"+
								"</div>"+
						      "</div>";
	                        
	                  $("#sp1").append($(html)); 
	                     
	                  });
	                  
	               }
	               else{
	                  alert("success but exception");
	               }
	               
	            },
	            error : function(){
	               alert("error");
	            }
	         });
	         event.preventDefault(); 
	         
	      });
	  
	  
	  
	  
	  
	  $("#searchbutton").click(function( event ) {
		  var searchword = $("#searchword").val();
		  	
	         $("#sp1").empty();
	         
	         $.ajax({
	            url : "/farmingtool/dictionary/ajaxfmSearch.action",
	            async : false,
	            type : "GET",
	            data : {
	            	searchword : searchword
	            },
	            success : function(fmSearchList){
	            	
	            	 if (fmSearchList != null && fmSearchList.length > 0){
		                  $.each(fmSearchList, function(index, listitem){
			                     var html=
					       			  "<div class='item' >"+
					  					"<div class='detail1' style='float: left; border: .3em'>"+
					  					  "<img src='/farmingtool/resources/images/fmimage/"+listitem.fmPicture+"' width='200px' height='180px' style='padding-right: 4px'>"+
					  					    "<p>"+listitem.fmName+"</p>"+
					  						"<hr />"+
					  					"</div>"+
					  					"<div class='detail2' style='float: left; border: .3em; width: 500px;height: 498px; overflow: auto;'>"+
					  					 "<table>"+
					  					  "<tr>"+
										  "<td><br>⊙ 구조 <br>"+listitem.fmStructure+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 기능및용도 <br>"+listitem.fmFunction+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 종류 <br>"+listitem.fmKinds+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 보급과정 <br>"+listitem.fmDimentions+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 부착용작업기 <br>"+listitem.fmWorkingMachine+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 특징 <br>"+listitem.fmCharacteristic+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 개요 <br>"+listitem.fmOutline+"</td>"+
										  "</tr>"+
										  "<tr>"+
										   "<td><br>⊙ 필요성 <br>"+listitem.fmNecessity+"</td>"+
										  "</tr>"+					  
										 "</table>"+
										"</div>"+
								      "</div>";
			                  	$("#sp1").append($(html)); 
			                     
			                  });		            		 
	            	 }else{
	            		 var html = "<div>"+
		  					"<div class='detail1'>"+
		  					"올바른 검색어를 입력하세요."+
		  					"</div>"+
						      "</div>";
	            		 $("#sp1").append($(html)); 
	            	 }
	            },
	            error : function(){
		               alert("error");
		        }
	          });
	  });
    });
    function myDateFunction(id, fromModal, selected1, selected2) {
    	
    	if('${loginuser}' == null || '${loginuser}' == ""){
    		alert("대여는 로그인 후 이용가능 합니다.");
    		$(location).attr("href", "/farmingtool/account/login.action");
    	}
    	
        $("#date-popover").hide();
        if (fromModal) {
            $("#" + id + "_modal").modal("hide");
        }
        var date = $("#" + id).data("date");
        var hasEvent = $("#" + id).data("hasEvent");
        if (hasEvent && !fromModal) {
            return false;
            
        }
        
        $("#date-popover-content").html('<br/>선택한 날짜 : ' + date + '<br/>'+'예약하시겠습니까?<br/><br/>'+
        								'<input type="hidden" value="'+date+'" id="rentalDate"/>'+
        								'<input type="text" value="'+selected1+'" id="locationNo2"/>'+
        								'<input type="text" value="'+selected2+'" id="fmNo"/>'+
        								'<input type="button" value="확인" onclick="moveToCheckRental()"/>&nbsp;'+
        								'<input type="button" value="취소" onclick="popoverClose()"/><br/>');
        $("#date-popover").show();
        return true;
    }
	
    
    function popoverClose() {
    	$("#date-popover").hide();
    }
    
    function moveToCheckRental() {
    	//컨트롤러에서 예약처리
    	var rentalDate = $("#rentalDate").val();
    	var fmNo = $("#fmNo").val();
    	var locationNo2 = $("#locationNo2").val();
    	$.ajax({
    		url: "/farmingtool/rental/rentalMachine.action",
    		type: "POST",
    		async: true,
    		data: {
    			"rentalDate" : rentalDate,
    			"locationNo2" : locationNo2,
    			"fmNo" : fmNo
    			},
    		success: function(result) { //result
    			if(result != null)
				{
    				alert("예약 성공 : 확인 페이지로 이동합니다."+result)
					var returnurl = '/farmingtool/rental/moveToCheckRental.action?machineNo='+result;
					$(location).attr('href', returnurl);
				} else {
					$("#date-popover").hide();
					alert("예약 실패 : 모든 기계가 대여 중입니다. 다른 날짜를 선택해주세요.");
				}
    		},
    		error: function() {
    			alert("예약 실패 : 다시 시도해주세요.");
    		}
    	});
    }
    
    </script>
    
    
    
<style>
.item {
    width: 200px;
    height: 250px;
    border: 3px solid;
    margin: 5px;
    float: left;
 }
</style>

</head>
<body>
       <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/farmingtool/home.action">대여통</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	
				<li><i class="fa fa-user fa-fw"></i></li>
				<c:choose>
					<c:when test="${ loginuser eq null }">
						<li><a href="/farmingtool/account/login.action"><p>로그인</p></a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ USERTYPE eq 'ADMIN' }">
								<li>
								  <div class="dropdown">
									  <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">${ loginuser.adminName }
									  <span class="caret"></span></button>
									  <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									    <li role="presentation"><a role="menuitem" href="/farmingtool/admin/rentallist.action">관리자페이지</a></li>
									    <li role="presentation" class="divider"></li>
									    <li role="presentation"><a role="menuitem" href="/farmingtool/account/logout.action">로그아웃</a></li>
									  </ul>
									</div>								
								</li>
							</c:when>
							<c:otherwise>
								<li>
								  <div class="dropdown">
									  <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">${ loginuser.memberName }
									  <span class="caret"></span></button>
									  <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									    <li role="presentation"><a role="menuitem" href="#">회원정보</a></li>
									    <li role="presentation" class="divider"></li>
									    <li role="presentation"><a role="menuitem" href="/farmingtool/account/logout.action">로그아웃</a></li>
									  </ul>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						
					</c:otherwise>
				</c:choose>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" id="searchword" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" id="searchbutton" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/farmingtool/rental/rentalmain.action"><i class="fa fa-dashboard fa-fw"></i> 대여</a>
                        </li>
                        <li>
                            <a href="#" class="ajaxfarmlist" id=""><i class="fa fa-wrench fa-fw"></i>농기계<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="#">사용/분류 <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#" id="A" class="ajaxfarmlist">가공기계류</a>
                                        </li>
                                        <li>
                                            <a href="#" id="B" class="ajaxfarmlist">경운기및부속작업</a>
                                        </li>
                                        <li>
                                            <a href="#" id="C" class="ajaxfarmlist">관리기계류</a>
                                        </li>
                                        <li>
                                            <a href="#" id="D" class="ajaxfarmlist">관리기및부속작업</a>
                                        </li>
                                         <li>
                                            <a href="#" id="E" class="ajaxfarmlist">기타기계류</a>
                                        </li>
                                         <li>
                                            <a href="#" id="F" class="ajaxfarmlist">방제기계류</a>
                                        </li>
                                         <li>
                                            <a href="#" id="G" class="ajaxfarmlist">수확기계류</a>
                                        </li>
                                         <li>
                                            <a href="#" id="H" class="ajaxfarmlist">시설용기계류</a>
                                        </li> 
                                         <li>
                                            <a href="#" id="I" class="ajaxfarmlist">축산용기계류</a>
                                        </li> 
                                         <li>
                                            <a href="#" id="J" class="ajaxfarmlist">트랙터및부속작업</a>
                                        </li>
                                         <li>
                                            <a href="#" id="K" class="ajaxfarmlist">파종이식기계류</a>
                                        </li>                                                                                                                                                               
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                                 <li>
                                    <a href="/farmingtool/dictionary/accident.action">농기계 안전·사고사례</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        <div id="page-wrapper" > 
        	<h1>대여</h1>
        	<hr/>
          <div class="row" style="margin-left: 10px">
			
			<h3 id="rental-condition-title1">지역선택</h3>
			<select id="location1" name="location1" class="rental_option">
				<option value="" selected="selected">지역선택1-도/시</option>
				<option value="1">강원도</option>
				<option value="2">경기도</option>
				<option value="3">경상남도</option>
				<option value="4">경상북도</option>
				<option value="5">광주광역시</option>
				<option value="6">대구광역시</option>
				<option value="7">대전광역시</option>
				<option value="8">부산광역시</option>
				<option value="9">서울특별시</option>
				<option value="10">세종특별자치시</option>
				<option value="11">울산광역시</option>
				<option value="12">인천광역시</option>
				<option value="13">전라남도</option>
				<option value="14">전라북도</option>
				<option value="15">제주특별자치도</option>
				<option value="16">충청남도</option>
				<option value="17">충청북도</option>
			</select> &nbsp;
			<div id="ac">
				<select id="location2" name="location2" class="rental_option">
					<option value="" selected="selected" id="origin">지역선택2-시/군/구</option>
				</select><br/><br/>
			</div>
		
			<h3 class="rental-condition-title2">기계선택</h3>
			<h5 style="color: red">지역 선택 후에도 기계목록이 보이지 않는 경우 <br/>해당 지역에서 기계 대여가능 품종이 없는 것입니다.</h5>
			<div id="ac2">
				<select id="machine1" name="machine1" class="rental_option">
					<option value="" selected="selected">기계선택1-대분류</option>
					<c:forEach var="type" items="${types}" >
						<option value="${type.typeNo}">${type.typeName}</option>
					</c:forEach>
				</select> &nbsp;
				<br/>
				<select id="machine2" class="rental_option">
					<option value="" class="basic_type" selected="selected">기계선택2-소분류</option>
					<c:forEach var="farmMachine" items="${farmMachineList}" >
						<option value="${farmMachine.fmNo}" class="${farmMachine.typeNo}" style="display: none">${farmMachine.fmName}</option>
					</c:forEach>
				</select> &nbsp;
			</div>
			<br/>
			<input type="button" id="search" value="대여 가능일 검색" style="width: 150px; padding: 5px;font-size: 11pt"/> 
			<br/><br/>
			<br/><br/>
			
			<h4 id="rental-condition-title" style="font-weight: bold;color:#006699">대여시 안내사항 및 주의사항</h4>
			<div id="message" style="font-size: 11pt;padding: 5px" >
				<table>
					<tr style="height: 30px">
						<td style="width:100px">■ 보유 대수 :</td>
						<td ><input type="text" id="totalDetailMachine" readonly="readonly"/></td>
					</tr>
					<tr style="height: 30px"> 
						<td>■ 대여 가격 :</td>
						<td><input type="text" id="rentalCost" readonly="readonly"/></td>
					</tr>
					<tr style="height: 30px">
						<td colspan="2">■ 주의 사항 :</td>
					</tr>
					<tr>
						<td colspan="2" style="color:red; font-weight: bold;">
						※ 교육을 이수하지 않을 시 예약이 취소될 수 있습니다. ※<br/>
						반납은 대여일 오후 5시까지 하시거나 <br/>
						다음날 오전 10시까지 하셔야 불이익이 없습니다.<br/>
						기타 자세한 사항은 02-556-2231 로 문의해 주세요
						</td>
					</tr>
				</table>
				
			</div>
			
			<div id="date-popover" class="popover top">
			    <div id="date-popover-content" class="popover-content">
			    </div>
			</div>
			
			<div id="calendar-area">
				<!-- <div id="my-calendar" style="margin-top:20px"></div> -->
			</div>
			<br/><br/><br/>
		
		  </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->



</body>
</html>
