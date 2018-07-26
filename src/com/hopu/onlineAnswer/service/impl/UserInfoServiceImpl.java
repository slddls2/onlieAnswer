package com.hopu.onlineAnswer.service.impl;

import com.hopu.onlineAnswer.dao.UserInfoDao;
import com.hopu.onlineAnswer.dao.impl.UserInfoDaoImpl;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.service.UserInfoService;
/**
 * 用户业务层
 *
 */
public class UserInfoServiceImpl implements UserInfoService {

	private UserInfoDao dao = new UserInfoDaoImpl();

	@Override
	public UserInfo login(String uid, String uname) {
	
		return dao.find(uid,uname);
	}
}
