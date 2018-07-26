package com.hopu.onlineAnswer.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.hopu.onlineAnswer.domain.Course;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.service.CourseService;
import com.hopu.onlineAnswer.service.impl.CourseServiceImpl;

/**
 * 科目控制层
 */
@WebServlet("/Course")
public class CourseSevlet extends HttpServlet {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -6577906795123262577L;

	CourseService service = new CourseServiceImpl(); 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		// TODO 输出调试--科目url类型参数
		System.out.println("url参数type="+type);
		String json = "";
		/*
		 * 查询全部科目，返回科目和用户信息json
		 * */
		if("main".equals(type)){
			List<Course> list = service.findAll();
			UserInfo user = (UserInfo) request.getSession().getAttribute("user");
			if(user!=null){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("user", user);
				map.put("course", list);
				json = JSON.toJSONString(map);
			}
		}
		if("save".equals(type)){
			/*
			 * 保存用户选择到session中
			 * */
			HttpSession session = request.getSession();
			String[] cids = request.getParameterValues("cid");
			String cid="";
			cid = arrayToString(cids, cid);
			String num = request.getParameter("num");
			Course selectCourse = new Course();
			selectCourse.setCid(cid);
			selectCourse.setNum(num);
			selectCourse.setCname(service.findCnamesByIds(cid));
			session.setAttribute("course", selectCourse);
			// TODO 输出调试--科目选择是否保存到session
			System.out.println("科目选择："+selectCourse);
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();
	}

	private String arrayToString(String[] cids, String cid) {
		for(int i=0; i<cids.length; i++){
			cid += cids[i];
			if(i+1<cids.length){
				cid += ",";
			}
		}
		return cid;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
