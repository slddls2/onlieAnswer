package com.hopu.onlineAnswer.util;

public class StringUtil {

	/**
	 * 拼接 字符串数组
	 * @param o
	 * @return
	 */
	public static String ListToString(Iterable<?> o){
		String str="";
		for(Object s : o){
			str+=", "+s;
		}
		return str=str.substring(1);
	}
	
	/**
	 * 替换‘<’ ‘>’ 特殊字符
	 * @param str
	 * @return
	 */
	public static String replace(String str){
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace("	", "&ensp;");//转义制表符
		//str = str.replace("\"", "\\\"");
		return str;
	}
}
