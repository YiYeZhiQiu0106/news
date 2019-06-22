package com.sw.entity;

import java.sql.Timestamp;
/**
 * 用户实体类
 * @author lsl
 *
 */
public class Nuser {
	private int u_id;
	private String u_name;
	private String u_sex;
	private int u_age;
	private String u_phone;
	private String u_pwd;
	private Timestamp u_time;
	@Override
	public String toString() {
		return "Nusers [u_id=" + u_id + ", u_name=" + u_name + ", u_sex="
				+ u_sex + ", u_age=" + u_age + ", u_phone=" + u_phone
				+ ", u_pwd=" + u_pwd + ", u_time=" + u_time + "]";
	}
	public Nuser(){}
	/**
	 * 
	 * @param u_id 用户ID
	 * @param u_name 用户姓名
	 * @param u_sex 用户性别
	 * @param u_age 用户年龄
	 * @param u_phone 用户手机号
	 * @param u_pwd 用户密码
	 * @param u_time 用户注册时间
	 */
	public Nuser(int u_id, String u_name, String u_sex, int u_age,
			String u_phone, String u_pwd, Timestamp u_time) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_sex = u_sex;
		this.u_age = u_age;
		this.u_phone = u_phone;
		this.u_pwd = u_pwd;
		this.u_time = u_time;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
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
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public Timestamp getU_time() {
		return u_time;
	}
	public void setU_time(Timestamp u_time) {
		this.u_time = u_time;
	}
}
