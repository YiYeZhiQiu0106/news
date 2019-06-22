package com.sw.entity;

import java.sql.Timestamp;

public class NuserNews {
	private String n_author;
	private String n_title;
	private int n_id;
	private String n_img;
	private int n_state;
	private Timestamp n_time;
	
	/**n_author 作者
	 * n_title 标题
	 * n_id 新闻ID
	 * n_img 新闻图片
	 * n_state 新闻状态
	 * n_time 收藏时间
	 * @return
	 */
	public String getN_author() {
		return n_author;
	}
	public Timestamp getN_time() {
		return n_time;
	}
	public void setN_time(Timestamp n_time) {
		this.n_time = n_time;
	}
	public void setN_author(String n_author) {
		this.n_author = n_author;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_img() {
		return n_img;
	}
	public void setN_img(String n_img) {
		this.n_img = n_img;
	}
	public int getN_state() {
		return n_state;
	}
	public void setN_state(int n_state) {
		this.n_state = n_state;
	}
	public NuserNews(String n_author, String n_title, int n_id, String n_img,
			int n_state, Timestamp n_time) {
		super();
		this.n_author = n_author;
		this.n_title = n_title;
		this.n_id = n_id;
		this.n_img = n_img;
		this.n_state = n_state;
		this.n_time = n_time;
	}
	public NuserNews() {
	}
	@Override
	public String toString() {
		return "NuserNews [n_author=" + n_author + ", n_title=" + n_title
				+ ", n_id=" + n_id + ", n_img=" + n_img + ", n_state="
				+ n_state + ", n_time=" + n_time + "]";
	}
	
	
}
