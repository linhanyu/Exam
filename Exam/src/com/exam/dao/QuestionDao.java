package com.exam.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.exam.pojo.Exam;
import com.exam.pojo.Question;
import com.exam.util.PageBean;

public class QuestionDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<Question> getQuestionByPage(String sQuestion, PageBean pageBean) {
		Criteria criteria = (Criteria) getSession().createCriteria(Question.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (sQuestion != null && sQuestion != "") {
			criteria.add(Restrictions.like("subject", ("%" + sQuestion + "%")));
		}
		List<Question> list = criteria.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
		return list;
	}

	public int getCount(String sQuestion) {
		Criteria criteria = (Criteria) getSession().createCriteria(Question.class);
		// 根据id升序进行排序
		criteria.addOrder(Order.asc("id"));
		if (sQuestion != null && sQuestion != "") {
			criteria.add(Restrictions.like("subject", ("%" + sQuestion + "%")));
		}
		return criteria.list().size();
	}

	public Question getQuestionById(Long id) {
		return (Question) getSession().get(Question.class, id);
	}

	public void saveQuestion(Question question) {
		//getSession().saveOrUpdate(question);
		getSession().merge(question);

	}

	public void deleteQuestion(Question question) {
		getSession().delete(question);

	}


}
