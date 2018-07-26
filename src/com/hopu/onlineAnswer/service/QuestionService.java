package com.hopu.onlineAnswer.service;

import java.util.List;
import java.util.Map;

import com.hopu.onlineAnswer.domain.Question;

/**
 * 题目业务层接口
 *
 */
public interface QuestionService {

	/**
	 * 根据科目和数量，从题库随机抽取题目
	 * @param cid
	 * @param num
	 * @return
	 */
	List<Question> random(String cid, String num);

	List<Object> result(Map<String, Object> map);

}
