package com.exam.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.exam.pojo.Exam;
import com.exam.pojo.Question;
import com.exam.pojo.Student;
import com.exam.service.ExamService;
import com.exam.service.QuestionService;
import com.exam.util.PageBean;
import com.exam.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.StringUtil;

public class ExamAction extends ActionSupport{

	private QuestionService questionService;
	private ExamService examService;
	private Exam exam;
	private String mainPage;
	private List<Exam> examList;
	private String page;
	private String pageCode;
	
	//前台考试提交
	public String add()throws Exception{
		
		@SuppressWarnings("unchecked")
		//获得所有页面传递的name value参数     value为空时,不进行注入
		Map<String, String[]> keyMap=ServletActionContext.getRequest().getParameterMap();
		Iterator<Entry<String,String[]>> it2=keyMap.entrySet().iterator();
		int totalScore=0;
		int singleScore=0;
		int moreScore=0;
		while(it2.hasNext()){
			Entry<String,String[]> entry=it2.next();
			String keyStr=entry.getKey();
			String values[]=entry.getValue();
			String key;
			String value="";
			if(keyStr.equals("exam.student.id")||keyStr.equals("exam.paper.id")){
				continue;
			}
			if(keyStr.split("-")[1].equals("r")){   //单选题答案
				key=keyStr.split("-")[2];
				value=values[0];
				singleScore+=this.calScore(key, value, "1");
			}else{  //多选题答案
				key=keyStr.split("-")[2];
				for(String s:values){
					value+=s+"#";  
				}
				value=value.substring(0, value.length()-1);
				moreScore+=this.calScore(key, value, "2");
			}
		}
		totalScore=singleScore+moreScore;
		String stuIp=ServletActionContext.getRequest().getRemoteAddr();
		exam.setSingleScore(singleScore);
		exam.setMoreScore(moreScore);
		exam.setScore(totalScore);
		//提交时间
		exam.setExamDate(new Date());
		//提交ip
		exam.setStuIp(stuIp);
		
		examService.saveExam(exam);
		mainPage="jsp/exam/examResult.jsp";
		return SUCCESS;
	}
	
	//计算分数  一个单选5分  多选10分
	private int calScore(String questionId,String userAnswer,String type)throws Exception{
		Question question=questionService.getQuestionById(Long.parseLong(questionId));
		if(userAnswer.equals(question.getAnswer())){
			if("1".equals(type)){
				return 5;
			}else{
				return 10;
			}
		}else{
			return 0;
		}
	}

	//前台:成绩查询
	public String getExams() {
		Student s=(Student) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		examList=examService.getAllExams(s.getId().toString());
		mainPage="jsp/exam/myExam.jsp";
		return SUCCESS;
	}
	
	//后台:考生成绩查询
	public String list() {
		HttpSession session=ServletActionContext.getRequest().getSession();
		if (page == null || "".equals(page)) {
			page = "1";
		}

		String name="";
		String paperName="";
		// 判断查询条件,每次查询都要带着条件
		if(exam!=null){
			
			if (exam.getStudent().getName() == null) {
				Object obj = session.getAttribute("name");
				if (obj == null) {
					name = "";
				} else {
					name = (String) obj;
				}
			} else {
				session.setAttribute("name", exam.getStudent().getName());
				name=exam.getStudent().getName();
			}
			if (exam.getPaper().getPaperName() == null) {
				Object obj = session.getAttribute("paperName");
				if (obj == null) {
					paperName = "";
				} else {
					paperName = (String) obj;
				}
			} else {
				session.setAttribute("paperName", exam.getPaper().getPaperName());
				paperName=exam.getPaper().getPaperName();
			}
		}
		
		// 每页10条数据
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);

		examList = examService.getExamsByPage(name, paperName,pageBean);
		int totalNum = examService.getCount(name, paperName);

		pageCode = PageUtil.getPagination(ServletActionContext.getRequest().getContextPath() + "/question_list",
				totalNum, Integer.parseInt(page), 10);
		
		mainPage="jsp/exam/examList.jsp";
		return SUCCESS;
	}
	
	public QuestionService getQuestionService() {
		return questionService;
	}


	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}


	public ExamService getExamService() {
		return examService;
	}


	public void setExamService(ExamService examService) {
		this.examService = examService;
	}


	public Exam getExam() {
		return exam;
	}


	public void setExam(Exam exam) {
		this.exam = exam;
	}


	public String getMainPage() {
		return mainPage;
	}


	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public List<Exam> getExamList() {
		return examList;
	}

	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

}
