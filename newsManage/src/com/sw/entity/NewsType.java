package com.sw.entity;
/**
 * 新闻类别实体类
 * @author lsl
 *
 */
public class NewsType {
	private int type_id;
	private String type_name;
	private String type_introduce;
	
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getType_introduce() {
		return type_introduce;
	}
	public void setType_introduce(String type_introduce) {
		this.type_introduce = type_introduce;
	}
	
	/**
	 * 
	 * @param type_id 新闻类型ID
	 * @param type_name 新闻类型名称
	 * @param type_introduce 新闻类型介绍
	 */
	public NewsType(int type_id, String type_name, String type_introduce) {
		super();
		this.type_id = type_id;
		this.type_name = type_name;
		this.type_introduce = type_introduce;
	}
	public NewsType(){}
	
	@Override
	public String toString() {
		return "NewsType [type_id=" + type_id + ", type_name=" + type_name
				+ ", type_introduce=" + type_introduce + "]";
	}
	
	

}
