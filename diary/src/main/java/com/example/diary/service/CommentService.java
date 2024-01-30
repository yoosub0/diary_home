package com.example.diary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	int rowPerPage = 3;
	//목록(페이징)
	public List<Comment> commentList(Map<String, Object> paramMap){
		int currentPage = 1;
		if(paramMap.get("currentPage") != null) {
			currentPage = (int)paramMap.get("currentPage");
		}
		log.debug("\u001B[43m"+currentPage);
		int noticeNo = ((Notice)paramMap.get("paramNotice")).getNoticeNo();
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("noticeNo", noticeNo);
		log.debug("\u001B[43m"+paramMap);
		
		return commentMapper.selectCommentList(paramMap);
	}
	//공지 별 총 코멘트 수 -> 마지막 페이지
	public int lastPage(Notice paramNotice) {
		int totalRow = commentMapper.commentCnt(paramNotice);
		int lastPage = (totalRow / rowPerPage);
		if((totalRow % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		log.debug("\u001B[43m"+lastPage);
		return lastPage;
	}
	//조회
	public Comment commentOne(Comment paramComment) {
		log.debug("\u001B[43m"+paramComment);
		return commentMapper.selectComment(paramComment);
	}
	//입력
	public int addComment(Comment paramComment) {
		if(paramComment.getIsSecret() == null) {
			paramComment.setIsSecret("false");
		}
		log.debug("\u001B[43m"+paramComment);
		return commentMapper.insertComment(paramComment);
	}
	//수정
	public int modifyComment(Comment paramComment) {
		log.debug("\u001B[43m"+paramComment);
		return commentMapper.updateComment(paramComment);
	}
	//삭제
	public int removeComment(Comment paramComment) {
		log.debug("\u001B[43m"+paramComment);
		return commentMapper.deleteComment(paramComment);
	}
}
