package com.hopu.onlineAnswer.test;

import org.junit.Test;

import com.hopu.onlineAnswer.util.DBUtil;

/**
 * 数据库工具类测试
 * @author slddls
 *
 */
public class DBUtilTest {

	@Test
	public void getPst(){
		System.out.println(DBUtil.getPst(""));
	}
	
}
