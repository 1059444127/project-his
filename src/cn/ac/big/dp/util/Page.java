package cn.ac.big.dp.util;

import java.io.Serializable;

public class Page implements Serializable 
{
	
	private static final long serialVersionUID = 1L;
	
	public static final int DEFAULT_PAGE_NO = 1;
    public static final int DEFAULT_PAGE_SIZE = 15;
    private int rowCount;
    private int pageNo;
    private int pageSize;

    private int firstPageNo;
    private int lastPageNo;
    private int rowFrom;
    private int rowTo;
    private int isHasNextPage;
    private int isHasPreviousPage;
    private String linkHref;

    public Page(){}
    public Page(int rowCount) {
        this(rowCount, DEFAULT_PAGE_NO, DEFAULT_PAGE_SIZE);
    }
    public Page(int rowCount, int pageSize) {
    	this(rowCount, DEFAULT_PAGE_NO, pageSize);
    }
    public Page(int rowCount, int pageNo, int pageSize) 
    {
    	this.rowCount = rowCount < 0 ? 0:rowCount;
        this.pageSize = pageSize < 1 ? DEFAULT_PAGE_SIZE : pageSize;

        firstPageNo = 1;
        lastPageNo = this.rowCount==0?1:this.rowCount % this.pageSize ==0 ? this.rowCount /this.pageSize : this.rowCount / this.pageSize +1;
        
        if (pageNo < firstPageNo) 
        {
            this.pageNo = firstPageNo;
        }
        else if (pageNo > lastPageNo) 
        {
            this.pageNo = lastPageNo;
        } 
        else 
        {
            this.pageNo = pageNo;
        }
        
        this.rowFrom = (this.pageNo - 1) * this.pageSize;
        this.rowTo = (this.rowFrom + this.pageSize)>this.rowCount?this.rowCount-1:(this.rowFrom + this.pageSize)-1;
    }
    public int getPreviousPageNo() 
    {
        if (getIsHasPreviousPage()==0) 
        {
            return firstPageNo;
        }
        return pageNo - 1;
    }

    public int getNextPageNo() 
    {
        if (getIsHasNextPage()==0) 
        {
            return lastPageNo;
        }
        return pageNo + 1;
    }

    
    public int getIsHasNextPage() 
    {
    	this.isHasNextPage = pageNo < lastPageNo?1:0;
        return this.isHasNextPage;
    }

    public int getIsHasPreviousPage() 
    {
    	isHasPreviousPage = pageNo > firstPageNo?1:0;
        return isHasPreviousPage;
    }
   
    public int getRowCount() {
        return rowCount;
    }
    public int getPageSize() {
        return pageSize;
    }
    public int getPageNo() {
        return pageNo;
    }
    public int getFirstPageNo() {
        return firstPageNo;
    }
    public int getLastPageNo() {
        return lastPageNo;
    }
    public int getRowFrom() {
        return rowFrom;
    }

    public int getRowTo() {
        return rowTo;
    }
	@Override
	public String toString() {
		return "Page [rowCount=" + rowCount + ", pageNo=" + pageNo
				+ ", pageSize=" + pageSize + ", firstPageNo=" + firstPageNo
				+ ", lastPageNo=" + lastPageNo + ", rowFrom=" + rowFrom
				+ ", rowTo=" + rowTo + ", isHasNextPage=" + isHasNextPage
				+ ", isHasPreviousPage=" + isHasPreviousPage + ", linkHref="
				+ linkHref + "]";
	}
	public String getLinkHref() {
		return linkHref;
	}
	public void setLinkHref(String linkHref) {
		this.linkHref = linkHref;
	}

   
}
