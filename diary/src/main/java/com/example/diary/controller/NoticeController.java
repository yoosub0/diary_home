package com.example.diary.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private CommentService commentService;
	//목록(페이징)
	@GetMapping("/noticeList")
	public String noticeList(Model model,@RequestParam(defaultValue = "1") int currentPage,HttpSession session ) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// 세션에서 멤버 정보 출력
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// noticeService 호출
		log.debug("\u001B[42m"+currentPage);
		List<Notice> list = noticeService.noticeList(currentPage);
		log.debug("\u001B[42m"+list.size());
		int lastPage = noticeService.lastPage();
		log.debug("\u001B[42m"+lastPage);
		
		// view로 보낼 값 넣기
		model.addAttribute("loginMember",loginMember);
		model.addAttribute("list",list);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		// 리턴
		return "noticeList";
	}
	
	//추가
	@GetMapping("/addNotice")
	public String addNotice(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// 리턴
		return "addNotice";
	}
	@PostMapping("/addNotice")
	public String addNotice(HttpSession session,Notice paramNotice) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		//세션에서 id출력
		String loginId = ((Member)session.getAttribute("loginMember")).getMemberId();
		log.debug("\u001B[42m"+loginId);
		
		// noticeService 호출
		paramNotice.setMemberId(loginId);
		log.debug("\u001B[42m"+paramNotice);
		int row = noticeService.addNotice(paramNotice);
		if(row == 0) {
			log.debug("\u001B[42m"+row +" <-추가 실패");
			return "redirect:/addNotice";
		}else {
			log.debug("\u001B[42m"+row +"<-추가 성공");
		}
		
		// 리턴
		return "redirect:/noticeList";
	}
	
	//공지 조회, 코멘트 리스트
	@GetMapping("/noticeOne")
	public String noticeOne(HttpSession session,Notice paramNotice, Model model,@RequestParam(defaultValue = "1") int currentPage) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// 세션에서 로그인 정보 출력
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// noticeService 호출
		log.debug("\u001B[42m"+paramNotice);
		Notice resultNotice = noticeService.noticeOne(paramNotice);
		log.debug("\u001B[42m"+resultNotice);
		
		// commentService로 보낼 commentMap에 값을 put
		Map<String, Object> commentMap = new HashMap<>();
		commentMap.put("currentPage", currentPage);
		commentMap.put("paramNotice", paramNotice);
		
		// commentService 호출
		log.debug("\u001B[42m"+paramNotice);
		List<Comment> list = commentService.commentList(commentMap);
		log.debug("\u001B[42m"+list.size());
		int lastPage = commentService.lastPage(paramNotice);
		log.debug("\u001B[42m"+lastPage);
		
		// view로 보낼 값 넣기
		model.addAttribute("loginMember",loginMember);
		model.addAttribute("resultNotice",resultNotice);
		model.addAttribute("list",list);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		// 리턴
		return "noticeOne";
	}
	
	//삭제
	@GetMapping("/removeNotice")
	public String removeNotice(HttpSession session, Model model,Notice paramNotice ) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// view로 보낼 값 넣기
		log.debug("\u001B[42m"+paramNotice);
		model.addAttribute("paramNotice",paramNotice);
		
		// 리턴
		return "removeNotice";
	}
	@PostMapping("/removeNotice")
	public String removeNotice(HttpSession session,Notice paramNotice) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// noticeService 호출
		log.debug("\u001B[42m"+paramNotice);
		int row = noticeService.removeNotice(paramNotice);
		if(row == 0) {
			log.debug("\u001B[42m"+row + " <-- 삭제 실패");
		}else {
			log.debug("\u001B[42m"+row + " <-- 삭제 성공");
		}
		
		// 리턴
		return "redirect:/noticeList";
	}
	
	//수정
	@GetMapping("/modifyNotice")
	public String modifyNotice(HttpSession session,Notice paramNotice,Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// noticeService 호출
		log.debug("\u001B[42m"+paramNotice);
		Notice originNotice = noticeService.noticeOne(paramNotice);
		
		// view로 보낼 값 넣기
		model.addAttribute("originNotice", originNotice);
		
		// 리턴
		return "modifyNotice";
	}
	@PostMapping("/modifyNotice")
	public String modifyNotice(HttpSession session,Notice paramNotice) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// noticeService 호출
		log.debug("\u001B[42m"+paramNotice);
		int row = noticeService.modifyNotice(paramNotice);
		if(row == 0) {
			log.debug("\u001B[42m"+row + " <-- 수정 실패");
		}else {
			log.debug("\u001B[42m"+row + " <-- 수정 성공");
		}
		
		// 리턴
		return "redirect:/noticeList";
	}
}
