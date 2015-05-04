package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ExecuteReportTest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/displaytag.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005factionerror_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_s_005finclude_005f0(_jspx_page_context))
        return;
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_s_005factionerror_005f0(_jspx_page_context))
        return;
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("<body marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("\n");
      out.write("<div align=\"center\">\t\t\n");
      out.write("\t\n");
      out.write("\t<br/>\n");
      out.write("\t\n");
      out.write("\t<form action=\"executeReport.action\" method=\"get\" target=\"_blank\">  \n");
      out.write("\n");
      out.write("\t<table class=\"dialog\">\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th colspan=\"2\">OpenReports - ExecuteReport Test Page</th>\n");
      out.write("\t\t</tr>\n");
      out.write("\t</table>\n");
      out.write("\t\n");
      out.write("\t<table class=\"dialog\">\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Report Name <font color=\"blue\">*</font></td>\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"reportName\" value=\"\"></td>\n");
      out.write("\t\t<tr>\t\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Report ID <font color=\"blue\">*</font></td>\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"reportId\" value=\"\"></td>\n");
      out.write("\t\t<tr>\t\n");
      out.write("\t\t\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>UserName <font color=\"red\">*</font></td>\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"userName\" value=\"admin\"></td>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Password <font color=\"red\">*</font></td>\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"password\" value=\"admin\"></td>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Export Type</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<select name=\"exportType\">\n");
      out.write("\t\t\t\t\t<option value=\"0\">PDF</option>\n");
      out.write("\t\t\t\t\t<option value=\"1\">XLS</option>\n");
      out.write("\t\t\t\t\t<option value=\"2\">HTML</option>\n");
      out.write("\t\t\t\t\t<option value=\"3\">CSV</option>\n");
      out.write("\t\t\t\t\t<option value=\"4\">Image</option>\n");
      out.write("\t\t\t\t\t<option value=\"5\">RTF</option>\n");
      out.write("\t\t\t\t\t<option value=\"6\">Text</option>\n");
      out.write("\t\t\t\t\t<option value=\"7\">Excel</option>\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t</select>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Display Inline</td>\t\t\t\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<select name=\"displayInline\">\n");
      out.write("\t\t\t\t\t<option value=\"true\">True</option>\n");
      out.write("\t\t\t\t\t<option value=\"false\">False</option>\n");
      out.write("\t\t\t\t</select>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>Prompt For Parameters</td>\t\t\t\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<select name=\"promptForParameters\">\n");
      out.write("\t\t\t\t\t<option value=\"true\">True</option>\n");
      out.write("\t\t\t\t\t<option value=\"false\">False</option>\n");
      out.write("\t\t\t\t</select>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td class=\"dialogButtons\" colspan=\"2\">\n");
      out.write("\t\t        <input class=\"standardButton\" type=\"submit\" value=\"Run\">\t\t     \n");
      out.write("\t\t    </td>\n");
      out.write("\t    </tr>\n");
      out.write("\t</table>\n");
      out.write("\t\n");
      out.write("\t<p>\n");
      out.write("\t\t<font color=\"blue\">*Report Name or ID required. If both specified, Report Name will be used.</font><br>\n");
      out.write("\t\t<font color=\"red\">*UserName and Password only required on first call per session.</font>\n");
      out.write("\t</p>\n");
      out.write("\t</form>\t\n");
      out.write("\t\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      if (_jspx_meth_s_005finclude_005f1(_jspx_page_context))
        return;
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_s_005finclude_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:include
    org.apache.struts2.views.jsp.IncludeTag _jspx_th_s_005finclude_005f0 = (org.apache.struts2.views.jsp.IncludeTag) _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.get(org.apache.struts2.views.jsp.IncludeTag.class);
    _jspx_th_s_005finclude_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005finclude_005f0.setParent(null);
    _jspx_th_s_005finclude_005f0.setValue("Banner.jsp");
    int _jspx_eval_s_005finclude_005f0 = _jspx_th_s_005finclude_005f0.doStartTag();
    if (_jspx_th_s_005finclude_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.reuse(_jspx_th_s_005finclude_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.reuse(_jspx_th_s_005finclude_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005factionerror_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:actionerror
    org.apache.struts2.views.jsp.ui.ActionErrorTag _jspx_th_s_005factionerror_005f0 = (org.apache.struts2.views.jsp.ui.ActionErrorTag) _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.get(org.apache.struts2.views.jsp.ui.ActionErrorTag.class);
    _jspx_th_s_005factionerror_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005factionerror_005f0.setParent(null);
    int _jspx_eval_s_005factionerror_005f0 = _jspx_th_s_005factionerror_005f0.doStartTag();
    if (_jspx_th_s_005factionerror_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.reuse(_jspx_th_s_005factionerror_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.reuse(_jspx_th_s_005factionerror_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005finclude_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:include
    org.apache.struts2.views.jsp.IncludeTag _jspx_th_s_005finclude_005f1 = (org.apache.struts2.views.jsp.IncludeTag) _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.get(org.apache.struts2.views.jsp.IncludeTag.class);
    _jspx_th_s_005finclude_005f1.setPageContext(_jspx_page_context);
    _jspx_th_s_005finclude_005f1.setParent(null);
    _jspx_th_s_005finclude_005f1.setValue("Footer.jsp");
    int _jspx_eval_s_005finclude_005f1 = _jspx_th_s_005finclude_005f1.doStartTag();
    if (_jspx_th_s_005finclude_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.reuse(_jspx_th_s_005finclude_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.reuse(_jspx_th_s_005finclude_005f1);
    return false;
  }
}
