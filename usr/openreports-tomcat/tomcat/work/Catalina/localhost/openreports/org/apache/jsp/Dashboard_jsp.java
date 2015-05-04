package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/displaytag.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005factionerror_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005fif_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005fif_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fs_005finclude_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.release();
    _005fjspx_005ftagPool_005fs_005fif_005ftest.release();
    _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.release();
    _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody.release();
    _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass.release();
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.release();
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody.release();
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody.release();
    _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.release();
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
      out.write("<br/>\n");
      out.write("\n");
      out.write("<div align=\"center\">\n");
      out.write("\n");
      //  s:if
      org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f0 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
      _jspx_th_s_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_s_005fif_005f0.setParent(null);
      _jspx_th_s_005fif_005f0.setTest("alerts.size() != 0");
      int _jspx_eval_s_005fif_005f0 = _jspx_th_s_005fif_005f0.doStartTag();
      if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_th_s_005fif_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_s_005fif_005f0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("\n");
          out.write("  <div class=\"img-alert important\" id=\"instructions\"  style=\"border-bottom: 1px solid;\">");
          if (_jspx_meth_s_005ftext_005f0(_jspx_th_s_005fif_005f0, _jspx_page_context))
            return;
          out.write("</div>\n");
          out.write("\n");
          out.write("  <div>\n");
          out.write("  \n");
          out.write("  ");
          if (_jspx_meth_s_005fset_005f0(_jspx_th_s_005fif_005f0, _jspx_page_context))
            return;
          out.write("\n");
          out.write("  \n");
          out.write("\n");
          out.write("  ");
          //  display:table
          org.displaytag.tags.TableTag _jspx_th_display_005ftable_005f0 = (org.displaytag.tags.TableTag) _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass.get(org.displaytag.tags.TableTag.class);
          _jspx_th_display_005ftable_005f0.setPageContext(_jspx_page_context);
          _jspx_th_display_005ftable_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f0);
          _jspx_th_display_005ftable_005f0.setName(new String("alerts"));
          _jspx_th_display_005ftable_005f0.setClass("displayTag");
          _jspx_th_display_005ftable_005f0.setSort("list");
          _jspx_th_display_005ftable_005f0.setDecorator("org.efs.openreports.util.AlertTableDecorator");
          _jspx_th_display_005ftable_005f0.setUid("alertTable");
          int _jspx_eval_display_005ftable_005f0 = _jspx_th_display_005ftable_005f0.doStartTag();
          if (_jspx_eval_display_005ftable_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            java.lang.Object alertTable = null;
            java.lang.Integer alertTable_rowNum = null;
            if (_jspx_eval_display_005ftable_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.pushBody();
              _jspx_th_display_005ftable_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
              _jspx_th_display_005ftable_005f0.doInitBody();
            }
            alertTable = (java.lang.Object) _jspx_page_context.findAttribute("alertTable");
            alertTable_rowNum = (java.lang.Integer) _jspx_page_context.findAttribute("alertTable_rowNum");
            do {
              out.write("  \t   \t      \n");
              out.write("    ");
              if (_jspx_meth_display_005fcolumn_005f0(_jspx_th_display_005ftable_005f0, _jspx_page_context))
                return;
              out.write("    \t     \t      \t      \n");
              out.write("    ");
              if (_jspx_meth_display_005fcolumn_005f1(_jspx_th_display_005ftable_005f0, _jspx_page_context))
                return;
              out.write("\n");
              out.write("    ");
              if (_jspx_meth_display_005fcolumn_005f2(_jspx_th_display_005ftable_005f0, _jspx_page_context))
                return;
              out.write("\n");
              out.write("    ");
              if (_jspx_meth_display_005fcolumn_005f3(_jspx_th_display_005ftable_005f0, _jspx_page_context))
                return;
              out.write("\n");
              out.write("   \t");
              if (_jspx_meth_display_005fcolumn_005f4(_jspx_th_display_005ftable_005f0, _jspx_page_context))
                return;
              out.write('\n');
              out.write(' ');
              out.write(' ');
              int evalDoAfterBody = _jspx_th_display_005ftable_005f0.doAfterBody();
              alertTable = (java.lang.Object) _jspx_page_context.findAttribute("alertTable");
              alertTable_rowNum = (java.lang.Integer) _jspx_page_context.findAttribute("alertTable_rowNum");
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
            if (_jspx_eval_display_005ftable_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
              out = _jspx_page_context.popBody();
            }
          }
          if (_jspx_th_display_005ftable_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass.reuse(_jspx_th_display_005ftable_005f0);
            return;
          }
          _005fjspx_005ftagPool_005fdisplay_005ftable_005fsort_005fname_005fid_005fdecorator_005fclass.reuse(_jspx_th_display_005ftable_005f0);
          out.write("   \n");
          out.write("      \n");
          out.write("  </div>\t\n");
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
        return;
      }
      _005fjspx_005ftagPool_005fs_005fif_005ftest.reuse(_jspx_th_s_005fif_005f0);
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_s_005fif_005f1(_jspx_page_context))
        return;
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_s_005fif_005f2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("</div>\t\n");
      out.write("\n");
      if (_jspx_meth_s_005finclude_005f1(_jspx_page_context))
        return;
      out.write(' ');
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

  private boolean _jspx_meth_s_005ftext_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:text
    org.apache.struts2.views.jsp.TextTag _jspx_th_s_005ftext_005f0 = (org.apache.struts2.views.jsp.TextTag) _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.get(org.apache.struts2.views.jsp.TextTag.class);
    _jspx_th_s_005ftext_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005ftext_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f0);
    _jspx_th_s_005ftext_005f0.setName("label.alerts");
    int _jspx_eval_s_005ftext_005f0 = _jspx_th_s_005ftext_005f0.doStartTag();
    if (_jspx_th_s_005ftext_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.reuse(_jspx_th_s_005ftext_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.reuse(_jspx_th_s_005ftext_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005fset_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:set
    org.apache.struts2.views.jsp.SetTag _jspx_th_s_005fset_005f0 = (org.apache.struts2.views.jsp.SetTag) _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody.get(org.apache.struts2.views.jsp.SetTag.class);
    _jspx_th_s_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005fset_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f0);
    _jspx_th_s_005fset_005f0.setName("alerts");
    _jspx_th_s_005fset_005f0.setValue("alerts");
    _jspx_th_s_005fset_005f0.setScope("request");
    int _jspx_eval_s_005fset_005f0 = _jspx_th_s_005fset_005f0.doStartTag();
    if (_jspx_th_s_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody.reuse(_jspx_th_s_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fset_005fvalue_005fscope_005fname_005fnobody.reuse(_jspx_th_s_005fset_005f0);
    return false;
  }

  private boolean _jspx_meth_display_005fcolumn_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_display_005ftable_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  display:column
    org.displaytag.tags.ColumnTag _jspx_th_display_005fcolumn_005f0 = (org.displaytag.tags.ColumnTag) _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.get(org.displaytag.tags.ColumnTag.class);
    _jspx_th_display_005fcolumn_005f0.setPageContext(_jspx_page_context);
    _jspx_th_display_005fcolumn_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_display_005ftable_005f0);
    _jspx_th_display_005fcolumn_005f0.setProperty("alert.name");
    _jspx_th_display_005fcolumn_005f0.setTitleKey("label.name");
    _jspx_th_display_005fcolumn_005f0.setSortable(true);
    _jspx_th_display_005fcolumn_005f0.setHeaderClass("sortable");
    int _jspx_eval_display_005fcolumn_005f0 = _jspx_th_display_005fcolumn_005f0.doStartTag();
    if (_jspx_th_display_005fcolumn_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f0);
    return false;
  }

  private boolean _jspx_meth_display_005fcolumn_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_display_005ftable_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  display:column
    org.displaytag.tags.ColumnTag _jspx_th_display_005fcolumn_005f1 = (org.displaytag.tags.ColumnTag) _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.get(org.displaytag.tags.ColumnTag.class);
    _jspx_th_display_005fcolumn_005f1.setPageContext(_jspx_page_context);
    _jspx_th_display_005fcolumn_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_display_005ftable_005f0);
    _jspx_th_display_005fcolumn_005f1.setProperty("condition");
    _jspx_th_display_005fcolumn_005f1.setTitleKey("label.condition");
    _jspx_th_display_005fcolumn_005f1.setSortable(true);
    _jspx_th_display_005fcolumn_005f1.setHeaderClass("sortable");
    int _jspx_eval_display_005fcolumn_005f1 = _jspx_th_display_005fcolumn_005f1.doStartTag();
    if (_jspx_th_display_005fcolumn_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f1);
    return false;
  }

  private boolean _jspx_meth_display_005fcolumn_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_display_005ftable_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  display:column
    org.displaytag.tags.ColumnTag _jspx_th_display_005fcolumn_005f2 = (org.displaytag.tags.ColumnTag) _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.get(org.displaytag.tags.ColumnTag.class);
    _jspx_th_display_005fcolumn_005f2.setPageContext(_jspx_page_context);
    _jspx_th_display_005fcolumn_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_display_005ftable_005f0);
    _jspx_th_display_005fcolumn_005f2.setProperty("count");
    _jspx_th_display_005fcolumn_005f2.setTitleKey("label.value");
    _jspx_th_display_005fcolumn_005f2.setSortable(true);
    _jspx_th_display_005fcolumn_005f2.setHeaderClass("sortable");
    int _jspx_eval_display_005fcolumn_005f2 = _jspx_th_display_005fcolumn_005f2.doStartTag();
    if (_jspx_th_display_005fcolumn_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f2);
    return false;
  }

  private boolean _jspx_meth_display_005fcolumn_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_display_005ftable_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  display:column
    org.displaytag.tags.ColumnTag _jspx_th_display_005fcolumn_005f3 = (org.displaytag.tags.ColumnTag) _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody.get(org.displaytag.tags.ColumnTag.class);
    _jspx_th_display_005fcolumn_005f3.setPageContext(_jspx_page_context);
    _jspx_th_display_005fcolumn_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_display_005ftable_005f0);
    _jspx_th_display_005fcolumn_005f3.setProperty("status");
    _jspx_th_display_005fcolumn_005f3.setTitleKey("label.status");
    _jspx_th_display_005fcolumn_005f3.setSortable(true);
    _jspx_th_display_005fcolumn_005f3.setHeaderClass("sortable");
    _jspx_th_display_005fcolumn_005f3.setClass("alert");
    int _jspx_eval_display_005fcolumn_005f3 = _jspx_th_display_005fcolumn_005f3.doStartTag();
    if (_jspx_th_display_005fcolumn_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fheaderClass_005fclass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f3);
    return false;
  }

  private boolean _jspx_meth_display_005fcolumn_005f4(javax.servlet.jsp.tagext.JspTag _jspx_th_display_005ftable_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  display:column
    org.displaytag.tags.ColumnTag _jspx_th_display_005fcolumn_005f4 = (org.displaytag.tags.ColumnTag) _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody.get(org.displaytag.tags.ColumnTag.class);
    _jspx_th_display_005fcolumn_005f4.setPageContext(_jspx_page_context);
    _jspx_th_display_005fcolumn_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_display_005ftable_005f0);
    _jspx_th_display_005fcolumn_005f4.setProperty("report.name");
    _jspx_th_display_005fcolumn_005f4.setTitleKey("label.report");
    _jspx_th_display_005fcolumn_005f4.setHref("reportDetail.action");
    _jspx_th_display_005fcolumn_005f4.setParamId("reportId");
    _jspx_th_display_005fcolumn_005f4.setParamProperty("report.id");
    _jspx_th_display_005fcolumn_005f4.setSortable(true);
    _jspx_th_display_005fcolumn_005f4.setHeaderClass("sortable");
    int _jspx_eval_display_005fcolumn_005f4 = _jspx_th_display_005fcolumn_005f4.doStartTag();
    if (_jspx_th_display_005fcolumn_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fdisplay_005fcolumn_005ftitleKey_005fsortable_005fproperty_005fparamProperty_005fparamId_005fhref_005fheaderClass_005fnobody.reuse(_jspx_th_display_005fcolumn_005f4);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f1 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f1.setParent(null);
    _jspx_th_s_005fif_005f1.setTest("report != null");
    int _jspx_eval_s_005fif_005f1 = _jspx_th_s_005fif_005f1.doStartTag();
    if (_jspx_eval_s_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f1.doInitBody();
      }
      do {
        out.write("\n");
        out.write("\n");
        out.write("  <br/>\n");
        out.write("\n");
        out.write("  <div class=\"important img-report\" id=\"instructions\" style=\"border-bottom: 1px solid;\">Dashboard Results</div>   \n");
        out.write("  <br/>\n");
        out.write("<form name=\"change\">\n");
        out.write("<SELECT NAME=\"options\" ONCHANGE=\"document.getElementById('youriframe').src = this.options[this.selectedIndex].value\">\n");
        out.write("<option selected>Select Report</option>\n");
        out.write("<option value=\"/openreports/reportDetail.action?reportId=");
        if (_jspx_meth_s_005fproperty_005f0(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\">My Report</option>\n");
        out.write("<option value=\"/openreports/reportDetail.action?reportId=94&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\">Agent Version</option>\n");
        out.write("<option value=\"/openreports/reportDetail.action?reportId=93&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\">Customer</option>\n");
        out.write("<option value=\"/openreports/reportDetail.action?reportId=74&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\">OS Counts All</option>\n");
        out.write("<option value=\"/openreports/reportDetail.action?reportId=75&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\">OS Counts Windows</option>\n");
        out.write("</SELECT>\n");
        out.write("<br>\n");
        out.write("  <br/>\n");
        out.write("  \n");
        out.write("  <div>\t\n");
        out.write("  \n");
        out.write("    <iframe name=\"iframe\" id=\"youriframe\" frameborder=\"0\" width=\"100%\" height=\"1000px\" src=\"/openreports/reportDetail.action?reportId=");
        if (_jspx_meth_s_005fproperty_005f1(_jspx_th_s_005fif_005f1, _jspx_page_context))
          return true;
        out.write("&exportType=2&dashboardReport=true&displayInline=true&promptForParameters=true\"></iframe>\n");
        out.write("\t\n");
        out.write(" \t\n");
        out.write("\t<br/>\t\t\t\n");
        out.write("  \n");
        out.write("  </div>\t\n");
        out.write("\n");
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

  private boolean _jspx_meth_s_005fproperty_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:property
    org.apache.struts2.views.jsp.PropertyTag _jspx_th_s_005fproperty_005f0 = (org.apache.struts2.views.jsp.PropertyTag) _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.get(org.apache.struts2.views.jsp.PropertyTag.class);
    _jspx_th_s_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005fproperty_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fproperty_005f0.setValue("report.id");
    int _jspx_eval_s_005fproperty_005f0 = _jspx_th_s_005fproperty_005f0.doStartTag();
    if (_jspx_th_s_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.reuse(_jspx_th_s_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.reuse(_jspx_th_s_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005fproperty_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:property
    org.apache.struts2.views.jsp.PropertyTag _jspx_th_s_005fproperty_005f1 = (org.apache.struts2.views.jsp.PropertyTag) _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.get(org.apache.struts2.views.jsp.PropertyTag.class);
    _jspx_th_s_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_s_005fproperty_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f1);
    _jspx_th_s_005fproperty_005f1.setValue("report.id");
    int _jspx_eval_s_005fproperty_005f1 = _jspx_th_s_005fproperty_005f1.doStartTag();
    if (_jspx_th_s_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.reuse(_jspx_th_s_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fproperty_005fvalue_005fnobody.reuse(_jspx_th_s_005fproperty_005f1);
    return false;
  }

  private boolean _jspx_meth_s_005fif_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f2 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f2.setParent(null);
    _jspx_th_s_005fif_005f2.setTest("report == null || alerts.size() == 0");
    int _jspx_eval_s_005fif_005f2 = _jspx_th_s_005fif_005f2.doStartTag();
    if (_jspx_eval_s_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f2.doInitBody();
      }
      do {
        out.write("\n");
        out.write("\n");
        out.write("<div align=\"center\">\n");
        out.write("\t<br>\t\n");
        out.write("\t<b>");
        if (_jspx_meth_s_005ftext_005f1(_jspx_th_s_005fif_005f2, _jspx_page_context))
          return true;
        out.write("</b>\n");
        out.write("</div>\n");
        out.write("\n");
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

  private boolean _jspx_meth_s_005ftext_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:text
    org.apache.struts2.views.jsp.TextTag _jspx_th_s_005ftext_005f1 = (org.apache.struts2.views.jsp.TextTag) _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.get(org.apache.struts2.views.jsp.TextTag.class);
    _jspx_th_s_005ftext_005f1.setPageContext(_jspx_page_context);
    _jspx_th_s_005ftext_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f2);
    _jspx_th_s_005ftext_005f1.setName("dashboard.message");
    int _jspx_eval_s_005ftext_005f1 = _jspx_th_s_005ftext_005f1.doStartTag();
    if (_jspx_th_s_005ftext_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.reuse(_jspx_th_s_005ftext_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005ftext_005fname_005fnobody.reuse(_jspx_th_s_005ftext_005f1);
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
