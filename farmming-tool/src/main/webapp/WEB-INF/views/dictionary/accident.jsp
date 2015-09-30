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
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-2.1.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.2/masonry.pkgd.js"></script>
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
    width: 260px;
    height: 130px;
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
<script type="text/javascript">
$(document).ready(function (){
    var $masry = $('.page-masonry').masonry({
        itemSelector: '.item',
        isAnimated: true,
        
   });
    
     $(".ajaxfarmlist").click(function( event ) {
         var fmID = $(this).attr('id'); 
            $("#page-wrapper").empty();
            $(".page-masonry").empty();
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

                           "<div class='item2' >"+
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
     
     $("#mainview").click(function( event ) {
         $("#page-wrapper").empty();
         $(".page-masonry").empty();
            $.ajax({
               url : "/farmingtool/dictionary/view.action",
               async : false,
               type : "GET",
               
               success : function(farmMachineList){
                  if (farmMachineList != null){
                     $.each(farmMachineList, function(index, listitem){
                        var html=

                           "<div class='item2' >"+
                          "<div class='detail1' style='float: left; border: .3em'>"+
                            "<img src='/farmingtool/resources/images/fmimage/"+listitem.fmPicture+"' width='200px' height='180px' style='padding-right: 4px'>"+
                              "<p>"+listitem.fmName+"</p>"+
                             "<hr />"+
                              "<button>대여하기</button>"+
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
        $(".page-masonry").empty();
        $("#page-wrapper").empty();
            
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
                              $("#page-wrapper").append($(html)); 
                              
                           });                         
                   }else{
                      var html = "<div>"+
                       "<div class='detail1'>"+
                       "올바른 검색어를 입력하세요."+
                       "</div>"+
                        "</div>";
                        $("#page-wrapper").append($(html)); 
                   }
               },
               error : function(){
                     alert("error");
              }
             });
     });   
    $("#pClassType").change(function(event){
       $(".page-masonry").empty();
         });
     
     
     
     
     
     $("#searchbutton").click(function( event ) {
        var searchword = $("#searchword").val();
        $(".page-masonry").empty();
            $("#page-wrapper").empty();
            
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
                      $("#page-wrapper").append($(html)); 
                   }
               },
               error : function(){
                     alert("error");
              }
             });
     });   
    $("#pClassType").change(function(event){
       $(".page-masonry").empty();
       
    var selectVal = $("#pClassType option:selected").val();
   $.ajax({
        url : "/farmingtool/dictionary/accident.action",
        async : false,
        type : "POST",      
        data : {
           searchword : selectVal
        },
        success : function(accs){
           
          $.each(accs, function(index, data){
             var html = "<div class='item'>"+
                       "<p>제목 : "+ data.content +"</p>"+
                       "<a href="+ data.downUrl +"><p>다운로드</p></a>"+
                       "<p>분류 : "+ data.pClass +"</p>"+
                       "</div>";
             $(".page-masonry").append(html);
          });
       },
      error : function(xhr, ajaxOptions, thrownError){
         console.log(xhr.status);
         console.log(thrownError);
      }
   });
    
    event.preventDefault();
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
                <a class="navbar-brand" href="/farmingtool/home.action" >대여통</a>
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
                            <a href="/farmingtool/rental/rentalmain.action"><i class="fa fa-dashboard fa-fw"></i> 대여</a>
                        </li>
                        <li>
                            <a href="/farmingtool/dictionary/ajaxfmList.action"><i class="fa fa-wrench fa-fw"></i>농기계<span class="fa arrow"></span></a>
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
                                    <a href="accident.action">농기계 안전·사고사례</a>
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
          </br>
            <table>
              <tr>
              	<td>          	
              	분류  
				</td>
              	<td>
              	<select id="pClassType">
				<option value="" selected="selected">전체</option>
			    <option value="교통사고 판례해설">교통사고 판례해설</option>
			    <option value="교통표지">교통표지</option>
			    <option value="농기계 사고사례">농기계 사고사례</option>
			    <option value="농기계 사고실태">농기계 사고실태</option>
			    <option value="농기계 형식별 안전이용">농기계 형식별 안전이용</option>
			    <option value="농기계별 안전이용">농기계별 안전이용</option>
			    <option value="농작업 안전 일반사항">농작업 안전 일반사항</option>
			    <option value="농작업 안전수칙">농작업 안전수칙</option>
			    <option value="농작업 안전용품">농작업 안전용품</option>
			    <option value="도로 상황별 안전사고 예방요령">도로 상황별 안전사고 예방요령</option>
			    <option value="도로안전 운행요령">도로안전 운행요령</option>
			    <option value="등화장치부착 및 조작">등화장치부착 및 조작</option>
			    <option value="안전검정">안전검정</option>
			    <option value="안전검정 기준 및 방법">안전검정 기준 및 방법</option>
			    <option value="안전표지">안전표지</option>
			    <option value="위험지역 작업요령">위험지역 작업요령</option>
			    <option value="작업환경별 농작업요령">작업환경별 농작업요령</option>
				</select>
              	</td>
              </tr>
            </table>
			<div class="page-masonry">
			<c:forEach var="acc" items="${ accs }">
			 <div class="item">
 			 	 <p>제목 : ${ acc.content}</p>
    			 <a href="${acc.downUrl}"><p>다운로드</p></a>
    			 <p>분류 : ${acc.pClass} </p> 
		     </div>
		     </c:forEach>
			 </div>
			</div>
		  </div>
		  </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    
   

    <!-- Bootstrap Core JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>

</body>
</html>
