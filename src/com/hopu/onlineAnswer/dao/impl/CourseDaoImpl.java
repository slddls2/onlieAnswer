package com.hopu.onlineAnswer.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hopu.onlineAnswer.dao.CourseDao;
import com.hopu.onlineAnswer.domain.Course;
import com.hopu.onlineAnswer.util.DBUtil;
/**
 * 科目持久层
 *
 */
public class CourseDaoImpl implements CourseDao {

	private PreparedStatement pst;
	private ResultSet rs;
	@Override
	public List<Course> findAll() {
		String sql = "select cid,cName from course where status=1";
		pst = DBUtil.getPst(sql);
		try {
			rs = pst.executeQuery();
			List<Course> list = new ArrayList<Course>();
			Course c = null;
			while(rs.next()){
				c=new Course(rs.getString("cid"), rs.getString("cName"));
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return null;
	}
	@Override
	public String findCnamesByIds(String cid) {
		String sql = "select cName from course where cid in("+cid+") and status=1";
		pst = DBUtil.getPst(sql);
		try {
			rs = pst.executeQuery();
			String  cname = "";
			while(rs.next()){
				cname += "+"+rs.getString("cName");
			}
			return cname.substring(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return null;
	}
}
