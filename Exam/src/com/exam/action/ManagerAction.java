package com.exam.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.exam.pojo.Manager;
import com.exam.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {

	private Manager manager=new Manager();
	private ManagerService managerService;
	public String login() {

		HttpSession session = ServletActionContext.getRequest().getSession();
		Manager m = managerService.login(manager.getName(), manager.getPassword());
		if (m == null) {

			ActionContext.getContext().put("error", "用户名或密码不正确");

			return ERROR;
		} else {
			session.setAttribute("currentUser", m);
			return SUCCESS;
		}

	}

	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}

	public Manager getModel() {
		return manager;
	}

	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

}
