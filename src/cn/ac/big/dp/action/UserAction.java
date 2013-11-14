package cn.ac.big.dp.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.User;
import cn.ac.big.dp.service.IUserService;
import cn.ac.big.dp.util.Page;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<User> userList;
	private IUserService userService;
	
	private User user;
	private int userId;
	private String ids;
	
	private int pageNo;
	private int rowCount;
	private int pageSize;
	private int isFirstSerachFlag;
	
	private Page page;
	
	@SuppressWarnings("unchecked")
	public String getAllUsers()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String requestPath = "http://"
			+ ServletActionContext.getRequest().getServerName()+":"
			+ ServletActionContext.getRequest().getServerPort()
			+ ServletActionContext.getRequest().getContextPath()
			+ ServletActionContext.getRequest().getServletPath();
		
		if(isFirstSerachFlag == 1){
			userList = this.userService.getAllUsers();
			session.setAttribute("userList", userList);
			page = new Page(userList.size());
		}
		else{
			userList = (List<User>) session.getAttribute("userList");
			page = new Page(rowCount, pageNo, pageSize);
		}
		page.setLinkHref(requestPath+"?1=1");
		userList = userList.subList(page.getRowFrom(), page.getRowTo()+1);
		return SUCCESS;
	}
	public String getUserById()
	{
		user = this.userService.getUser(userId);
		return SUCCESS;
	}
	public String addUser()
	{
		this.userService.addUser(user);
		return SUCCESS;
	}
	public String deleteUser()
	{
		String[] delIds = ids.split(",");
		for(String id : delIds){
			this.userService.deleteUserByUserId(Integer.parseInt(id));
		}
		userList = this.userService.getAllUsers();
		return SUCCESS;
	}
	public String updateUser()
	{
		this.userService.updateUser(user);
		return this.getAllUsers();
	}
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getIsFirstSerachFlag() {
		return isFirstSerachFlag;
	}
	public void setIsFirstSerachFlag(int isFirstSerachFlag) {
		this.isFirstSerachFlag = isFirstSerachFlag;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
}
