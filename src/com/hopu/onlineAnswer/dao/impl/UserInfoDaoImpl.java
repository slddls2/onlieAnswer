package com.hopu.onlineAnswer.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hopu.onlineAnswer.dao.UserInfoDao;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.util.DBUtil;
/**
 * 用户持久层
 *
 */
public class UserInfoDaoImpl implements UserInfoDao {
	
	private PreparedStatement pst;
	private ResultSet rs;
	@Override
	public UserInfo find(String uid, String uname) {
		String sql = "select *from userinfo where uid=? and uname=?";
		pst = DBUtil.getPst(sql);
		try {
			pst.setString(1, uid);
			pst.setString(2, uname);
			rs = pst.executeQuery();
			if(rs.next()){
				UserInfo u = new UserInfo(uid, uname, 
						rs.getString("usex"), rs.getString("uClass"), 
						rs.getString("status"));
				return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return null;
	}
}
