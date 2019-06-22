package com.sw.entity;

import java.sql.Timestamp;
/**
 * 新闻收藏实体类
 * @author lsl
 *
 */
public class Collectioned {
	private int c_id;
	private int u_id;
	private int n_id;
	private Timestamp c_time;
	@Override
	public String toString() {
		return "Collection [c_id=" + c_id + ", u_id=" + u_id + ", n_id=" + n_id
				+ ", c_time=" + c_time + "]";
	}
	public Collectioned(){}
	/**
	 * 
	 * @param c_id 新闻收藏ID
	 * @param u_id 用户ID
	 * @param n_id 新闻信息ID
	 * @param c_time 新闻收藏时间
	 */
	public Collectioned(int c_id, int u_id, int n_id, Timestamp c_time) {
		super();
		this.c_id = c_id;
		this.u_id = u_id;
		this.n_id = n_id;
		this.c_time = c_time;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public Timestamp getC_time() {
		return c_time;
	}
	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}
	
}
