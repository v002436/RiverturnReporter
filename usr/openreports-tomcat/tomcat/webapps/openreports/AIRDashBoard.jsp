<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 

<br>
<form name="change">
<SELECT NAME="options" ONCHANGE="document.getElementById('youriframe').src = this.options[this.selectedIndex].value">
<option selected value="/openreports/reportDetail.action?reportId=94">Agent Version</option>
<option value="/openreports/reportDetail.action?reportId=93">Customer</option>
<option value="/openreports/reportDetail.action?reportId=74">OS Counts All</option>
<option value="/openreports/reportDetail.action?reportId=75">OS Counts Windows</option>
</SELECT>
<br>
<br>
<hr>


<iframe name="iframe" id="youriframe" src="/openreports/reportDetail.action?reportId=93" width="100%" height="100%" style="position:absolute; clip:rect(195px,2500px,800px,200px); top: 20px; left: 30px;"></iframe>


<s:include value="Footer.jsp" />