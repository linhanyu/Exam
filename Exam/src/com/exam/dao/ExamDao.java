package com.exam.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.exam.pojo.Exam;
import com.exam.util.PageBean;

public class ExamDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveExam(Exam exam) {
		getSession().save(exam);
	}

	public List<Exam> getAllExams(String studentId) {
		return getSession().createQuery("from Exam e where e.student.id=?").setString(0, studentId).list();
	}

	public List<Exam> getExamsByPage(String name, String paperName, PageBean pageBean) {
		Criteria criteria = (Criteria) getSession().createCriteria(Exam.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (name != null && name != "") {
			criteria.createAlias("student","s" );
			criteria.add(Restrictions.like("s.name", ("%" + name + "%")));
		}
		if (paperName != null && paperName != "") {
			criteria.createAlias("paper","p");
			criteria.add(Restrictions.like("p.paperName", ("%" + paperName + "%")));
		}
		List<Exam> list = criteria.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
		return list;
	}

	public int getCount(String name, String paperName) {
		Criteria criteria = (Criteria) getSession().createCriteria(Exam.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (name != null && name != "") {
			criteria.createAlias("student","s" );
			criteria.add(Restrictions.like("s.name", ("%" + name + "%")));
		}
		if (paperName != null && paperName != "") {
			criteria.createAlias("paper","p");
			criteria.add(Restrictions.like("p.paperName", ("%" + paperName + "%")));
		}
		return criteria.list().size();
	}

}
