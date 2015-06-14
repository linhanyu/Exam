package com.exam.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Paper {

	private Long id;
	private String paperName;
	private Date joinDate=new Date();
	private Set<Question> questions=new HashSet<Question>();
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
	
}
