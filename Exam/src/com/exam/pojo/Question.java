package com.exam.pojo;

import java.util.Date;

public class Question {

	private Long id;
	private String subject;  //试题名称
	private String type;  //类型  1单选    2多选
	private Date joinTime;  //试题添加时间
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String answer;  //正确答案
	private String studentAnswer; //学生答案
	
	private Paper paper;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getStudentAnswer() {
		return studentAnswer;
	}

	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	
}
