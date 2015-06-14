package com.exam.service;

import java.util.List;

import com.exam.dao.StudentDao;
import com.exam.pojo.Student;
import com.exam.util.PageBean;

public class StudentService {

	private StudentDao studentDao;
	
	public Student login(String name, String password){
		return studentDao.login(name,password);
	}
	
	public StudentDao getStudentDao() {
		return studentDao;
	}
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public List<Student> getStudentsByPage(String sName, PageBean pageBean) {
		
		return studentDao.getStudentsByPage(sName,pageBean);
	}

	public int getCount(String sName) {
		return studentDao.getCount(sName);
	}

	public void deleteStudent(Student student) {
		studentDao.delete(student);
	}

	public Student getStudentById(Long id) {
		return studentDao.getStudentById(id);
	}

	public void saveStudent(Student student) {
		studentDao.saveOrupdate(student);
	}
	
	
}
