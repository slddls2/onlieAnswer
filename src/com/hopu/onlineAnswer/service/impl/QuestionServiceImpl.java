package com.hopu.onlineAnswer.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hopu.onlineAnswer.dao.MarksDao;
import com.hopu.onlineAnswer.dao.QuestionDao;
import com.hopu.onlineAnswer.dao.impl.MarksDaoImpl;
import com.hopu.onlineAnswer.dao.impl.QuestionDaoImpl;
import com.hopu.onlineAnswer.domain.Course;
import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.Question;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.service.QuestionService;
/**
 * 题目业务层
 *
 */
public class QuestionServiceImpl implements QuestionService {

	private QuestionDao dao = new QuestionDaoImpl();

	@Override
	public List<Question> random(String cid, String num) {
		return dao.random(cid,num);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> result(Map<String, Object> map) {
		//题目编号
		String qids = "";
		//分数
		int marks = 0;
		//错题序号
		String false_id = "";
		//错题
		List<ErrorAnswer> errorAnswerList = new ArrayList<ErrorAnswer>();
		ErrorAnswer errorAnswer=null;
		//答题结束时间
		long endTime = System.currentTimeMillis();
		List<String> qidsList = (List<String>)map.get("qids");
		for(int i=0; i<qidsList.size()-1; i++){
			qids+=qidsList.get(i);
			if(i+2<qidsList.size()){
				qids+=", ";
			}
		}
		//得到正确答案
		List<String> options_true = dao.findByQidList(qids);
		//两个集合一起遍历判断 答题对错
		List<String> optionList = (List<String>)map.get("optionList");
		for(int i=0; i<options_true.size(); i++){
			if(options_true.get(i).equals(optionList.get(i))){
				marks+=2;
			}else{
				errorAnswer = new ErrorAnswer();
				errorAnswer.setErrorid(i+"");
				errorAnswer.setQid(qidsList.get(i));
				errorAnswer.setOption_true(options_true.get(i));
				errorAnswer.setOption_stu(optionList.get(i));
				errorAnswerList.add(errorAnswer);
				false_id+=","+qidsList.get(i);
			}
		}
		//去掉头部的逗号
		false_id=false_id.substring(1);
		/*计算用时
		 * */
		//开始时间
		long startTime = Long.parseLong(qidsList.get(qidsList.size()-1));
		String total_time = longToTimeString(endTime-startTime);
		String cname = ((Course)map.get("course")).getCname();
		Integer test_num=Integer.valueOf(((Course)map.get("course")).getNum());
		UserInfo user = ((UserInfo)map.get("user"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start_time = sdf.format(startTime);
		
		Marks mark = new Marks(null, cname, test_num, false_id, start_time, total_time, marks, user);
		// TODO 测试marks对象数据
		System.out.println(mark);
		
		MarksDao mDao = new MarksDaoImpl();
		mDao.save(mark);
		List<Object> list =new ArrayList<Object>();
		list.add(mark);
		list.add(errorAnswerList);
		return list;
	}
	
	/**
	 * 把long类型的时间转换为HH：MM：SS格式的字符串
	 * 不支持天数的计算
	 * @param total_time
	 * @return
	 */
	public String longToTimeString(long total_time) {
		total_time/=1000;//去掉毫秒
		int ss = (int) (total_time%60);//秒数
		int mm = (int) (total_time/60%60);//分钟
		int hh = (int) (total_time/60/60%60);//小时
		String timeHH = hh>9?""+hh:hh>0?"0"+hh:"00";
		String timeMM = mm>9?""+mm:mm>0?"0"+mm:"00";
		String timeSS = ss>9?""+ss:ss>0?"0"+ss:"00";
		String time = timeHH+":"+timeMM+":"+timeSS;
		return time;
	}
}
