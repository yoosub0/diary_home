package com.example.diary.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Notice;

@Mapper
public interface NoticeMapper {
		//목록(페이징)
		List<Notice> selectNoticeList(Map<String, Object> paramMap);
		//상세보기
		Notice selectNoticeOne(Notice notice);
		//입력
		int insertNotice(Notice notice);
		//삭제
		int deleteNotice(Notice notice);
		//삭제(동일 공지 내 모든 코멘트)
		int deleteCommentByNotice(Notice notice);
		//수정
		int updateNotice(Notice notice);
		//총 공지 수
		int noticeCnt();
}
