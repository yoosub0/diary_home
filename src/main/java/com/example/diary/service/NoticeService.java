package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	public int updateNotice(Notice notice) {
	return noticeMapper.updateNotice(notice);
	}
	
	public int addComment(Comment comment) {
		return noticeMapper.addComment(comment);
	}
	
	public Comment selectComment(Comment comment) {
		return noticeMapper.selectComment(comment);
	}
	
	public int deleteNotice(Notice notice) {
		return noticeMapper.deleteNotice(notice);
	}
	
	public String addNotice() {

		return "addNotice";
	}
	
	public String addNotice(Notice notice) {
		// mapper 호출
		noticeMapper.insertNotice(notice);
		return "redirect:/noticeList";
	}
	
	public Notice noticeOne(Notice notice) {
		return noticeMapper.selectNoticeOne(notice);
	}
	
	public String noticeList(Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
	int rowPerPage = 5;
	int beginRow = (currentPage -1)*rowPerPage;
	int totalRow = noticeMapper.getTotalRow(rowPerPage);
	int lastPage = totalRow / rowPerPage;
	if(totalRow % rowPerPage != 0) {
		lastPage += 1;
	}
		// mapper
	Map<String, Object> param = new HashMap<>();
	param.put("beginRow", beginRow);
	param.put("rowPerPage", rowPerPage);
	List<Notice> noticeList = noticeMapper.selectNoticeList(param);
	model.addAttribute("noticeList", noticeList);
	model.addAttribute("currentPage", currentPage);
	
	List<Notice> list = noticeMapper.selectNoticeList(param);
	model.addAttribute("list", list);
	model.addAttribute("lastPage", lastPage);
	
		return "noticeList";
	}

}
