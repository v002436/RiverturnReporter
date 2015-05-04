<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 

<br>
<iframe src="/cgi-bin/AddDataSourceExtract.pl" width="1000" height="800"></iframe>
<br>
  <form method="get" action="/openreports/AddDSDashboard.jsp">
    <button type="submit">Start Over</button>
</form>
<s:include value="Footer.jsp" />