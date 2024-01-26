package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;
import com.example.diary.vo.Schedule;

@Mapper
public interface NoticeMapper {
	// 목록(페이징)
	List<Notice> selectNoticeList(Map<String, Object>paramMap);
	// 상세보기
	Notice selectNoticeOne(Notice notice);
	// 입력
	int insertNotice(Notice notice);
	// 업데이트
	int updateNotice(Notice notice);
	// 삭제
	int deleteNotice(Notice notice);
	
	int getTotalRow(int rowPerPage);
	
	int addComment(Comment comment);
	
	Comment selectComment(Comment comment);
	
	List<Notice> searchNotice (Map<String, Object> param);
	
	int getTotalRow2(Notice notice);
}
