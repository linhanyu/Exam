package com.exam.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.exam.pojo.Student;
import com.exam.service.StudentService;
import com.exam.util.PageBean;
import com.exam.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{
	
	private StudentService studentService;
	private Student student=new Student();
	//通过action动态改变主页面
	private String mainPage;
	//存储分页的代码字符串
	private String pageCode;
	//查询第几页的考生
	private String page;
	//根据登录名查询考生
	private String sName;
	//每页的考生
	private List<Student> studentList;
	//页面标题
	private String title;

	public String login(){
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		Student s=studentService.login(student.getName(),student.getPassword());
		if(s==null){
			
			ActionContext.getContext().put("error", "用户名或密码不正确");

			return ERROR;
		}else{
			session.setAttribute("currentUser", s);
			return SUCCESS;
		}
		
	}
	
	public String logout()throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}
	
	//考生信息管理
	public String list()throws Exception{
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(page==null||"".equals(page)){
			page="1";
		}
		
		//判断查询条件,每次查询都要带着条件
		if(sName==null){
			Object obj=session.getAttribute("sName");
			if(obj==null){
				sName="";
			}else{
				sName=(String) obj;
			}
		}else{
			session.setAttribute("sName",sName);
		}
		//每页5条数据
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		
		studentList=studentService.getStudentsByPage(sName,pageBean);
		int totalNum=studentService.getCount(sName);
		
		pageCode=PageUtil.getPagination(ServletActionContext.getRequest().getContextPath()+"/student_list", totalNum,Integer.parseInt(page), 5);
		mainPage="jsp/student/list.jsp";
		return SUCCESS;
	}
	
	public String preSave(){
		
		//valueOf  if the argument is null, then a string equal to "null"; 
		//otherwise, the value of obj.toString() is returned.

		String id=String.valueOf(student.getId());
		if(id==null||"null".equals(id)){
			title="添加考生信息";
		} else {
			student=studentService.getStudentById(student.getId());
			title="编辑考生信息";			
		}
		mainPage="jsp/student/save.jsp";
		return SUCCESS;
	}
	
	public String saveStudent()throws Exception{
		String id=String.valueOf(student.getId());
		
		//根据id来判断执行添加或编辑
		studentService.saveStudent(student);
		return list();
	}
	//ajax删除考生
	public String deleteStudent()throws Exception{
		student=studentService.getStudentById(student.getId());
		studentService.deleteStudent(student);
		JSONObject resultJson=new JSONObject();
		resultJson.put("success", true);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson.toString());
		out.flush();
		out.close();
		return null;
	}
	
	public String preUpdatePassword()throws Exception{
		mainPage="jsp/student/updatePassword.jsp";
		return SUCCESS;
	}
	
	public String updatePassword(){
		studentService.saveStudent(student);
		mainPage="jsp/student/updateSuccess.jsp";
		return SUCCESS;
	}
	
	public Student getModel() {
		return student;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getSName() {
		return sName;
	}

	//手动改成setSName,默认生成的setsName,尽量不以s开头
	public void setSName(String sName) {
		this.sName = sName;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
}
