package com.sw.entity;

/**
 * 分页的实体
 * curPage   当前页码
 * totalRows 总条数
 * rows	           每页的条数
 * totalPage 总页数
 * @author 顿盛华
 *
 */
public class PageBean {
	private int curPage;
	private int totalRows;
	private int rows;
	private int totalPage;
	
	/**
	 * 通过总条数和每页条数自动计算 最大的页码
	 * @param totalRows 总页数
	 * @param rows 每页的条数
	 */
	public PageBean(int totalRows,int rows){
		this.totalRows = totalRows;
		this.rows = rows;
		if(totalRows%rows==0){
			totalPage = totalRows/rows;
		}else{
			totalPage = totalRows/rows+1;
		}
	}
	
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
