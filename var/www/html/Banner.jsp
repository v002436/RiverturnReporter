<html>

<head>	
<meta charset="utf-8">
	<title>AIR Product Demo</title>

	<link rel="stylesheet" media="screen" href="http://www.csszengarden.com/214/214.css?v=8may2013">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
 
  <link href="css/openreports.css" rel="stylesheet" type="text/css">
  <!-- YUI Dependencies -->
  <script type="text/javascript" src="js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="js/yui/dom-min.js"></script>
  <script type="text/javascript" src="js/yui/event-min.js"></script>
  <script type="text/javascript" src="js/yui/animation-min.js"></script>
  <script type="text/javascript" src="js/yui/dragdrop-min.js"></script>
  <script type="text/javascript" src="js/yui/connection-min.js"></script>
  <script type="text/javascript" src="js/yui/container-min.js"></script>
  <script type="text/javascript" src="js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="css/yui/button.css">    
  <!-- End YUI Dependencies -->
  <script type="text/javascript" src="js/highlight.js"></script>
</head>

<body class="yui-skin-sam">


<body id="css-zen-garden">
<div class="page-wrapper">

	<section class="intro" id="zen-intro">
		<header role="banner">
			<h1>AIR - HPSA + Your Data</h1>
		</header>
	</section>
<div class="menu"> 
  
	  
	<div id="usermenu">	    
  		<ul class="vert">   
  			
  		  	 
          <li>
          	<span id="logoffButton" class="yui-button yui-link-button"> 
	    		<span class="first-child"> 
          			<a href="logout.action">Logoff</a>
          		</span>
          	</span>                   
          </li>         
          <li>
            <span id="userAdminButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="userAdmin.action">
          				Preferences
          			</a>
          		</span>
          	</span>             
          </li> 
          
            
          
          <li>
          	<span id="schedulerButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="listScheduledReports.action">
          				Scheduled Reports
          			</a>
          		</span>
          	</span> 
          </li> 
          
          
          <li>
          	<span id="reportsButton" class="yui-button yui-link-button yui-button-hover yui-link-button-hover"> 
	    		<span class="first-child"> 
          			<a href="reportGroup.action">
          				Reports
          			</a>
          		</span>
          	</span> 
          </li>
          
        
           
          
          <li>
          	<span id="reportsButton" class="yui-button yui-link-button "> 
	    		<span class="first-child"> 
          			<a href="http://sl7-easutil02.savvis.lab/index.html">
          				Home
          			</a>
          		</span>
          	</span> 
          </li>
               
        </ul>
    </div>
        
    
</div> 

<script type="text/javascript">
	var menuButton1 = new YAHOO.widget.Button("logoffButton");
	var menuButton2 = new YAHOO.widget.Button("reportsButton");
	var menuButton3 = new YAHOO.widget.Button("adminButton");
	var menuButton4 = new YAHOO.widget.Button("dashboardButton");
	var menuButton4 = new YAHOO.widget.Button("schedulerButton");
	var menuButton4 = new YAHOO.widget.Button("userAdminButton");
</script>    



 

<div align="center">  

  <a class="back-link img-group-small" href="reportGroup.action">Back to Groups</a>	
  
  <br/>

