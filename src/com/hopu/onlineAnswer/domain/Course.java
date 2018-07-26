package com.hopu.onlineAnswer.domain;

import java.io.Serializable;

/**
 * 科目
 *
 */
public class Course implements Serializable {

	/**
	 * 序列化编号
	 */
	private static final long serialVersionUID = 3032254976601387317L;
	
	
	
	private String cid;
	private String cname;
	private String status;
	private String num;
	public Course() {
		super();
	}
	public Course(String cid, String cname, String status, String num) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.status = status;
		this.num = num;
	}
	public Course(String cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", cname=" + cname + ", status=" + status + ", num=" + num + "]";
	}
	
	
}
