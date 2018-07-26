package com.hopu.onlineAnswer.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.service.UserInfoService;
import com.hopu.onlineAnswer.service.impl.UserInfoServiceImpl;

/**
 * 用户控制层
 */
@WebServlet("/UserInfo")
public class UserInfoServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2210234838943876436L;

	UserInfoService service = new UserInfoServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("type");
		
		String json = null;
		if("login".equals(type)){
			String uid = request.getParameter("uid");
			String uname = request.getParameter("uname");
			UserInfo user = service.login(uid,uname);
			Map<String, Serializable> map = new HashMap<String, Serializable>();
			if(user!=null){
				map.put("message", "登录成功");
				request.getSession().setAttribute("user", user);
			}else{
				map.put("message", "输入有误，请重新输入");
			}
			map.put("user", user);
			
			json = JSON.toJSONString(map);
		}
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
