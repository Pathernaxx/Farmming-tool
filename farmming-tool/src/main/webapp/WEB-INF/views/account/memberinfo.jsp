<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>FARM MACHINE</title>
	<!-- jQuery -->
    <script src="http://code.jquery.com/jquery-2.1.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.2/masonry.pkgd.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link rel='Stylesheet' href='../resources/styles/bootstrap.css' />
    <!-- MetisMenu CSS -->
    <link rel='Stylesheet' href='../resources/styles/metisMenu.css' />
    <!-- Custom CSS -->
    <link rel='Stylesheet' href='../resources/styles/sb-admin-2.css' />
    <!-- Custom Fonts -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"> 
    <!-- Bootstrap Core JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
	
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
		         $("#sp1").empty();
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
	            		 $("#sp1").empty();  
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
	  
	  $('.history').on('click', '.status', function() {
			var id = $(this).parents('.historyItem').attr('id');
			var status = $(this).attr('id');
			var current = $(this);
			
			$.ajax({
				url: '../admin/changeStatus.action',
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
    function myDateFunction(id, fromModal, selected1, selected2) {
    	
    	if('${loginuser}' == null || '${loginuser}' == ""){
    		alert("대여는 로그인 후 이용가능 합니다.");
    		$(location).attr("href", "../account/login.action");
    	}
    	var height = window.outerWidth;
    	var wid = (height/2)-130;
    	$('#date-popover').css("left", wid);
    	
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
        								'<input type="hidden" value="'+selected1+'" id="locationNo2"/>'+
        								'<input type="hidden" value="'+selected2+'" id="fmNo"/>'+
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
    		url: "../rental/rentalMachine.action",
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
    				alert("예약 성공 : 확인 페이지로 이동합니다.")
					var returnurl = '../rental/moveToCheckRental.action?machineNo='+result;
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
    height: 205px;
    border: 3px solid;
    margin: 5px;
    float: left;
    color : #BDBDBD;
    border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	overflow: hidden;
 }
 .item--gigante{
    width: 800px;
    height: 500px;
}


.item--gigante img{
 	width: 290px;
 	height: 400px;
}
 .item2 {
    width: 200px;
    height: 205px;
    border: 3px solid;
    margin: 5px;
    float: left;
    color : #BDBDBD;
    border-bottom-left-radius: 5px;
   border-bottom-right-radius: 5px;
   border-top-left-radius: 5px;
   border-top-right-radius: 5px;
   overflow: hidden;
 }
 
.item2--gigante{
    width: 800px;
    height: 500px;
}


.item2--gigante img{
    width: 290px;
    height: 400px;
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
                <a class="navbar-brand" href="../home.action" >대여통</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
				<li><i class="fa fa-user fa-fw"></i></li>
				<c:choose>
					<c:when test="${ loginuser eq null }">
						<li><a href="../account/login.action">로그인</a></li>
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
									    <li role="presentation"><a role="menuitem" href="../account/updateMember.action">회원정보</a></li>
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
                                <button class="btn btn-default" id="searchbutton" type="button">
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
		

		<div id="page-wrapper" style="padding: 10px">
        <div class="row" style="margin-left: 10px">
        <div class="page-masonry" id="sp1" style="padding-top: 20px;">
        	<h1 style="margin: 0">회원정보</h1>
        	<hr/>
			<table border="1" style="text-align: center ; width: 90%; min-width: 400px;font-size: 11pt">
				<tr style=" height: 30px;">
					<td style="min-width: 80px;font-weight:bold;">ID</td>
					<td style="min-width: 150px">${member.memberId}</td>
				</tr>
				<tr style=" height: 30px;">
					<td style="font-weight:bold;">이름</td>
					<td>${member.memberName}</td>
				</tr>
				<tr style=" height: 30px;">
					<td style="font-weight:bold;">주소1</td>
					<td>${member.memberAddress1}</td>
				</tr>
				<tr style=" height: 30px;">
					<td style="font-weight:bold;">주소2</td>
					<td>${member.memberAddress2}</td>
				</tr>
				<tr>
					<td style="font-weight:bold;">전화</td>
					<td>${member.memberPhone1}</td>
				</tr>
				<tr style=" height: 30px;">
					<td style="font-weight:bold;">휴대폰</td>
					<td>${member.memberPhone2}</td>
				</tr>
			</table>
			</div><!-- page-masonry -->
			</div> <!-- row -->
		</div><!-- /#page-wrapper -->
	</div><!-- /#wrapper -->

</body>
</html>