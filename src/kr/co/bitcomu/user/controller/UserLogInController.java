package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.encrypt.SHA256Password;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/user/userLogin.do")
public class UserLogInController extends HttpServlet {
	private UserDAO dao;
	
	public UserLogInController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = new User();
		user.setUserId(req.getParameter("id"));
		user.setUserPass(SHA256Password.LockPassword(req.getParameter("password")));
		User userStatus = dao.selectOneUser(user);
		
		session.setAttribute("user", userStatus);
		
		PrintWriter out = res.getWriter();
		
		if (userStatus == null) {
			out.println("loginFail");
		} else {
			out.println("loginSuccess");
		}
		
		
		out.close();
//		res.sendRedirect(req.getContextPath() + "/main.do");
	}
}
