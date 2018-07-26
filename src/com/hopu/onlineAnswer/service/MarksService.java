package com.hopu.onlineAnswer.service;

import java.util.List;

import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.MarksFind;

/**
 * 成绩业务层接口
 *
 */
public interface MarksService {


	Integer findMidByMarks(Marks marks);

	List<ErrorAnswer> lookError(List<ErrorAnswer> errorAnswerList);

	List<Marks> teaFind(MarksFind find);

}
