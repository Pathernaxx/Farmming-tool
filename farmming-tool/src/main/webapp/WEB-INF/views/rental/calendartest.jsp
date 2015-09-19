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
    
    <!-- Calendar jQuery -->
    <!-- <script src="//code.jquery.com/jquery-1.11.3.js"></script> -->
    
    <link rel='Stylesheet' href='/farmingtool/resources/styles/rentalmain.css' />
    <script type="text/javascript" src="/farmingtool/resources/js/address.jsp"></script>
    
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

<style>
.item {
    width: 200px;
    height: 250px;
    border: 3px solid;
    margin: 5px;
    float: left;
 }
</style>
<script type="text/javascript">
$(function(){
	var container = $('.page-masonry');
	$container.imagesLoaded( function () {
	       $container.masonry({
	           columnWidth: '.item',
	           itemSelector: '.item'
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
                <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
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
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
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
          <div class="row">
			<form name = "frm1">
				<h2 id="rental-condition-title">지역선택</h2>
				<select id="rental-option" name="locationBig" onchange="sub_change1()">
					<option value="" selected="selected">지역선택1-도/시</option>
					<option value="강원도">강원도</option>
					<option value="경기도">경기도</option>
					<option value="강원도">경상남도</option>
					<option value="강원도">경상북도</option>
					<option value="강원도">광주광역시</option>
					<option value="강원도">대구광역시</option>
					<option value="강원도">대전광역시</option>
					<option value="강원도">부산광역시</option>
					<option value="강원도">서울특별시</option>
					<option value="강원도">세종특별자치시</option>
					<option value="강원도">울산광역시</option>
					<option value="강원도">인천광역시</option>
					<option value="강원도">전라남도</option>
					<option value="강원도">전라북도</option>
					<option value="강원도">제주특별자치도</option>
					<option value="강원도">충청남도</option>
					<option value="강원도">충청북도</option>
				</select> &nbsp;
				<select id="rental-option" name="locationSmall"><!--  onchange="sub_change2() -->
					<option value="" selected="selected">지역선택2-시/군/구</option>
				</select><br/><br/>
			</form>	
			
			<form name = "frm2">
				<h2 id="rental-condition-title">기계선택</h2>
				<select id="rental-option" name="tool-big">
					<option value="" selected="selected">기계선택1-대분류</option>
					<option value="트랙터 및 부속품">트랙터 및 부속품</option>
				</select> &nbsp;
				<select id="rental-option" name="tool-small">
					<option value="" selected="selected">기계선택2-소분류</option>
					<option value="농용트랙터">농용트랙터</option>
				</select> &nbsp; <input type="button" id="rental_search" name="search" value="검색" onclick="#"/> <br/><br/>
			</form>
			
			<h4 id="rental-condition-title" style="font-weight: bold;color:#006699">대여시 안내사항 및 주의사항</h4>
			
			<div id="message">
				&nbsp;■ 대여가격 : <br/>
				&nbsp;■ 대여일 / 반납일 : <br/>
				&nbsp;■ 주의 사항 : <br/>
				&nbsp;<font style='color:red;font-weight: bold;'>※ 교육을 이수하지 않을 시 예약이 취소될 수 있습니다. ※</font>
			</div>
			
			<div id="date-popover" class="popover top">
			    <div id="date-popover-content" class="popover-content">
			    </div>
			</div>
			
			<div id="my-calendar" style="margin-top:20px"></div>
			<br/><br/><br/>
		
			
		  </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
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
	<script type="application/javascript">
		var eventData = [ //이벤트 있는 날짜 배열로 받아서 사용할 것(JSON)
		                 {"date":"2015-09-01","badge":false,"title":"Example 1"},
		                 {"date":"2015-09-15","badge":true,"title":"Example 2"}
		            	];

	    $(document).ready(function () {
	        $("#my-calendar").zabuto_calendar({
	        	/* ajax: {
	                url: "/boot2/resources/php/show_data.php",
	                modal: true
	            }, */
	            action: function () {
	                return myDateFunction(this.id, false);
	            },
	            /* action_nav: function () {
	                return myNavFunction(this.id);
	            }, */
	            data: eventData,
	        	language: "ko",
	        	year: 2015,
	            month: 9,
	            show_previous: true,
	            show_next: 12,
	            cell_border: true,
	            today: true,
	            show_days: true,
	            weekstartson: 0,
	            nav_icon: {
	              prev: '<i class="fa fa-chevron-circle-left"></i>',
	              next: '<i class="fa fa-chevron-circle-right"></i>'
	            }

	        	});
	    });
	    function myDateFunction(id, fromModal) {
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
	        								'<input type="hidden" value="FA010001" id="machineNo"/>'+
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
	    	//alert($("#rentalDate").val());
	    	var rentalDate = $("#rentalDate").val();
	    	var machinNo = $("#machinNo").val();
	    	$.ajax({
	    		url: "/farmingtool/rental/rentalMachine.action",
	    		type: "get",
	    		async: true,
	    		data: {
	    			"rentalDate" : rentalDate,
	    			"machineNo" : machinNo
	    			},
	    		success: function(result) { //result
	    			if(result != null)
					{
	    				alert("예약 성공 : 확인 페이지로 이동합니다.")
						var returnurl = '/farmingtool/rental/moveToCheckRental.action';
						$(location).attr('href', returnurl);
					} else {
						alert('예약 실패 : 다시 시도해주세요.');
					}
	    		},
	    		error: function(xhr, status, error) {
	    			alert(xhr + '/' + status + '/' + error);
	    		}
	    	});
	    }
	    
	    /* function myNavFunction(id) {
	        $("#date-popover").hide();
	        var nav = $("#" + id).data("navigation");
	        var to = $("#" + id).data("to");
	        //console.log('nav ' + nav + ' to: \ + to.month + '/' + to.year');
	        console.log('이게뭐냥');
	    } */
	</script>
</body>
</html>