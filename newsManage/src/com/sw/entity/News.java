package com.sw.entity;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;
/**
 * 新闻信息实体类
 * @author lsl
 */
public class News {
	private int n_id;
	private String n_title; 
	private String n_text;
	private String n_author;
	private Timestamp n_time;
	private String n_img;
	private String n_roundup;
	private int type_id;
	private int n_state;
	
	public int getN_state() {
		return n_state;
	}
	public void setN_state(int n_state) {
		this.n_state = n_state;
	}
	public News(){}
	/**
	 * 
	 * @param n_id 新闻ID
	 * @param n_title 新闻标题
	 * @param n_text 新闻正文
	 * @param n_author 新闻作者
	 * @param n_time 新闻时间
	 * @param n_img 新闻封面图片
	 * @param n_roundup 新闻摘要
	 * @param type_id 新闻类型
	 * @param n_state 新闻状态
	 */
	public News(int n_id, String n_title, String n_text, String n_author,
			Timestamp n_time, String n_img, String n_roundup, int type_id,int n_state) {
		super();
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_text = n_text;
		this.n_author = n_author;
		this.n_time = n_time;
		this.n_img = n_img;
		this.n_roundup = n_roundup;
		this.type_id = type_id;
		this.n_state = n_state;
	}
	@Override
	public String toString() {
		return "News [n_id=" + n_id + ", n_title=" + n_title + ", n_text="
				+ n_text + ", n_author=" + n_author + ", n_time=" + n_time
				+ ", n_img=" + n_img + ", n_roundup=" + n_roundup
				+ ", type_id=" + type_id + "]";
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_text() {
		return n_text;
	}
	public void setN_text(String n_text) {
		this.n_text = n_text;
	}
	public String getN_author() {
		return n_author;
	}
	public void setN_author(String n_author) {
		this.n_author = n_author;
	}
	public Timestamp getN_time() {
		return n_time;
	}
	public void setN_time(Timestamp n_time) {
		this.n_time = n_time;
	}
	public String getN_img() {
		return n_img;
	}
	public void setN_img(String n_img) {
		this.n_img = n_img;
	}
	public String getN_roundup() {
		return n_roundup;
	}
	public void setN_roundup(String n_roundup) {
		this.n_roundup = n_roundup;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	
	
}
