package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div align=\"center\">\n");
      out.write("\n");
      out.write("  <table border=\"0\" cellspacing=\"0\" cellpadding=\"4\" width=\"55%\">\n");
      out.write("    <tr>\n");
      out.write("      <div id=\"footer\" align=\"center\" class=c\"\"ontainer\"\">\n");
      out.write("\t\t  <hr>\n");
      out.write("\t\t\t<ul class=\"inline text-center\">\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/company\" data-s=\"footer-about-us\">Company</a></li>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/products\" data-s=\"footer-products\">Products</a></li>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/docs\" data-s=\"footer-resources\">Resources</a></li>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/blog\" data-s=\"footer-blog\">Blog</a></li>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/help\" data-s=\"footer-help\">Support</a></li>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<li><a href=\"/user/account/settings\" data-s=\"footer-account\">Account</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t<div class=\"inline text-center\">\n");
      out.write("\t\t\t\t<p>\n");
      out.write("\t\t\t\t\tÂ© 2015 Riverturn, Inc. All rights reserved.\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t</tr>\n");
      out.write("        </div>\n");
      out.write("    </tr>\n");
      out.write("  </table>\n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
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
}
