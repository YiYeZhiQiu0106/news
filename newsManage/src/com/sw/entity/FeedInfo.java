package com.sw.entity;

import java.sql.Timestamp;

/**
 * Feed页面实体
 * @author 顿盛华
 *
 */
public class FeedInfo {

	private int f_id;
	private String f_text;
	private String u_name;
	private int u_age;
	private String u_phone;
	private Timestamp f_time;
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
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public Timestamp getF_time() {
		return f_time;
	}
	public void setF_time(Timestamp f_time) {
		this.f_time = f_time;
	}
	public FeedInfo(int f_id, String f_text, String u_name, int u_age,
			String u_phone, Timestamp f_time) {
		super();
		this.f_id = f_id;
		this.f_text = f_text;
		this.u_name = u_name;
		this.u_age = u_age;
		this.u_phone = u_phone;
		this.f_time = f_time;
	}
	
	public FeedInfo(){}
	@Override
	public String toString() {
		return "FeedInfo [f_id=" + f_id + ", f_text=" + f_text + ", u_name="
				+ u_name + ", u_age=" + u_age + ", u_phone=" + u_phone
				+ ", f_time=" + f_time + "]";
	}
}
