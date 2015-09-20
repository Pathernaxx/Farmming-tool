<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel='Stylesheet' href='/farmingtool/resources/styles/bootstrap.css' />
    <!-- MetisMenu CSS -->
    <link rel='Stylesheet' href='/farmingtool/resources/styles/metisMenu.css' />
    <!-- Custom CSS -->
    <link rel='Stylesheet' href='/farmingtool/resources/styles/sb-admin-2.css' />
    <!-- Custom Fonts -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"> 
<style>
.item {
    width: 400px;
    height: 200px;
    border: 3px solid;
    margin: 5px;
    float: left;
    color : #BDBDBD;
    border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
 }
 
.itemTitle{
    width: 200px;
    height: 300px;
    margin: 5px;
    color : #BDBDBD;
	font : Verdana;
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
                <a class="navbar-brand" href="index.html">농기계</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
				<li><i class="fa fa-user fa-fw"></i></li><li><a href="#"><p>로그인</p></a></li>
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
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> 대여</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i>농기계<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="#">사용/분류 <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">가공기계류</a>
                                        </li>
                                        <li>
                                            <a href="#">경운기및부속작업</a>
                                        </li>
                                        <li>
                                            <a href="#">관리기계류</a>
                                        </li>
                                        <li>
                                            <a href="#">관리기및부속작업</a>
                                        </li>
                                         <li>
                                            <a href="#">기타기계류</a>
                                        </li>
                                         <li>
                                            <a href="#">방제기계류</a>
                                        </li>
                                         <li>
                                            <a href="#">수확기계류</a>
                                        </li>
                                         <li>
                                            <a href="#">시설용기계류</a>
                                        </li> 
                                         <li>
                                            <a href="#">축산용기계류</a>
                                        </li> 
                                         <li>
                                            <a href="#">트랙터및부속작업</a>
                                        </li>
                                         <li>
                                            <a href="#">파종이식기계류</a>
                                        </li>                                                                                                                                                              
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                                <li>
                                    <a href="#">농기계정비</a>
                                </li>
                                <li>
                                    <a href="#">농기계안전정보</a>
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
			<div class="page-masonry">

	          <c:forEach var="farmMachine" items="${ farmMachineList }">
			      <div class="item" >
			      <div style="float: left">
			   	   <a href="showdetail.action?fmno=${ farmMachine.fmNo }">
			      	<img src="/farmingtool/resources/images/fmimage/${ farmMachine.fmPicture }" width="200px" height="180px" style="padding-right: 4px">
			       </a>
			       </div>
			      	<div style="float: left" >
			      	 <a href="showdetail.action?fmno=${ farmMachine.fmNo }">${ farmMachine.fmName }</a>
			      	</div>
			       
			      </div>
		      </c:forEach>
			</div>
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

</body>
</html>
