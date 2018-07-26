package com.hopu.onlineAnswer.service;

import com.hopu.onlineAnswer.domain.UserInfo;

/**
 * 用户业务层接口
 *
 */
public interface UserInfoService {
	/**
	 * 登录方法
	 * @param uid
	 * @param uname
	 * @return
	 */
	UserInfo login(String uid, String uname);

}
