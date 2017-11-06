package com.codegen.mvc.model;

import com.common.condition.BaseCondition;
import com.common.constant.Constant;

public class InitPara extends BaseCondition {

	@Override
	public void addCondition() {
		if (Constant.DATABASE.equals("Oracle")) {// 数断数据库类型
			add(table_name, "AND T.TABLE_NAME LIKE ?", 3);
		} else if (Constant.DATABASE.contains("MySQL")) {
			add(table_name, "AND TABLE_NAME LIKE ?", 3);
		} else if (Constant.DATABASE.equals("Microsoft SQL Server")) {
			add(table_name, "AND D.NAME LIKE ?", 3);
		}
	}

	private String company = "dl";// 公司名
	private String prj = "keep";// 项目名
	private String model = "cloud";// 模块名
	private String packname;// 完整包名
	private String author = "gzz_gzz@163.com";// 作者名
	private String class_name;// 类名
	private String cn_name;// 类中文名
	private String chk;// 是否被选中
	private String tab_name;// 表名
	private String tab_hidden;
	private Integer edition = 1;// 代码风格:1标准版2简版
	private String dbtype = Constant.DATABASE;// 数据库类型
	private Integer i18n = 0;// 国际化支持:0不支持国际化1支持国际化
	private String codeType = "list";// 代码类型:list列表tree树型
	private Integer isWeb = 1;// 项目类型: 0java工程1web工程
	private Integer PKey = 1;// 主键规则: 1自增涨 2UUID 3oracle序列

	public Integer getPKey() {
		return PKey;
	}

	public void setPKey(Integer pKey) {
		PKey = pKey;
	}

	private String table_name;

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getI18n() {
		return i18n;
	}

	public void setI18n(Integer i18n) {
		this.i18n = i18n;
	}

	public String getDbtype() {
		return dbtype;
	}

	public void setDbtype(String dbtype) {
		this.dbtype = dbtype;
	}

	public Integer getEdition() {
		return edition;
	}

	public void setEdition(Integer edition) {
		this.edition = edition;
	}

	public String getPrj() {
		return prj;
	}

	public void setPrj(String prj) {
		this.prj = prj;
	}

	public String getTab_hidden() {
		return tab_hidden;
	}

	public void setTab_hidden(String tab_hidden) {
		this.tab_hidden = tab_hidden;
	}

	public String getTab_name() {
		return tab_name;
	}

	public void setTab_name(String tab_name) {
		this.tab_name = tab_name;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPackname() {
		return packname;
	}

	public void setPackname(String packname) {
		this.packname = packname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getCn_name() {
		return cn_name;
	}

	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public Integer getIsWeb() {
		return isWeb;
	}

	public void setIsWeb(Integer isWeb) {
		this.isWeb = isWeb;
	}

}