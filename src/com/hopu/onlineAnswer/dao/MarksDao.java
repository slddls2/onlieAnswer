package com.hopu.onlineAnswer.dao;

import java.util.List;

import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.MarksFind;

/**
 * 成绩结果持久层接口
 * @author slddls
 *
 */
public interface MarksDao {

	void save(Marks mark);


	Integer findMidByMarks(Marks marks);


	List<Marks> teaFind(MarksFind find);



}
