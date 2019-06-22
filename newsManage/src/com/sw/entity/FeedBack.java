package com.sw.entity;

import java.sql.Timestamp;
/**
 * 反馈信息实体类
 * @author lsl
 *
 */
public class FeedBack {
	private int f_id;
	private String f_text;
	private Timestamp f_time;
	private int u_id;
	@Override
	public String toString() {
		return "Feedback [f_id=" + f_id + ", f_text=" + f_text + ", f_time="
				+ f_time + ", u_id=" + u_id + "]";
	}
	public FeedBack(){}
	/**
	 * 
	 * @param f_id 反馈信息ID
	 * @param f_text 反馈信息正文
	 * @param f_time 反馈信息时间
	 * @param u_id 用户ID
	 */
	public FeedBack(int f_id, String f_text, Timestamp f_time, int u_id) {
		super();
		this.f_id = f_id;
		this.f_text = f_text;
		this.f_time = f_time;
		this.u_id = u_id;
	}
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getF_text() {
		return f_text;
	}
	public void setF_text(String f_text) {
		this.f_text = f_text;
	}
	public Timestamp getF_time() {
		return f_time;
	}
	public void setF_time(Timestamp f_time) {
		this.f_time = f_time;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	

}
	
