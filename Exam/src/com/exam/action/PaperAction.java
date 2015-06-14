package com.exam.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.exam.pojo.Paper;
import com.exam.pojo.Question;
import com.exam.service.PaperService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PaperAction extends ActionSupport implements ModelDriven<Paper>{

	private PaperService paperService;
	private String mainPage;
	private String title;
	private Paper paper=new Paper();
	// 试卷列表
	private List<Paper> paperList = new ArrayList<Paper>();
	private Set<Question> squestionSet=new HashSet<Question>();
	private Set<Question> mquestionSet=new HashSet<Question>();

	//后台：显示所有试卷
	public String paperList() {
		paperList = paperService.getAllPapers();
		mainPage = "jsp/paper/list.jsp";
		return SUCCESS;
	}

	//删除试卷
	public String deletePaper() throws IOException{
		paper=paperService.getPaperById(paper.getId());
		JSONObject resultJson=new JSONObject();
		paperService.deletePaper(paper);
		resultJson.put("success",true);
		PrintWriter out=ServletActionContext.getResponse().getWriter();
		out.write(resultJson.toString());
		out.flush();
		out.close();
		return null;
	}
	
	//准备   编辑或添加试卷
	public String preSave(){
		String id=String.valueOf(paper.getId());
		
		if(id==null||"null".equals(id)){
			
			title="添加试卷";
		} else{
			paper=paperService.getPaperById(Long.parseLong(id));
			title="编辑试卷";
		}
		mainPage="jsp/paper/save.jsp";
		return SUCCESS;
	}
	
	//添加或编辑
	public String savePaper(){
		paperService.savePaper(paper);
		return paperList();
	}
	
	//前台：在线考试选择
	public String list()throws Exception{
		paperList=paperService.getAllPapers();
		mainPage="jsp/exam/selectPaper.jsp";
		return SUCCESS;
	}
	
	//前台:展示考试试卷内容
	public String getDetailPaper()throws Exception{
		
		paper=paperService.getPaperById(paper.getId());
		Set<Question> questionList=paper.getQuestions();
		List<Question> squestionList=new ArrayList<Question>();
		List<Question> mquestionList=new ArrayList<Question>();
		Iterator<Question> it=questionList.iterator();
		while(it.hasNext()){
			Question q=it.next();
			if("1".equals(q.getType())){
				squestionList.add(q);
			}else{
				mquestionList.add(q);
			}
		}
		
		//单选题和多选题的个数  10个单选,5个多选
		squestionSet=this.getRandowQuestion(squestionList, 10);
		mquestionSet=this.getRandowQuestion(mquestionList, 5);
		mainPage="jsp/exam/paper.jsp";
		return SUCCESS;
	}
	
	//随机取出n个试题    试题个数一定要够,不然不行
	private Set<Question> getRandowQuestion(List<Question> questionList,int num){
		Set<Question> resultSet=new HashSet<Question>();
		Random random=new Random();
		if(num>0){
			for(int i=1;i<=num;i++){
				int n=random.nextInt(questionList.size());
				Question q=questionList.get(n);
				if(resultSet.contains(q)){
					i--;
				}else{
					resultSet.add(q);
				}
			}
		}
		return resultSet;
	}

	public PaperService getPaperService() {
		return paperService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public Paper getModel() {
		return paper;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public Set<Question> getSquestionSet() {
		return squestionSet;
	}

	public void setSquestionSet(Set<Question> squestionSet) {
		this.squestionSet = squestionSet;
	}

	public Set<Question> getMquestionSet() {
		return mquestionSet;
	}

	public void setMquestionSet(Set<Question> mquestionSet) {
		this.mquestionSet = mquestionSet;
	}

}
