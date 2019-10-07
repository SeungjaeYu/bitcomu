package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Team;
import kr.co.bitcomu.repository.vo.User;

public interface TeamDAO {
	List<User> userBirthDday(int no);
	List<Team> selectTeamBoard();
	Team selectOneTeamBoard(int no);
	Team selectUserId(int no);
	void insertTeamBoard(Team team);
	void updateTeamBoard(Team team);
	int deleteTeamBoard(int no);
	
	/* 댓글 파트 시작 ========================================= */
	List<Comment> selectTeamComment(int teamBoardCmtNo);
	void insertTeamComment(Comment teamComment);
	void deleteTeamComment(int commentNo);
	void updateTeamComment(Comment teamComment);
}
