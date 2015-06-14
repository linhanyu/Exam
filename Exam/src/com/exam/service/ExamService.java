package com.exam.service;

import java.util.List;

import com.exam.dao.ExamDao;
import com.exam.pojo.Exam;
import com.exam.util.PageBean;

public class ExamService {

	private ExamDao examDao;

	public void saveExam(Exam exam) {
		examDao.saveExam(exam);
	}

	public ExamDao getExamDao() {
		return examDao;
	}

	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}

	public List<Exam> getAllExams(String studentId) {

		return examDao.getAllExams(studentId);
	}

	public List<Exam> getExamsByPage(String name, String paperName, PageBean pageBean) {

		return examDao.getExamsByPage(name, paperName, pageBean);
	}

	public int getCount(String name, String paperName) {

		return examDao.getCount(name, paperName);
	}

}
