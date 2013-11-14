package cn.ac.big.dp.util;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyPagerBar extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Page page;

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			if (page == null) {
				out.println("No UserInfo Found...");
				return SKIP_BODY;
			}
			out.print("<span>页码:");
			out.print("&nbsp;");
			out.print(page.getPageNo());
			out.print("/");
			out.print(page.getLastPageNo());
			out.print("</span>&nbsp;");
			out.print("<a class=\"win-command\" href=\""+ page.getLinkHref() +"&pageNo="+ page.getFirstPageNo() + "&rowCount="+ page.getRowCount()+ "&pageSize="+ page.getPageSize() +"\"><span class=\"win-commandimage PNG-Upload\"></span><span class=\"win-label\">首页</span></a>");
			if(page.getIsHasPreviousPage()==1){
				out.print("<a class=\"win-command\" href=\""+ page.getLinkHref() +"&pageNo="+ page.getPreviousPageNo() + "&rowCount="+ page.getRowCount()+ "&pageSize="+ page.getPageSize() +"\"><span class=\"win-commandimage PNG-Left\"></span><span class=\"win-label\">上一页</span></a>");
			}
			else{
				out.print("<a class=\"win-command\" href=\"javascript:void(0)\"><span class=\"win-commandimage PNG-Left\"></span><span class=\"win-label\">上一页</span></a>");
			}
			if(page.getIsHasNextPage()==1){
				out.print("<a class=\"win-command\" href=\""+ page.getLinkHref() +"&pageNo="+ page.getNextPageNo() + "&rowCount="+ page.getRowCount()+ "&pageSize="+ page.getPageSize() +"\"><span class=\"win-commandimage PNG-Right\"></span><span class=\"win-label\">下一页</span></a>");
			}
			else{
				out.print("<a class=\"win-command\" href=\"javascript:void(0)\"><span class=\"win-commandimage PNG-Right\"></span><span class=\"win-label\">下一页</span></a>");
			}
			out.print("<a class=\"win-command\" href=\""+ page.getLinkHref() +"&pageNo="+ page.getLastPageNo() + "&rowCount="+ page.getRowCount()+ "&pageSize="+ page.getPageSize() +"\"><span class=\"win-commandimage PNG-Download\"></span><span class=\"win-label\">尾页</span></a>");
			
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
		this.page = null;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
