package com.sw.entity;
/**
 * 收藏历史实体类
 * @author lsl
 *
 */
public class History {
	private int h_id;
	private int n_id;
	private int h_degree;
	@Override
	public String toString() {
		return "History [h_id=" + h_id + ", n_id=" + n_id + ", h_degree="
				+ h_degree + "]";
	}
	public History(){}
	/**
	 * 
	 * @param h_id 收藏历史ID
	 * @param n_id 新闻ID
	 * @param h_degree 收藏次数
	 */
	public History(int h_id, int n_id, int h_degree) {
		super();
		this.h_id = h_id;
		this.n_id = n_id;
		this.h_degree = h_degree;
	}
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public int getH_degree() {
		return h_degree;
	}
	public void setH_degree(int h_degree) {
		this.h_degree = h_degree;
	}
}
