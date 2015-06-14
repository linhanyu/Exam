package com.exam.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.exam.pojo.Manager;

public class ManagerDao {

	private SessionFactory sessionFactory;
	
	public Manager login(String name,String password){
		return (Manager) getSession().createQuery("from Manager m where m.name=? and m.password=?")
				.setString(0,name).setString(1,password)
				.uniqueResult();
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return  sessionFactory.getCurrentSession();
	}
	
}
