package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import com.example.diary.vo.Comment;

public interface CommentMapper {
	//조회
	List<Comment> selectCommentList(Map<String, Object>map);
	
	//입력
	int insertComment (Comment comment);
	
	//수정
	int updateComment (Comment comment);
	
	//조회
	Comment selectComment(Comment comment);
	
	//삭제
	int deleteComment (Comment comment);
}
