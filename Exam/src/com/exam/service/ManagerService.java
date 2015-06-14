package com.exam.service;

import com.exam.dao.ManagerDao;
import com.exam.pojo.Manager;

public class ManagerService {

	private ManagerDao managerDao;

	public Manager login(String name, String password){
		return managerDao.login(name, password);
	}
	
	public ManagerDao getManagerDao() {
		return managerDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
	
}
