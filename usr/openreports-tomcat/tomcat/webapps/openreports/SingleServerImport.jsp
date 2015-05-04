<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 


<body class="yui-skin-sam">


</head>

<div id="header"></div>

	<section class="intro" id="zen-intro">

		<div class="summary" id="zen-summary" role="article">
			<hr>
			<p> AIR enables you to import a single server into the database from SA.<p>
			<hr>
			<p> To import a single server from SA into the AIR database, enter the hostname and click submit.</p>
			<FORM action="/cgi-bin/get_sa_data.pl" method="POST">Enter the hostname from SA: <input type="text" name="host_name">  <br><input type="submit" value="Submit"></FORM>
			<br>
			<hr>
		</div>
	</section>

<s:include value="Footer.jsp" />