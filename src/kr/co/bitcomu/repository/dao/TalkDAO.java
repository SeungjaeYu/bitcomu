/**
 * Data 의 처리 클래스
 * 
 * CRUD -> 
 * CREATE  : insert + 기능
 * READ    : select + 기능,  selectOne + 기능
 * UPDATE  : update + 기능
 * DELETE  : delete + 기능
 */
package kr.co.bitcomu.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.repository.vo.Talk;


public interface TalkDAO {
	List<Talk> selectTalk(Map<String, Object> map);
	Talk selectOneTalk(int no);
	void updateViewCnt(int no);
	void insertTalk(Talk talk);
	void updateTalk(Talk talk);
	int deleteTalk(int no);
	int selectTalkCount(Map<String, Object> listMap);
	
	/* 댓글 파트 시작 ========================================= */
	List<Comment> selectComment(Map<String, Object> map);
	void insertComment(Comment comment);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
	int selectTalkCmtCount(int no);
	
	
	// 추천
	void updateLikeCnt(int no);
	int selectTalkLikeCount(int no);
	void insertTalkLikeCount(Map<String, Object> map);
	
	
	//메인 페이지
	List<Talk> selectMainTalk();
}














