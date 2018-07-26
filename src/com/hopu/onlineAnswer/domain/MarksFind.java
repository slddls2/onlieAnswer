package com.hopu.onlineAnswer.domain;

import java.io.Serializable;

public class MarksFind implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -441473332366172849L;
	private String find1;
	private String find2;
	private String findName1;
	private String findName2;
	private String start_time1;
	private String start_time2;
	public MarksFind() {
		super();
	}
	public MarksFind(String find1, String find2, String findName1, String findName2, String start_time1,
			String start_time2) {
		super();
		this.find1 = find1;
		this.find2 = find2;
		this.findName1 = findName1;
		this.findName2 = findName2;
		this.start_time1 = start_time1;
		this.start_time2 = start_time2;
	}
	public String getFind1() {
		return find1;
	}
	public void setFind1(String find1) {
		this.find1 = find1;
	}
	public String getFind2() {
		return find2;
	}
	public void setFind2(String find2) {
		this.find2 = find2;
	}
	public String getFindName1() {
		return findName1;
	}
	public void setFindName1(String findName1) {
		this.findName1 = findName1;
	}
	public String getFindName2() {
		return findName2;
	}
	public void setFindName2(String findName2) {
		this.findName2 = findName2;
	}
	public String getStart_time1() {
		return start_time1;
	}
	public void setStart_time1(String start_time1) {
		this.start_time1 = start_time1;
	}
	public String getStart_time2() {
		return start_time2;
	}
	public void setStart_time2(String start_time2) {
		this.start_time2 = start_time2;
	}
	@Override
	public String toString() {
		return "MarksFind [find1=" + find1 + ", find2=" + find2 + ", findName1=" + findName1 + ", findName2="
				+ findName2 + ", start_time1=" + start_time1 + ", start_time2=" + start_time2 + "]";
	}
	
}
