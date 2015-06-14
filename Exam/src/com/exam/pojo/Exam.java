package com.exam.pojo;

import java.util.Date;

public class Exam {

	private Long id;
	private Paper paper;
	private int singleScore; //单选得分
	private int moreScore;  //多选得分
	private int score;
	private Date examDate;  //考试试卷提交时间
	private Date beginDate;  //开始时间
	private Date endDate;  //结束时间
	private String stuIp;  //提交ip
	
	private Student student;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public int getSingleScore() {
		return singleScore;
	}

	public void setSingleScore(int singleScore) {
		this.singleScore = singleScore;
	}

	public int getMoreScore() {
		return moreScore;
	}

	public void setMoreScore(int moreScore) {
		this.moreScore = moreScore;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStuIp() {
		return stuIp;
	}

	public void setStuIp(String stuIp) {
		this.stuIp = stuIp;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
}
