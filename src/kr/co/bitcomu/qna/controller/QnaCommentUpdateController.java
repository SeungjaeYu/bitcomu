package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Comment;

@WebServlet("/qna/qnaCommentUpdate.do")
public class QnaCommentUpdateController extends HttpServlet{
	private QnaDAO dao;

	public QnaCommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Comment cmt = new Comment();
		cmt.setCmtNo(Integer.parseInt(req.getParameter("cmtNo")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		
		dao.updateQnaComment(cmt);
		
		res.sendRedirect("/bitcomu/qna/qnaList.do?selBoardNo=" + req.getParameter("qnaNo"));
		
	//	res.sendRedirect(req.getContextPath() + "/qna/qnaDetail.do?qnaNo=" + req.getParameter("qnaNo"));
	}
	
	
}
