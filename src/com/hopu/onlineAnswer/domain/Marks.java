package com.hopu.onlineAnswer.domain;

import java.io.Serializable;


public class Marks implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7043799737079347090L;
	private Integer mid;
	private String cname;
	private Integer test_num;
	private String false_id;
	private String start_time;
	private String total_time;
	private Integer marks;
	private UserInfo user;
	public Marks() {
		super();
	}
	public Marks(Integer mid, String cname, Integer test_num, String false_id, String start_time, String total_time,
			Integer marks, UserInfo user) {
		super();
		this.mid = mid;
		this.cname = cname;
		this.test_num = test_num;
		this.false_id = false_id;
		this.start_time = start_time;
		this.total_time = total_time;
		this.marks = marks;
		this.user = user;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getTest_num() {
		return test_num;
	}
	public void setTest_num(Integer test_num) {
		this.test_num = test_num;
	}
	public String getFalse_id() {
		return false_id;
	}
	public void setFalse_id(String false_id) {
		this.false_id = false_id;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getTotal_time() {
		return total_time;
	}
	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
	public Integer getMarks() {
		return marks;
	}
	public void setMarks(Integer marks) {
		this.marks = marks;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Marks [mid=" + mid + ", cname=" + cname + ", test_num=" + test_num + ", false_id=" + false_id
				+ ", start_time=" + start_time + ", total_time=" + total_time + ", marks=" + marks + ", user=" + user
				+ "]";
	}
	
}
