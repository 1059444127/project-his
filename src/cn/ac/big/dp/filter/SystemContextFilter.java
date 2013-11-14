package cn.ac.big.dp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cn.ac.big.dp.util.SystemContext;

public class SystemContextFilter implements Filter {

	private int pageSize;
	private int pageNo;
	private int fromIndex;
	private int totalCount;
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		int pageSize = this.pageSize;
		try {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		} catch (NumberFormatException e) {
		} finally{
			SystemContext.setPageSize(pageSize);
		}
		int pageNo = this.pageNo;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch (NumberFormatException e) {
		} finally {
			SystemContext.setFromIndex((pageNo-1)*pageSize);
		}
		int totalCount = this.totalCount;
		try{
			totalCount = Integer.parseInt(request.getParameter("rowCount"));
		} catch (NumberFormatException e) {
		} finally {
			SystemContext.setTotalCount(totalCount);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		pageSize = Integer.parseInt(config.getInitParameter("pageSize"));
		pageNo = Integer.parseInt(config.getInitParameter("pageNo"));
		totalCount = Integer.parseInt(config.getInitParameter("totalCount"));
		fromIndex = Integer.parseInt(config.getInitParameter("fromIndex"));
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFromIndex() {
		return fromIndex;
	}

	public void setFromIndex(int fromIndex) {
		this.fromIndex = fromIndex;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}
