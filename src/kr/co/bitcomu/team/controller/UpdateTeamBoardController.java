package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/team/teamBoardUpdate.do")
public class UpdateTeamBoardController extends HttpServlet {
	
	private TeamDAO dao;
	
	public UpdateTeamBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/json; charset=utf-8");		

		HttpSession session = req.getSession();
//		User user = (User)session.getAttribute("user");
		
		Team team = new Team();
//		team.setUserNo(user.getUserNo());
		team.setTeamBoardNo(Integer.parseInt(req.getParameter("teamBoardNo")));
		team.setTeamNo(Integer.parseInt(req.getParameter("teamNo")));
		team.setProjectNo(Integer.parseInt(req.getParameter("projectNo")));
		team.setTeamBoardTitle(req.getParameter("teamBoardTitle"));
		team.setTeamBoardContent(req.getParameter("teamBoardContent").replace("\r\n", "<br>"));
		dao.updateTeamBoard(team);
		
		
		int teamBoardNo = Integer.parseInt(req.getParameter("teamBoardNo"));
		
		res.sendRedirect("teamBoardDetail.do?teamBoardNo=" + teamBoardNo);
	}
}










