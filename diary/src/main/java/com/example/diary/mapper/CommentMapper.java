package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;

@Mapper
public interface CommentMapper {
	//조회
	List<Comment> selectCommentList(Map<String, Object> commentMap);
	//입력
	int insertComment(Comment comment);
	//수정
	int updateComment(Comment comment);
	//조회
	Comment selectComment(Comment comment);
	//삭제(단일 코멘트)
	int deleteComment(Comment comment);
	//공지 별 총 코멘트 수
	int commentCnt(Notice notice);
}	
