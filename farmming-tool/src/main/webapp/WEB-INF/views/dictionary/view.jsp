<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <title>Panel slider example</title>
  <style type="text/css">
  #headertable {
	width: 100%;
	height: 100%;
	}
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
    body {
      overflow-x: hidden;
      font-family: Arial;
      background: #eee;
      /* Panel animation should last 200ms */
      transition: transform .2s;
      -webkit-transition: -webkit-transform .2s;
    }
    /* Body animation when left panel is opened */
    body.ps-active {
      -webkit-transform: translateX(260px);
      -ms-transform: translateX(260px);
      transform: translateX(260px);
    }
    /* Body animation when right panel is opened */
    body.ps-active-right {
      -webkit-transform: translateX(-260px);
      -ms-transform: translateX(-260px);
      transform: translateX(-260px);
    }
    /* Panel styles */
    .panel {
      position: fixed;
      top: 0;
      width: 220px;
      height: 100%;
      padding: 20px;
      background-color: #333;
      color: #fff;
      box-shadow: inset 0 0 5px 5px #222;
    }
    #left-panel {
      left: 0;
      /* Hide panel on the left of the page. When this panel is opened the
      class .ps-active will be apllied to body, and it's X translation will
      reveal the panel. */
      -webkit-transform: translateX(-260px);
      -ms-transform: translateX(-260px);
      transform: translateX(-260px);
    }
    #right-panel {
      right: 0;
      /* Hide panel on the right of the page. When this panel is opened the
      class .ps-active-right will be apllied to body, and it's X translation
      will reveal the panel. */
      -webkit-transform: translateX(260px);
      -ms-transform: translateX(260px);
      transform: translateX(260px);
    }
    /* Page style */
    h1, h2 {
      margin-top: 0;
    }
    p {
	margin: 0 0 auto;
	color: white;
	font-style: inherit;
	font-size: 50px;
    }
    #header {
      height: 70px;
      margin: 0 auto;
      background: #333;
    }
    #page{
    border: 3px solid; 
    height: 100%;
    }
    #content {
	height: 50px;
     margin: 5px;
    }
  </style>
</head>
<body>
  <!-- Centered page -->
 <div id="page">
  <div id="header">
   <table id="headertable">
    <tr>
      <td width=10%><a id="left-panel-link" href="#left-panel"><img width=80 height=68 src="/farmmingtool/resources/images/sidemenuleft.png" ></a></td>
      <td style="text-align: center;"><p>농기계</p></td>
      <td width=10% style="text-align: right;"><a id="right-panel-link" href="#right-panel"><img width=80 height=68 src="/farmmingtool/resources/images/sidemenuright.png" ></a></td>
    </tr>
   </table>
  </div>
  <div id="content">
   레이아웃 내용
  </div>
</div> 
  <!-- Left panel -->
  <div id="left-panel" class="panel">
    <h2>Left panel</h2>
    <p>Click anywhere outside panel to close it.</p>
  </div>

  <!-- Right panel -->
  <div id="right-panel" class="panel">
    <h2>Right panel</h2>
    <p>Clicking outside this panel wont close it because <code>clickClose = false</code></p>
  </div>
<!-- Load jQuery from Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- Load Panelslider -->
<script src="/farmmingtool/resources/js/jquery.panelslider.js"></script>
  <script>
    $('#left-panel-link').panelslider();
    $('#right-panel-link').panelslider({
      bodyClass: 'ps-active-right'
    });
    $('#left-panel, #right-panel').on('psBeforeOpen psOpen psBeforeClose psClose', function(e) {
      console.log(e.type, e.target.getAttribute('id'));
    });
  </script>
</body>
</html>