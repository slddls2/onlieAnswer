package com.hopu.onlineAnswer.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hopu.onlineAnswer.dao.QuestionDao;
import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Question;
import com.hopu.onlineAnswer.util.DBUtil;
/**
 * 题目持久层
 *
 */
public class QuestionDaoImpl implements QuestionDao {

	private PreparedStatement pst;
	private ResultSet rs;
	@Override
	public List<Question> random(String cid, String num) {
		String sql = "select *from(select *from question where cid in("+cid+") "
				+ "ORDER BY RAND(),qid  LIMIT  "+num +" ) q order by qid";
		pst = DBUtil.getPst(sql);
		try {
			rs = pst.executeQuery();
			List<Question> list = new ArrayList<Question>();
			Question q = null;
			while(rs.next()){
				q=new Question(rs.getString("qid"), rs.getString("qtext"), 
						rs.getString("option_a"), rs.getString("option_b"),
						rs.getString("option_c"), rs.getString("option_d"), 
						rs.getString("option_true"), rs.getInt("cid"));
				list.add(q);
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
	public List<String> findByQidList(String qids) {
		String sql = "select option_true from question where qid in("+qids+")  "
				+ "order by qid";
		pst = DBUtil.getPst(sql);
		try {
			rs = pst.executeQuery();
			List<String> list = new ArrayList<String>();
			while(rs.next()){
				list.add(rs.getString(1));
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
	public ErrorAnswer findErrorById(ErrorAnswer e) {
		String sql = "select qtext,option_a,option_b,option_c,option_d from question where qid=?";
		pst = DBUtil.getPst(sql);
		try {
			pst.setString(1, e.getQid());
			rs = pst.executeQuery();
			if(rs.next()){
				e.setQtext(rs.getString(1));
				e.setOption_a(rs.getString(2));
				e.setOption_b(rs.getString(3));
				e.setOption_c(rs.getString(4));
				e.setOption_d(rs.getString(5));
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return e;
	}
}
