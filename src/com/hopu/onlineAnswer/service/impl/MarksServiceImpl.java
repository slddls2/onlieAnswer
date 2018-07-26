package com.hopu.onlineAnswer.service.impl;

import java.util.List;

import com.hopu.onlineAnswer.dao.MarksDao;
import com.hopu.onlineAnswer.dao.QuestionDao;
import com.hopu.onlineAnswer.dao.impl.MarksDaoImpl;
import com.hopu.onlineAnswer.dao.impl.QuestionDaoImpl;
import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.MarksFind;
import com.hopu.onlineAnswer.service.MarksService;
/**
 * 成绩业务层
 *
 */
public class MarksServiceImpl implements MarksService {

	private MarksDao dao =new MarksDaoImpl();

	@Override
	public Integer findMidByMarks(Marks marks) {
		return dao.findMidByMarks(marks);
	}


	@Override
	public List<ErrorAnswer> lookError(List<ErrorAnswer> errorAnswerList) {
		QuestionDao qDao= new QuestionDaoImpl();
		for(ErrorAnswer e : errorAnswerList){
			e = qDao.findErrorById(e);
		}
		// TODO 输出错题集合
		System.out.println(errorAnswerList);
		return errorAnswerList;
	}


	@Override
	public List<Marks> teaFind(MarksFind find) {
		return dao.teaFind(find);
	}}
