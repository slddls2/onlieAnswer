package com.hopu.onlineAnswer.domain;

import java.io.Serializable;

import com.hopu.onlineAnswer.util.StringUtil;
/**
 * 错题
 *
 */
public class ErrorAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6432553370026691728L;
	private String errorid;
	private String qid;
	private String qtext;
	private String option_a;
	private String option_b;
	private String option_c;
	private String option_d;
	private String option_true;
	private String option_stu;
	public ErrorAnswer(String errorid, String qid, String qtext, String option_a, String option_b, String option_c,
			String option_d, String option_true, String option_stu) {
		super();
		this.errorid = errorid;
		this.qid = qid;
		this.qtext = qtext;
		this.qtext = StringUtil.replace(qtext);
		this.option_a = StringUtil.replace(option_a);
		this.option_b = StringUtil.replace(option_b);
		this.option_c = StringUtil.replace(option_c);
		this.option_d = StringUtil.replace(option_d);
		this.option_true = option_true;
		this.option_stu = option_stu;
	}
	public ErrorAnswer() {
		super();
	}
	public String getErrorid() {
		return errorid;
	}
	public void setErrorid(String errorid) {
		this.errorid = errorid;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getQtext() {
		return qtext;
	}
	public void setQtext(String qtext) {
		this.qtext = StringUtil.replace(qtext);
	}
	public String getOption_a() {
		return option_a;
	}
	public void setOption_a(String option_a) {
		this.option_a = StringUtil.replace(option_a);
	}
	public String getOption_b() {
		return option_b;
	}
	public void setOption_b(String option_b) {
		this.option_b = StringUtil.replace(option_b);
	}
	public String getOption_c() {
		return option_c;
	}
	public void setOption_c(String option_c) {
		this.option_c = StringUtil.replace(option_c);
	}
	public String getOption_d() {
		return option_d;
	}
	public void setOption_d(String option_d) {
		this.option_d = StringUtil.replace(option_d);
	}
	public String getOption_true() {
		return option_true;
	}
	public void setOption_true(String option_true) {
		this.option_true = option_true;
	}
	public String getOption_stu() {
		return option_stu;
	}
	public void setOption_stu(String option_stu) {
		this.option_stu = option_stu;
	}
	@Override
	public String toString() {
		return "ErrorAnswer [errorid=" + errorid + ", qid=" + qid + ", qtext=" + qtext + ", option_a=" + option_a
				+ ", option_b=" + option_b + ", option_c=" + option_c + ", option_d=" + option_d + ", option_true="
				+ option_true + ", option_stu=" + option_stu + "]";
	}
	
}
