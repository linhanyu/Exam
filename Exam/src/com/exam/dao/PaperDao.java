package com.exam.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.exam.pojo.Paper;

public class PaperDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<Paper> getAllPapers() {
		return getSession().createQuery("from Paper").list();
	}

	public Paper getPaperById(Long id) {
		return (Paper) getSession().get(Paper.class,id);
	}

	public void deletePaper(Paper paper) {
		getSession().delete(paper);
	}

	public void savePaper(Paper paper) {
		getSession().saveOrUpdate(paper);
	}

}
