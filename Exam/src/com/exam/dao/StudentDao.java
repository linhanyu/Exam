package com.exam.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.exam.pojo.Student;
import com.exam.util.PageBean;

public class StudentDao {

	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return  sessionFactory.getCurrentSession();
	}
	
	public Student login(String name, String password) {
		Student s = (Student) getSession().createQuery("from Student s where s.name=? and s.password=?")
				.setString(0, name).setString(1, password).uniqueResult();

		return s;
	}
	public List<Student> getStudentsByPage(String sName, PageBean pageBean) {
		Criteria criteria = (Criteria) getSession().createCriteria(Student.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (sName != null && sName != "") {
			criteria.add(Restrictions.like("name", ("%" + sName + "%")));
		}
		List<Student> list = criteria.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
		return list;
	}
	
	public int getCount(String sName) {
		Criteria criteria = (Criteria) getSession().createCriteria(Student.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (sName != null && sName != "") {
			criteria.add(Restrictions.like("name", ("%" + sName + "%")));
		}
		return criteria.list().size();
	}
	public void delete(Student student) {
		getSession().delete(student);
	}
	public Student getStudentById(Long id) {
		return (Student) getSession().get(Student.class, id);
	}
	public void saveOrupdate(Student student) {

		getSession().saveOrUpdate(student);
	}
	
}
