package com.sw.entity;
/**
 * 收藏历史管理类
 * @author 顿盛华
 *
 */
public class HistoryInfo {
	
	private int h_id;//收藏ID
	private int n_id;//文章ID
	private String n_title;//文章标题
	private String n_author;//文章作者
	private int type_id;//类型ID
	private String type_name;//类型名
	private int h_degree;//收藏数量
	
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
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_author() {
		return n_author;
	}
	public void setN_author(String n_author) {
		this.n_author = n_author;
	}
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
	public int getH_degree() {
		return h_degree;
	}
	public void setH_degree(int h_degree) {
		this.h_degree = h_degree;
	}
	public HistoryInfo(int h_id, int n_id, String n_title, String n_author,
			int type_id, String type_name, int h_degree) {
		super();
		this.h_id = h_id;
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_author = n_author;
		this.type_id = type_id;
		this.type_name = type_name;
		this.h_degree = h_degree;
	}
	
	public HistoryInfo(){}
	
	@Override
	public String toString() {
		return "HistoryInfo [h_id=" + h_id + ", n_id=" + n_id + ", n_title="
				+ n_title + ", n_author=" + n_author + ", type_id=" + type_id
				+ ", type_name=" + type_name + ", h_degree=" + h_degree + "]";
	}
}
