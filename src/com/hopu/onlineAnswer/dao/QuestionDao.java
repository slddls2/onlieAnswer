package com.hopu.onlineAnswer.dao;

import java.util.List;

import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Question;

/**
 * 题目持久层接口
 *
 */
public interface QuestionDao {

	List<Question> random(String cid, String num);

	List<String> findByQidList(String qids);


	ErrorAnswer findErrorById(ErrorAnswer e);

}
