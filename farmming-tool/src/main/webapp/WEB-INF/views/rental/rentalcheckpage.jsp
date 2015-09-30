<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FARM MACHINE</title>
    
    
     <!-- Bootstrap Core CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Calendar CSS -->
	<link rel="stylesheet" href="../resources/styles/zabuto_calendar.min.css">
	<link rel="stylesheet" href="../resources/styles/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.2/masonry.pkgd.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>

	<!-- Calendar Theme JavaScript -->
	<script src="../resources/js/zabuto_calendar.min.js"></script>
    
<style>
.item {
    width: 200px;
    height: 250px;
    border: 3px solid;
    margin: 5px;
    float: left;
 }
.rentalInfo{
    border-collapse:collapse;
 	width: 700px;
 	height: 600px;
	margin: 0 20px auto;
	padding:0px;
	font-size: 20px;
}	
</style>

<script type="text/javascript">
$(document).ready(function (){

var $masry = $('.page-masonry').masonry({
    itemSelector: '.item',
    isAnimated: true,
    
});
  $masry.on( 'click', '.item', function() {
	    // change size of item by toggling gigante class
	    $( this ).toggleClass('item--gigante');
	    $masry.masonry('layout');
	  });
     $(".ajaxfarmlist").click(function( event ) {
         var fmID = $(this).attr('id'); 
            $("#page-wrapper").empty();
            $(".page-masonry").empty();
            $.ajax({
               url : "../dictionary/ajaxfmList.action",
               async : false,
               type : "GET",
               data : {
                  typeNo : fmID
               },
               success : function(fmBytypeNo){
                  if (fmBytypeNo != null){
                     $.each(fmBytypeNo, function(index, listitem){
                        var html=

                           "<div class='item2' >"+
                          "<div class='detail1' style='float: left; border: .3em'>"+
                            "<img src='../resources/images/fmimage/"+listitem.fmPicture+"' width='200px' height='180px' style='padding-right: 4px'>"+
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
                           
                     $("#page-wrapper").append($(html)); 
                        
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
        url : "../dictionary/ajaxfmSearch.action",
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
			  					  "<img src='../resources/images/fmimage/"+listitem.fmPicture+"' width='200px' height='180px' style='padding-right: 4px'>"+
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
</script>
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
                <a class="navbar-brand" href="../home.action" >대여통</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
				<li><i class="fa fa-user fa-fw"></i></li>
				<c:choose>
					<c:when test="${ loginuser eq null }">
						<li><a href="../account/login.action"><p>로그인</p></a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ USERTYPE eq 'ADMIN' }">
								<li>
								  <div class="dropdown">
									  <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">${ loginuser.adminName }
									  <span class="caret"></span></button>
									  <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									    <li role="presentation"><a role="menuitem" href="../admin/rentallist.action">관리자페이지</a></li>
									    <li role="presentation" class="divider"></li>
									    <li role="presentation"><a role="menuitem" href="../account/logout.action">로그아웃</a></li>
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
									    <li role="presentation"><a role="menuitem" href="../account/logout.action">로그아웃</a></li>
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
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="../rental/rentalmain.action"><i class="fa fa-dashboard fa-fw"></i> 대여</a>
                        </li>
                        <li>
                            <a href="#" class="mainview"><i class="fa fa-wrench fa-fw"></i>농기계<span class="fa arrow"></span></a>
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
                                    <a href="../dictionary/accident.action">농기계 안전·사고사례</a>
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
        
        
        <div id="page-wrapper">
        	<h1>대여 확인</h1>
        	<hr/>
          <div class="row">
			<div id="rentalCheck">
			  </br>
				<table class='rentalInfo' border="1">
					<tr>
						<td>대여자</td>
						<td>${info.memberName}</td>
					</tr>
					<tr>
						<td>대여기계</td>
						<td>${info.machineName}</td>
					</tr>
					<tr>
						<td>대여금액</td>
						<td>${info.machineRentalCost}원</td>
					</tr>
					<tr>
						<td>대여장소</td>
						<td>${info.locationNo2Name}대여소</td>
					</tr>
					<tr>
						<td>대여일</td>
						<td>${info.historyRentalDateToString} 오전 10시 ~ 오후 5시</td>
					</tr>
					<tr>
						<td>반납일</td>
						<td>${info.historyReturnDateToString} 오전 10시까지</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">※주의사항※</td>
					</tr>
					<tr>
						<td style='color:red;font-weight: bold;' colspan="2">
						${info.machineInformation}
						※ 교육을 이수하지 않을 시 예약이 취소될 수 있습니다. ※<br/>
						반납은 대여일 오후 5시까지 하시거나 <br/>
						다음날 오전 10시까지 하셔야 불이익이 없습니다.<br/>
						기타 자세한 사항은 02-556-2231 로 문의해 주세요</td>
					</tr>
				</table>
			</div>
		  </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
</body>
</html>