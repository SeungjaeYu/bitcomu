package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;


@WebServlet("/team/teamBoardDetail.do")
public class DetailTeamBoardController extends HttpServlet {
private TeamDAO dao;
	
	public DetailTeamBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("teamBoardNo"));
		/*
		Board board = dao.selectOneBoard(no); 
		req.setAttribute("board", board);
		*/
		
		Team t =  dao.selectOneTeamBoard(no);
		System.out.println(t.getUserId());
		req.setAttribute("teamBoard", t);
		// 댓글 목록 공유
//		List<Comment> commentList = dao.selectComment(no);
//		req.setAttribute("commentList", commentList);
//		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/teamboard/team_board_detail.jsp");
		rd.forward(req, res);
	}
}
