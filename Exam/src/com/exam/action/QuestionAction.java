package com.exam.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.exam.pojo.Paper;
import com.exam.pojo.Question;
import com.exam.service.PaperService;
import com.exam.service.QuestionService;
import com.exam.util.PageBean;
import com.exam.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QuestionAction extends ActionSupport implements ModelDriven<Question> {

	private QuestionService questionService;
	private PaperService paperService;
	private Question question = new Question();
	private String mainPage;
	private String title;
	private List<Paper> paperList = new ArrayList<Paper>();
	// 查询第几页的试题
	private String page;
	// 根据试题名称模糊查询
	private String sQuestion;
	// 每页的试题
	private List<Question> questionList;
	// 存储分页的代码字符串
	private String pageCode;

	public Question getModel() {
		return question;
	}

	// 显示所有试题
	public String list() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (page == null || "".equals(page)) {
			page = "1";
		}

		// 判断查询条件,每次查询都要带着条件
		if (sQuestion == null) {
			Object obj = session.getAttribute("sQuestion");
			if (obj == null) {
				sQuestion = "";
			} else {
				sQuestion = (String) obj;
			}
		} else {
			session.setAttribute("sQuestion", sQuestion);
		}
		// 每页10条数据
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);

		questionList = questionService.getQuestionsByPage(sQuestion, pageBean);
		int totalNum = questionService.getCount(sQuestion);

		pageCode = PageUtil.getPagination(ServletActionContext.getRequest().getContextPath() + "/question_list",
				totalNum, Integer.parseInt(page), 10);
		mainPage = "jsp/question/list.jsp";
		return SUCCESS;
	}

	public String preSave() {

		paperList = paperService.getAllPapers();
		String id = String.valueOf(question.getId());
		if (id == null || "null".equals(id)) {
			title = "添加试题信息";
		} else {
			question = questionService.getQuestionById(question.getId());
			title = "编辑试题信息";
		}
		mainPage = "jsp/question/save.jsp";
		return SUCCESS;
	}

	public String save() {

		//前台传递question.paper.id  ,会根据对象的属性自动注入到question中
		//question中paper对象有变化,调用merge
	
		questionService.saveQuestion(question);
		return list();
	}

	// ajax删除
	public String delete() throws IOException {
		question = questionService.getQuestionById(question.getId());
		questionService.deleteQuestion(question);
		JSONObject resultJson = new JSONObject();
		resultJson.put("success", true);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(resultJson.toString());
		out.flush();
		out.close();
		return null;
	}

	public String getQuestionById() {
		question = questionService.getQuestionById(question.getId());
		mainPage = "jsp/question/show.jsp";
		return SUCCESS;
	}

	public QuestionService getQuestionService() {
		return questionService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getSQuestion() {
		return sQuestion;
	}

	public void setSQuestion(String sQuestion) {
		this.sQuestion = sQuestion;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public PaperService getPaperService() {
		return paperService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	
}
