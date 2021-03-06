<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 


<body marginwidth="0" marginheight="0">

<div align="center">		
	
	<br/>
	
	<form action="executeReport.action" method="get" target="_blank">  

	<table class="dialog">
		<tr>
			<th colspan="2">OpenReports - ExecuteReport Test Page</th>
		</tr>
	</table>
	
	<table class="dialog">
		<tr>
			<td>Report Name <font color="blue">*</font></td>
			<td><input type="text" name="reportName" value=""></td>
		<tr>	
		<tr>
			<td>Report ID <font color="blue">*</font></td>
			<td><input type="text" name="reportId" value=""></td>
		<tr>	
		
		<tr>
			<td>UserName <font color="red">*</font></td>
			<td><input type="text" name="userName" value="admin"></td>
		<tr>
		<tr>
			<td>Password <font color="red">*</font></td>
			<td><input type="text" name="password" value="admin"></td>
		<tr>
		<tr>
			<td>Export Type</td>
			<td>
				<select name="exportType">
					<option value="0">PDF</option>
					<option value="1">XLS</option>
					<option value="2">HTML</option>
					<option value="3">CSV</option>
					<option value="4">Image</option>
					<option value="5">RTF</option>
					<option value="6">Text</option>
					<option value="7">Excel</option>							
				</select>
			</td>
		<tr>
		<tr>
			<td>Display Inline</td>			
			<td>
				<select name="displayInline">
					<option value="true">True</option>
					<option value="false">False</option>
				</select>
			</td>
		<tr>
		<tr>
			<td>Prompt For Parameters</td>			
			<td>
				<select name="promptForParameters">
					<option value="true">True</option>
					<option value="false">False</option>
				</select>
			</td>
		<tr>
		<tr>
			<td class="dialogButtons" colspan="2">
		        <input class="standardButton" type="submit" value="Run">		     
		    </td>
	    </tr>
	</table>
	
	<p>
		<font color="blue">*Report Name or ID required. If both specified, Report Name will be used.</font><br>
		<font color="red">*UserName and Password only required on first call per session.</font>
	</p>
	</form>	
	
</div>

</body>

<s:include value="Footer.jsp" />