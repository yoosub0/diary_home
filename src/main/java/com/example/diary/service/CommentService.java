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
	
	public List<Comment> commentList(Map<String, Object> param){
		int noticeNo = ((Notice)param.get("paramNotice")).getNoticeNo();
		param.put("noticeNo", noticeNo);
		
		return commentMapper.selectCommentList(param);
	}
	
	public Comment commentOne(Comment comment) {
		return commentMapper.selectComment(comment);
	}
	
	public int insertComment(Comment comment) {
		if(comment.getIsSecret()==null) {
			comment.setIsSecret("false");
		}
		return commentMapper.insertComment(comment);
	}
	
	public int updateComment(Comment comment) {
		return commentMapper.updateComment(comment);
	}
	
	public int deleteComment(Comment comment) {
		return commentMapper.deleteComment(comment);
	}
	
	
	
}
