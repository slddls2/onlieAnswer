package com.hopu.onlineAnswer.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.hopu.onlineAnswer.domain.ErrorAnswer;
import com.hopu.onlineAnswer.domain.Marks;
import com.hopu.onlineAnswer.domain.MarksFind;
import com.hopu.onlineAnswer.service.MarksService;
import com.hopu.onlineAnswer.service.impl.MarksServiceImpl;

/**
 * 成绩控制层
 */
@WebServlet("/Marks")
public class MarksServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2865136218878352530L;
	MarksService service = new MarksServiceImpl();

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Marks marks = (Marks) session.getAttribute("marks");
		List<ErrorAnswer> errorAnswerList = 
				(List<ErrorAnswer>) session.getAttribute("errorAnswerList");
		String type = request.getParameter("type");
		String json = "";
		if("stuFind".equals(type)){
			String option_false = "";
			for(ErrorAnswer e : errorAnswerList){
				option_false+=","+e.getErrorid();
			}
			option_false=option_false.substring(1);
			marks.setMid(service.findMidByMarks(marks));
			marks.setFalse_id(option_false);
			json = JSON.toJSONString(marks);
		}else if("lookError".equals(type)){
			errorAnswerList=service.lookError(errorAnswerList);
			json = JSON.toJSONString(errorAnswerList);
		}else if("teaFind".equals(type)){
			String find1 = request.getParameter("find1");
			String find2 = request.getParameter("find2");
			String start_time1 = request.getParameter("start_time1");
			String start_time2 = request.getParameter("start_time2");
			String findName1=null,findName2=null;
			if(find1!=null&&!find1.equals("")){
				findName1 = request.getParameter(find1);
			}
			if(find2!=null&&!find2.equals("")){
				findName2 = request.getParameter(find2);
			}
			MarksFind find = new MarksFind(find1, find2, findName1, 
						findName2, start_time1, start_time2);
			List<Marks> list = service.teaFind(find);
			json = JSON.toJSONString(list);
		}
		// TODO 检查json
		System.out.println("传给前台的json");
		System.out.println(json);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
