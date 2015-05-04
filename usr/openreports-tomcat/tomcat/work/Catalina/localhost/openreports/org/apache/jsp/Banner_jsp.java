package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Banner_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005fif_005ftest;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fs_005fif_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fs_005fif_005ftest.release();
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
      out.write("<html>\n");
      out.write("<script id=\"tinyhippos-injected\">if (window.top.ripple) { window.top.ripple(\"bootstrap\").inject(window, document); }</script>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("    <meta http-equiv=\"Pragma\" content=\"public\">\n");
      out.write("    <meta http-equiv=\"Cache-Control\" content=\"max-age=0\">\n");
      out.write("    <link rel=\"icon\" href=\"../../favicon.ico\">\n");
      out.write("\t  <!-- YUI Dependencies -->\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/yahoo-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/dom-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/event-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/animation-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/dragdrop-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/connection-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/container-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/element-beta-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/tabview-min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"/openreports/js/yui/button-beta-min.js\"></script> \n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"/openreports/css/yui/container.css\" />\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"/openreports/css/yui/tabview.css\">\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"/openreports/css/yui/button.css\">  \n");
      out.write("  <!-- End YUI Dependencies -->\n");
      out.write("\n");
      out.write("    <title>Riverturn Reporter</title>\n");
      out.write("\t\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/openreports/css/yui/reset-fonts-grids.css\" />\n");
      out.write("  <link href=\"/openreports/css/openreports.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"/openreports/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"/openreports/font-awesome-4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"/openreports/css/air-theme.css\" rel=\"stylesheet\">\n");
      out.write("   <script src=\"/openreports/js/vendor/jquery.min.js\"></script>\n");
      out.write("   <script src=\"/openreports/js/vendor/bootstrap.min.js\"></script>\n");
      out.write("    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("    <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n");
      out.write("    <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"yui-skin-sam\">\n");
      out.write("\n");
      if (_jspx_meth_s_005fif_005f0(_jspx_page_context))
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

  private boolean _jspx_meth_s_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f0 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f0.setParent(null);
    _jspx_th_s_005fif_005f0.setTest("report == null || !report.isDisplayInline()");
    int _jspx_eval_s_005fif_005f0 = _jspx_th_s_005fif_005f0.doStartTag();
    if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f0.doInitBody();
      }
      do {
        out.write("\n");
        out.write("<!-- begin top nav area -->\n");
        out.write("<nav class=\"navbar navbar-inverse navbar-top navbar-static-top\" role=\"navigation\">\n");
        out.write("    <div class=\"container\">\n");
        out.write("        <div class=\"navbar-header\">\n");
        out.write("            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n");
        out.write("                <span class=\"sr-only\">Toggle navigation</span>\n");
        out.write("                <span class=\"icon-bar\"></span>\n");
        out.write("                <span class=\"icon-bar\"></span>\n");
        out.write("                <span class=\"icon-bar\"></span>\n");
        out.write("            </button>\n");
        out.write("            <a class=\"navbar-brand\"><img src=\"/images/test_logo.png\"></a>\n");
        out.write("        </div>\n");
        if (_jspx_meth_s_005fif_005f1(_jspx_th_s_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("<!-- end top nav area --> \n");
        out.write("<script type=\"text/javascript\">\n");
        out.write("\tvar menuButton1 = new YAHOO.widget.Button(\"logoffButton\");\n");
        out.write("\tvar menuButton2 = new YAHOO.widget.Button(\"reportsButton\");\n");
        out.write("\tvar menuButton3 = new YAHOO.widget.Button(\"adminButton\");\n");
        out.write("\tvar menuButton4 = new YAHOO.widget.Button(\"dashboardButton\");\n");
        out.write("\tvar menuButton4 = new YAHOO.widget.Button(\"schedulerButton\");\n");
        out.write("\tvar menuButton4 = new YAHOO.widget.Button(\"userAdminButton\");\n");
        out.write("</script> \n");
        out.write("\n");
        out.write("<SCRIPT LANGUAGE=JAVASCRIPT TYPE=\"TEXT/JAVASCRIPT\">\n");
        out.write("if (location.pathname==\"/openreports/dashboard.action\") {\n");
        out.write("\tdocument.getElementById(\"dash\").style.content = \"\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.position = \"absolute\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.width = \"12px\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.height = \"12px\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.background = \"#00456A\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.transform = \"rotate(135deg)\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.bottom = \"-7\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.left = \"60px\";\n");
        out.write("\tdocument.getElementById(\"dash\").style.boxShadow = \"-1px -1px 10px -2px rgba(0, 0, 0, 0.5)\";}\n");
        out.write("</SCRIPT>\n");
        out.write("<SCRIPT LANGUAGE=JAVASCRIPT TYPE=\"TEXT/JAVASCRIPT\">\n");
        out.write("if (location.pathname==\"/openreports/listScheduledReports.action\") {\n");
        out.write("\tdocument.getElementById(\"sched\").style.content = \"\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.position = \"absolute\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.width = \"12px\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.height = \"12px\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.background = \"#00456A\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.transform = \"rotate(135deg)\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.bottom = \"-7\";\n");
        out.write("\tdocument.getElementById(\"sched\").style.left = \"80px\";\n");
        out.write("document.getElementById(\"sched\").style.boxShadow = \"-1px -1px 10px -2px rgba(0, 0, 0, 0.5)\";}\n");
        out.write("</SCRIPT>\n");
        out.write("<SCRIPT LANGUAGE=JAVASCRIPT TYPE=\"TEXT/JAVASCRIPT\">\n");
        out.write("if (location.pathname==\"/openreports/reportAdmin.action\") {\n");
        out.write("\tdocument.getElementById(\"admin\").style.content = \"\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.position = \"absolute\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.width = \"12px\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.height = \"12px\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.background = \"#00456A\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.transform = \"rotate(135deg)\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.bottom = \"-7\";\n");
        out.write("\tdocument.getElementById(\"admin\").style.left = \"70px\";\n");
        out.write("document.getElementById(\"admin\").style.boxShadow = \"-1px -1px 10px -2px rgba(0, 0, 0, 0.5)\";}\n");
        out.write("</SCRIPT>\n");
        out.write("<SCRIPT LANGUAGE=JAVASCRIPT TYPE=\"TEXT/JAVASCRIPT\">\n");
        out.write("if (location.pathname==\"/openreports/reportList.action\") {\n");
        out.write("\tdocument.getElementById(\"report\").style.content = \"\";\n");
        out.write("\tdocument.getElementById(\"report\").style.position = \"absolute\";\n");
        out.write("\tdocument.getElementById(\"report\").style.width = \"12px\";\n");
        out.write("\tdocument.getElementById(\"report\").style.height = \"12px\";\n");
        out.write("\tdocument.getElementById(\"report\").style.background = \"#00456A\";\n");
        out.write("\tdocument.getElementById(\"report\").style.transform = \"rotate(135deg)\";\n");
        out.write("\tdocument.getElementById(\"report\").style.bottom = \"-7\";\n");
        out.write("\tdocument.getElementById(\"report\").style.left = \"50px\";\n");
        out.write("document.getElementById(\"report\").style.boxShadow = \"-1px -1px 10px -2px rgba(0, 0, 0, 0.5)\";}\n");
        out.write("</SCRIPT>\n");
        out.write("<SCRIPT LANGUAGE=JAVASCRIPT TYPE=\"TEXT/JAVASCRIPT\">\n");
        out.write("if (location.pathname==\"/openreports/userAdmin.action\") {\n");
        out.write("\tdocument.getElementById(\"pref\").style.content = \"\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.position = \"absolute\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.width = \"12px\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.height = \"12px\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.background = \"#00456A\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.transform = \"rotate(135deg)\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.bottom = \"-7\";\n");
        out.write("\tdocument.getElementById(\"pref\").style.left = \"60px\";\n");
        out.write("document.getElementById(\"pref\").style.boxShadow = \"-1px -1px 10px -2px rgba(0, 0, 0, 0.5)\";}\n");
        out.write("</SCRIPT>\n");
        out.write("\n");
        int evalDoAfterBody = _jspx_th_s_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f1 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f0);
    _jspx_th_s_005fif_005f1.setTest("#session.breadcrumbs != null");
    int _jspx_eval_s_005fif_005f1 = _jspx_th_s_005fif_005f1.doStartTag();
    if (_jspx_eval_s_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f1.doInitBody();
      }
      do {
        out.write(" \n");
        out.write("        <div id=\"navbar\" class=\"navbar-collapse collapse\">\n");
        out.write("            <ul class=\"nav navbar-nav navbar-right\">\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_s_005fif_005f2(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_s_005fif_005f3(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_s_005fif_005f4(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_s_005fif_005f5(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("\t\t\t\t\n");
        out.write("            </ul>\n");
        out.write("        </div>\n");
        out.write("    </div>\n");
        out.write("</nav>\n");
        out.write("<nav class=\"navbar navbar-inverse navbar-subnav navbar-static-top\">\n");
        out.write("    <div class=\"navbar-inner\">\n");
        out.write("        <div class=\"container\">\n");
        out.write("            <ul class=\"nav\">\n");
        out.write("                <!-- <li class=\"active\"><a href=\"/user/account/voice-messaging\" data-s=\"header-submenu-dashboard\">Dashboard</a></li> -->\n");
        out.write("                <!-- <li><a href=\"/user/account/voice-messaging/getting-started\" data-s=\"header-submenu-getting-started\">Getting Started</a></li> -->\n");
        out.write("            </ul>\n");
        out.write("        </div>\n");
        out.write("    </div>\n");
        out.write("</nav>\n");
        int evalDoAfterBody = _jspx_th_s_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f1);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f2 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fif_005f2.setTest("#session.user.dashboardUser");
    int _jspx_eval_s_005fif_005f2 = _jspx_th_s_005fif_005f2.doStartTag();
    if (_jspx_eval_s_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f2.doInitBody();
      }
      do {
        out.write("\n");
        out.write("                <li><a href=\"/openreports/dashboard.action\"><i class=\"fa fa-dashboard\"></i> Dashboard</a><div id=\"dash\"></div></li>\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_s_005fif_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f2);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f3 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f3.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fif_005f3.setTest("#session.user.scheduler");
    int _jspx_eval_s_005fif_005f3 = _jspx_th_s_005fif_005f3.doStartTag();
    if (_jspx_eval_s_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f3.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f3.doInitBody();
      }
      do {
        out.write("\n");
        out.write("\t\t\t\t<li><a href=\"/openreports/listScheduledReports.action\"><i class=\"fa fa-clock-o\"></i> Scheduled Reports</a><div id=\"sched\"></div></li>\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_s_005fif_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f3);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f4(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f4 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f4.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fif_005f4.setTest("#session.user.adminUser");
    int _jspx_eval_s_005fif_005f4 = _jspx_th_s_005fif_005f4.doStartTag();
    if (_jspx_eval_s_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f4.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f4.doInitBody();
      }
      do {
        out.write("\n");
        out.write("                <li><a href=\"/openreports/reportAdmin.action\"><i class=\"fa fa-users\"></i> Administration</a><div id=\"admin\"></div></li>\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_s_005fif_005f4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f4);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f5(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f5 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f5.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f5.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fif_005f5.setTest("#session.user");
    int _jspx_eval_s_005fif_005f5 = _jspx_th_s_005fif_005f5.doStartTag();
    if (_jspx_eval_s_005fif_005f5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f5.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f5.doInitBody();
      }
      do {
        out.write("\n");
        out.write("\t\t\t\t<li><a href=\"/openreports/reportGroup.action\"><i class=\"fa fa-area-chart\"></i> Reports</a><div id=\"report\"></div></li>\n");
        out.write("                <li><a href=\"/openreports/userAdmin.action\"><i class=\"fa fa-gear\"></i> Preferences</a><div id=\"pref\"></div></li>\n");
        out.write("                <li><a href=\"/openreports/logout.action\"><i class=\"fa fa-sign-out\"></i> Logoff</a><div class=\"normal\"></div></li>\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_s_005fif_005f5.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f5);
    return false;
  }
}
