package com.hopu.onlineAnswer.service;

import java.util.List;

import com.hopu.onlineAnswer.domain.Course;

/**
 * 科目业务层接口
 *
 */
public interface CourseService {

	/**
	 * 查询全部科目
	 * @return
	 */
	List<Course> findAll();

	String findCnamesByIds(String cid);

}
