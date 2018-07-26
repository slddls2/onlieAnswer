package com.hopu.onlineAnswer.dao;

import com.hopu.onlineAnswer.domain.UserInfo;

/**
 * 用户持久层接口
 *
 */
public interface UserInfoDao {
	/**
	 * 查询单个记录
	 * @param uid
	 * @param uname
	 * @return
	 */
	UserInfo find(String uid, String uname);

}
