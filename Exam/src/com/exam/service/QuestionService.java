package com.exam.service;

import java.util.List;

import com.exam.dao.QuestionDao;
import com.exam.pojo.Exam;
import com.exam.pojo.Question;
import com.exam.util.PageBean;

public class QuestionService {

	private QuestionDao questionDao;
	public List<Question> getQuestionsByPage(String sQuestion, PageBean pageBean) {
		return questionDao.getQuestionByPage(sQuestion,pageBean);
	}

	public int getCount(String sQuestion) {
		return questionDao.getCount(sQuestion);
	}

	public Question getQuestionById(Long id) {
		return questionDao.getQuestionById(id);
	}

	public void saveQuestion(Question question) {
		questionDao.saveQuestion(question);
		
	}

	public void deleteQuestion(Question question) {
		questionDao.deleteQuestion(question);
	}

	public QuestionDao getQuestionDao() {
		return questionDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	
}
