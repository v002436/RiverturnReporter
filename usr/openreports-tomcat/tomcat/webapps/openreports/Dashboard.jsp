<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 

<br/>

<div align="center">

<s:if test="alerts.size() != 0">

  <div class="img-alert important" id="instructions"  style="border-bottom: 1px solid;"><s:text name="label.alerts"/></div>

  <div>
  
  <s:set name="alerts" value="alerts" scope="request" />
  

  <display:table name="alerts" class="displayTag" sort="list" decorator="org.efs.openreports.util.AlertTableDecorator" id="alertTable">  	   	      
    <display:column property="alert.name" titleKey="label.name" sortable="true" headerClass="sortable"/>    	     	      	      
    <display:column property="condition" titleKey="label.condition" sortable="true" headerClass="sortable"/>
    <display:column property="count" titleKey="label.value" sortable="true" headerClass="sortable"/>
    <display:column property="status" titleKey="label.status" sortable="true" headerClass="sortable" class="alert"/>
   	<display:column property="report.name" titleKey="label.report" href="reportDetail.action" paramId="reportId" paramProperty="report.id" sortable="true" headerClass="sortable"/>
  </display:table>   
      
  </div>	

</s:if>

<s:if test="report != null">

  <br/>

  <div class="important img-report" id="instructions" style="border-bottom: 1px solid;">Dashboard Results</div>   
  <br/>
<form name="change">
<SELECT NAME="options" ONCHANGE="document.getElementById('youriframe').src = this.options[this.selectedIndex].value">
<option selected>Select Report</option>
<option value="/openreports/reportDetail.action?reportId=<s:property value="report.id"/>&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true">My Report</option>
<option value="/openreports/reportDetail.action?reportId=94&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true">Agent Version</option>
<option value="/openreports/reportDetail.action?reportId=93&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true">Customer</option>
<option value="/openreports/reportDetail.action?reportId=74&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true">OS Counts All</option>
<option value="/openreports/reportDetail.action?reportId=75&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true">OS Counts Windows</option>
</SELECT>
<br>
  <br/>
  
  <div>	
  
    <iframe name="iframe" id="youriframe" frameborder="0" width="100%" height="1000px" src="/openreports/reportDetail.action?reportId=<s:property value="report.id"/>&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true"></iframe>
	
 	
	<br/>			
  
  </div>	

</s:if>

<s:if test="report == null || alerts.size() == 0">

<div align="center">
	<br>	
	<b><s:text name="dashboard.message"/></b>
</div>

</s:if>

</div>	

<s:include value="Footer.jsp" /> 