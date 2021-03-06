package kr.co.bitcomu.study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Study;

@WebServlet("/study/studyList.do")
public class StudyListController extends HttpServlet{
	private StudyDAO dao;
	
	public StudyListController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		req.setAttribute("searchType", req.getParameter("searchType"));
		req.setAttribute("searchWord",req.getParameter("searchWord"));
		
		req.getRequestDispatcher("/jsp/study/study_main.jsp").forward(req, res);
	}
	
	
	
}
