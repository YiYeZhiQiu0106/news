package com.sw.entity;
/**
 * 管理员实体类
 * @author lsl
 *
 */
public class Manages {
	private int m_id;
	private String m_name;
	private String m_idNumber;
	private String m_tel;
	private String m_pwd;
	
	public Manages(){}
	/**
	 * 
	 * @param m_id 管理员ID
	 * @param m_name 管理员姓名
	 * @param m_idNumber 管理员身份证号
	 * @param m_pwd 管理员密码
	 */
	public Manages(int m_id, String m_name, String m_idNumber,String m_tel, String m_pwd) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_idNumber = m_idNumber;
		this.m_tel = m_tel;
		this.m_pwd = m_pwd;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_idNumber() {
		return m_idNumber;
	}
	public void setM_idNumber(String m_idNumber) {
		this.m_idNumber = m_idNumber;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	@Override
	public String toString() {
		return "Manages [m_id=" + m_id + ", m_name=" + m_name + ", m_idNumber="
				+ m_idNumber + ", m_tel=" + m_tel + ", m_pwd=" + m_pwd + "]";
	}
	
	
}
