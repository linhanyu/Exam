package com.exam.service;

import java.util.List;

import com.exam.dao.PaperDao;
import com.exam.pojo.Paper;

public class PaperService {

	private PaperDao paperDao;

	public List<Paper> getAllPapers() {
		return paperDao.getAllPapers();
	}

	public PaperDao getPaperDao() {
		return paperDao;
	}

	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}

	public Paper getPaperById(Long id) {
		
		return paperDao.getPaperById(id);
	}

	public void deletePaper(Paper paper) {
		paperDao.deletePaper(paper);
	}

	public void savePaper(Paper paper) {
		paperDao.savePaper(paper);
	}

}
