package com.hopu.onlineAnswer.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hopu.onlineAnswer.dao.MarksDao;
import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.MarksFind;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.util.DBUtil;
/**
 * 成绩持久层
 *
 */
public class MarksDaoImpl implements MarksDao {

	private PreparedStatement pst;
	private ResultSet rs;
	@Override
	public void save(Marks mark) {
		String sql = "insert into marks (cname, uid, test_num, false_id, start_time, total_time, marks) values(?,?,?,?,?,?,?)";
		pst = DBUtil.getPst(sql);
		try {
			pst.setString(1, mark.getCname());
			pst.setString(2,mark.getUser().getUid());
			pst.setInt(3, mark.getTest_num());
			pst.setString(4, mark.getFalse_id());
			pst.setString(5, mark.getStart_time());
			pst.setString(6, mark.getTotal_time());
			pst.setInt(7, mark.getMarks());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		
	}
	
	@Override
	public Integer findMidByMarks(Marks marks) {
		String sql = "select mid from marks where cname=?"
				+ "  and uid=?  and test_num=? and false_id=?"
				+ "  and start_time=?  and total_time=?";
		pst = DBUtil.getPst(sql);
		try {
			pst.setString(1, marks.getCname());
			pst.setString(2, marks.getUser().getUid());
			pst.setInt(3, marks.getTest_num());
			pst.setString(4, marks.getFalse_id());
			pst.setString(5, marks.getStart_time());
			pst.setString(6, marks.getTotal_time());
			rs = pst.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return null;
	}

	@Override
	public List<Marks> teaFind(MarksFind find) {
		String sql = "select *from marks m inner join userinfo u "
				+ "on m.uid=u.uid  where 1=1";
		if(find.getFindName1()!=null&&!find.getFindName1().equals("")){
			sql+="  and "+find.getFind1()+"='"+find.getFindName1()+"'";
		}
		if(find.getFindName2()!=null&&!find.getFindName2().equals("")){
			sql+="  and "+find.getFind2()+"='"+find.getFindName2()+"'";
		}
		if(find.getStart_time1()!=null&&!(find.getStart_time1().equals(""))){
			sql+="  and start_time>'"+find.getStart_time1()+"'";
		}
		if(find.getStart_time2()!=null&&!(find.getStart_time2().equals(""))){
			sql+="  and start_time<'"+find.getStart_time2()+"'";
		}
		// TODO 输出拼接后的条件查询语句
		System.out.println("查询条件对象"+find);
		System.out.println("查询语句--"+sql);
		List<Marks> list=new ArrayList<Marks>();
		Marks marks=null;
		UserInfo user = null;
		pst = DBUtil.getPst(sql);
		try {
			rs=pst.executeQuery();
			while(rs.next()){
				user = new UserInfo(rs.getString("uid"), rs.getString("uname"),
						rs.getString("usex"), rs.getString("uclass"),
						null);
				marks=new Marks(
				  rs.getInt("mid"), rs.getString("cname"),
				  rs.getInt("test_num"), rs.getString("false_id"),
				  rs.getString("start_time"), rs.getString("total_time"),
				  rs.getInt("marks"), user);
				list.add(marks);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
		}
		return null;
	}

	
}
