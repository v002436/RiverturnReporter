<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<script id="tinyhippos-injected">if (window.top.ripple) { window.top.ripple("bootstrap").inject(window, document); }</script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Pragma" content="public">
    <meta http-equiv="Cache-Control" content="max-age=0">
    <link rel="icon" href="../../favicon.ico">
	  <!-- YUI Dependencies -->
  <script type="text/javascript" src="/openreports/js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/dom-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/event-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/animation-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/dragdrop-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/connection-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/container-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/button.css">  
  <!-- End YUI Dependencies -->

    <title>Riverturn Reporter</title>
	
	<link rel="stylesheet" type="text/css" href="/openreports/css/yui/reset-fonts-grids.css" />
  <link href="/openreports/css/openreports.css" rel="stylesheet" type="text/css">



    <!-- Bootstrap core CSS -->
    <link href="/openreports/css/bootstrap.min.css" rel="stylesheet">
    <link href="/openreports/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/openreports/css/air-theme.css" rel="stylesheet">
   <script src="/openreports/js/vendor/jquery.min.js"></script>
   <script src="/openreports/js/vendor/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>

<body class="yui-skin-sam">

<s:if test="report == null || !report.isDisplayInline()">
<!-- begin top nav area -->
<nav class="navbar navbar-inverse navbar-top navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><img src="/images/test_logo.png"></a>
        </div>
<s:if test="#session.breadcrumbs != null"> 
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
				<s:if test="#session.user.dashboardUser">
                <li><a href="/openreports/dashboard.action"><i class="fa fa-dashboard"></i> Dashboard</a><div id="dash"></div></li>
				</s:if>
				<s:if test="#session.user.scheduler">
				<li><a href="/openreports/listScheduledReports.action"><i class="fa fa-clock-o"></i> Scheduled Reports</a><div id="sched"></div></li>
				</s:if>
				<s:if test="#session.user.adminUser">
                <li><a href="/openreports/reportAdmin.action"><i class="fa fa-users"></i> Administration</a><div id="admin"></div></li>
				</s:if>
				<s:if test="#session.user">
				<li><a href="/openreports/reportGroup.action"><i class="fa fa-area-chart"></i> Reports</a><div id="report"></div></li>
                <li><a href="/openreports/userAdmin.action"><i class="fa fa-gear"></i> Preferences</a><div id="pref"></div></li>
                <li><a href="/openreports/logout.action"><i class="fa fa-sign-out"></i> Logoff</a><div class="normal"></div></li>
				</s:if>
				
            </ul>
        </div>
    </div>
</nav>
<nav class="navbar navbar-inverse navbar-subnav navbar-static-top">
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav">
                <!-- <li class="active"><a href="/user/account/voice-messaging" data-s="header-submenu-dashboard">Dashboard</a></li> -->
                <!-- <li><a href="/user/account/voice-messaging/getting-started" data-s="header-submenu-getting-started">Getting Started</a></li> -->
            </ul>
        </div>
    </div>
</nav>
</s:if>
<!-- end top nav area --> 
<script type="text/javascript">
	var menuButton1 = new YAHOO.widget.Button("logoffButton");
	var menuButton2 = new YAHOO.widget.Button("reportsButton");
	var menuButton3 = new YAHOO.widget.Button("adminButton");
	var menuButton4 = new YAHOO.widget.Button("dashboardButton");
	var menuButton4 = new YAHOO.widget.Button("schedulerButton");
	var menuButton4 = new YAHOO.widget.Button("userAdminButton");
</script> 

<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
if (location.pathname=="/openreports/dashboard.action") {
	document.getElementById("dash").style.content = "";
	document.getElementById("dash").style.position = "absolute";
	document.getElementById("dash").style.width = "12px";
	document.getElementById("dash").style.height = "12px";
	document.getElementById("dash").style.background = "#00456A";
	document.getElementById("dash").style.transform = "rotate(135deg)";
	document.getElementById("dash").style.bottom = "-7";
	document.getElementById("dash").style.left = "60px";
	document.getElementById("dash").style.boxShadow = "-1px -1px 10px -2px rgba(0, 0, 0, 0.5)";}
</SCRIPT>
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
if (location.pathname=="/openreports/listScheduledReports.action") {
	document.getElementById("sched").style.content = "";
	document.getElementById("sched").style.position = "absolute";
	document.getElementById("sched").style.width = "12px";
	document.getElementById("sched").style.height = "12px";
	document.getElementById("sched").style.background = "#00456A";
	document.getElementById("sched").style.transform = "rotate(135deg)";
	document.getElementById("sched").style.bottom = "-7";
	document.getElementById("sched").style.left = "80px";
document.getElementById("sched").style.boxShadow = "-1px -1px 10px -2px rgba(0, 0, 0, 0.5)";}
</SCRIPT>
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
if (location.pathname=="/openreports/reportAdmin.action") {
	document.getElementById("admin").style.content = "";
	document.getElementById("admin").style.position = "absolute";
	document.getElementById("admin").style.width = "12px";
	document.getElementById("admin").style.height = "12px";
	document.getElementById("admin").style.background = "#00456A";
	document.getElementById("admin").style.transform = "rotate(135deg)";
	document.getElementById("admin").style.bottom = "-7";
	document.getElementById("admin").style.left = "70px";
document.getElementById("admin").style.boxShadow = "-1px -1px 10px -2px rgba(0, 0, 0, 0.5)";}
</SCRIPT>
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
if (location.pathname=="/openreports/reportList.action") {
	document.getElementById("report").style.content = "";
	document.getElementById("report").style.position = "absolute";
	document.getElementById("report").style.width = "12px";
	document.getElementById("report").style.height = "12px";
	document.getElementById("report").style.background = "#00456A";
	document.getElementById("report").style.transform = "rotate(135deg)";
	document.getElementById("report").style.bottom = "-7";
	document.getElementById("report").style.left = "50px";
document.getElementById("report").style.boxShadow = "-1px -1px 10px -2px rgba(0, 0, 0, 0.5)";}
</SCRIPT>
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
if (location.pathname=="/openreports/userAdmin.action") {
	document.getElementById("pref").style.content = "";
	document.getElementById("pref").style.position = "absolute";
	document.getElementById("pref").style.width = "12px";
	document.getElementById("pref").style.height = "12px";
	document.getElementById("pref").style.background = "#00456A";
	document.getElementById("pref").style.transform = "rotate(135deg)";
	document.getElementById("pref").style.bottom = "-7";
	document.getElementById("pref").style.left = "60px";
document.getElementById("pref").style.boxShadow = "-1px -1px 10px -2px rgba(0, 0, 0, 0.5)";}
</SCRIPT>

</s:if>