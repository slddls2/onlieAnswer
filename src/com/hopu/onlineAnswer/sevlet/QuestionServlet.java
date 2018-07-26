package com.hopu.onlineAnswer.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.hopu.onlineAnswer.domain.Question;
import com.hopu.onlineAnswer.domain.UserInfo;
import com.hopu.onlineAnswer.service.QuestionService;
import com.hopu.onlineAnswer.service.impl.QuestionServiceImpl;

/**
 * 题目控制层
 */
@WebServlet("/Question")
public class QuestionServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3290655749060810827L;

	QuestionService service = new QuestionServiceImpl();
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String json = "";
		String type = request.getParameter("type");
		// TODO 输出type
		System.out.println("question-type="+type);
		if("answer".equals(type)){//出题
			//从session中拿到保存的科目对象
			Course course = (Course) request.getSession().getAttribute("course");
			if(course!=null){//排除空指针异常
				List<Question> list = service.random(course.getCid(),course.getNum());
				json = JSON.toJSONString(list);
				List<String> qids = new ArrayList<String>();
				for(Question q : list){
					qids.add(q.getQid().toString());
				}
				qids.add(System.currentTimeMillis()+"");//保存开始答题时间
				request.getSession().setAttribute("qids", qids);
			}else{
				json="course=null";
			}
		}else if("submit".equals(type)){//提交
			HttpSession session = request.getSession();
			//拿到session中的参数
			UserInfo user = (UserInfo) session.getAttribute("user");
			Course course = (Course) session.getAttribute("course");
			List<String> qids = (List<String>) session.getAttribute("qids");
			List<String> optionList = new ArrayList<String>();
			for(int i=0; i<qids.size()-1;i++){
				String[] options = request.getParameterValues(i+"");
				String option = "";
				for(String str:options){
					option += str+",";
				}
				option = option.substring(0, option.length()-1);
				// TODO 输出格式化后的用户选项
				System.out.println(i+"--"+option);
				optionList.add(option);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user", user);
			map.put("course", course);
			map.put("qids", qids);
			map.put("optionList", optionList);
			
			//调用业务层计算结果
			List<?> list = service.result(map);
			
			// TODO 输出最终结果对象
			System.out.println(list);
			//答题结果对象
			session.setAttribute("marks",list.get(0));
			//错题序号
			session.setAttribute("errorAnswerList",list.get(1));
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
