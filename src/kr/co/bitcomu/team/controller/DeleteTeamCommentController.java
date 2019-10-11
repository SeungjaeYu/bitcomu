package kr.co.bitcomu.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Comment;

@WebServlet("/team/teamCommentDelete.do")
public class DeleteTeamCommentController extends HttpServlet {
	private TeamDAO dao;

	public DeleteTeamCommentController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int cmtNo = Integer.parseInt(req.getParameter("cmtNo"));
		dao.deleteTeamComment(Integer.parseInt(req.getParameter("cmtNo")));
		res.sendRedirect(req.getContextPath() + "/team/teamBoardDetail.do?teamBoardNo=" + req.getParameter("teamBoardNo"));
		
		// 댓글 목록 공유
		List<Comment> commentList = dao.selectTeamComment(cmtNo);

		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
	
	
	
	
	
}
