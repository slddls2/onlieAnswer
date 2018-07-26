package com.hopu.onlineAnswer.domain;

import java.io.Serializable;

/**
 * 用户信息
 *
 */
public class UserInfo implements Serializable{
	
	/**
	 * 序列化编号
	 */
	private static final long serialVersionUID = -3157670965184862171L;
	
	private String uid;
	private String uname;
	private String usex;
	private String uclass;
	private String status;
	public UserInfo() {
		super();
	}
	public UserInfo(String uid, String uname, String usex, String uclass, String status) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.usex = usex;
		this.uclass = uclass;
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUclass() {
		return uclass;
	}
	public void setUclass(String uclass) {
		this.uclass = uclass;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "UserInfo [uid=" + uid + ", uname=" + uname + ", usex=" + usex + ", uclass=" + uclass + ", status="
				+ status + "]";
	}
	
}
