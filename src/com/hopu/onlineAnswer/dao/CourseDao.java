package com.hopu.onlineAnswer.dao;

import java.util.List;

import com.hopu.onlineAnswer.domain.Course;

/**
 * 科目持久层接口
 * @author slddls
 *
 */
public interface CourseDao {

	/**
	 * 查询全部
	 * @return
	 */
	List<Course> findAll();

	String findCnamesByIds(String cid);

}
