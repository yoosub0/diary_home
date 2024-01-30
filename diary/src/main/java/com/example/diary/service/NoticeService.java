package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private CommentMapper commentMapper;
	int rowPerPage = 3;
	//목록(페이징)
	public List<Notice> noticeList(@RequestParam(defaultValue = "1") int currentPage){
		log.debug("\u001B[43m"+currentPage);
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		
		return noticeMapper.selectNoticeList(paramMap);
	}
	//총 공지 수 -> 마지막 페이지
	public int lastPage() {
		int totalRow = noticeMapper.noticeCnt();
		int lastPage = (totalRow / rowPerPage);
		if((totalRow % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		log.debug("\u001B[43m"+lastPage);
		return lastPage;
	}
	//상세보기
	public Notice noticeOne(Notice paramNotice) {
		log.debug("\u001B[43m"+paramNotice);
		return noticeMapper.selectNoticeOne(paramNotice);
	}
	//입력
	public int addNotice(Notice paramNotice) {
		log.debug("\u001B[43m"+paramNotice);
		return noticeMapper.insertNotice(paramNotice);
	}
	//삭제
	public int removeNotice(Notice paramNotice) {
		log.debug("\u001B[43m"+paramNotice);
		if(commentMapper.commentCnt(paramNotice) != 0) {
			noticeMapper.deleteCommentByNotice(paramNotice);
		}
		return noticeMapper.deleteNotice(paramNotice);
	}
	//수정
	public int modifyNotice(Notice paramNotice) {
		log.debug("\u001B[43m"+paramNotice);
		return noticeMapper.updateNotice(paramNotice);
	}
}
