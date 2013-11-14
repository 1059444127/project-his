package cn.ac.big.dp.util;

public class SystemContext {
	
	private static ThreadLocal<Integer> fromIndex = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> totalCount = new ThreadLocal<Integer>();
	
	public static Integer getFromIndex() {
		return fromIndex.get();
	}
	public static void setFromIndex(Integer fromIndex) {
		SystemContext.fromIndex.set(fromIndex);
	}
	public static Integer getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(Integer pageSize) {
		SystemContext.pageSize.set(pageSize);
	}
	public static Integer getTotalCount() {
		return totalCount.get();
	}
	public static void setTotalCount(Integer totalCount) {
		SystemContext.totalCount.set(totalCount);
	}
	public static void removeFromIndex() {
		fromIndex.remove();
	}
	public static void removePageSize() {
		pageSize.remove();
	}
	public static void removeTotalCount() {
		totalCount.remove();
	}
	
}
