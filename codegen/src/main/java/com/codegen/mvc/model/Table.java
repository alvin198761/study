package com.codegen.mvc.model;

public class Table {

	private String table_name;
	private String comments;
	private String class_name;

	private String tab_name;
	private String cls_name;
	private String cn_name;

	public String getTab_name() {
		return tab_name;
	}

	public void setTab_name(String tab_name) {
		this.tab_name = tab_name;
	}

	public String getCls_name() {
		return cls_name;
	}

	public void setCls_name(String cls_name) {
		this.cls_name = cls_name;
	}

	public String getCn_name() {
		return cn_name;
	}

	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}

	public String getTab_hidden() {
		return tab_hidden;
	}

	public void setTab_hidden(String tab_hidden) {
		this.tab_hidden = tab_hidden;
	}

	private String tab_hidden;

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
