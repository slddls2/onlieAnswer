package com.hopu.onlineAnswer.service.impl;

import java.util.List;

import com.hopu.onlineAnswer.dao.CourseDao;
import com.hopu.onlineAnswer.dao.impl.CourseDaoImpl;
import com.hopu.onlineAnswer.domain.Course;
import com.hopu.onlineAnswer.service.CourseService;
/**
 *科目业务层 
 *
 */
public class CourseServiceImpl implements CourseService {

	private CourseDao dao = new CourseDaoImpl();

	@Override
	public List<Course> findAll() {
		
		return dao.findAll();
	}

	@Override
	public String findCnamesByIds(String cid) {
		return dao.findCnamesByIds(cid);
	}
}
