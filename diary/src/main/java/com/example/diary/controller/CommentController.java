package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {
	@Autowired 
	private CommentService commentService;
	
	//입력
	@PostMapping("/addComment")
	public String addComment(Comment paramComment,Model model) {
		log.debug("\u001B[42m"+paramComment);
		
		// commentService 호출
		int row = commentService.addComment(paramComment);
		
		if(row == 0) {
			log.debug("\u001B[42m"+"추가 실패");
		}else {
			log.debug("\u001B[42m"+"추가 성공");
		}
		
		//리턴
		int noticeNo = paramComment.getNoticeNo();
		log.debug("\u001B[42m"+noticeNo);
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
	
	//삭제
	@GetMapping("/removeComment")
	public String removeCommnet(Comment paramComment) {
		log.debug("\u001B[42m"+paramComment);
		
		// commentService 호출
		int row = commentService.removeComment(paramComment);
		
		if(row == 0) {
			log.debug("\u001B[42m"+"삭제 실패");
		}else {
			log.debug("\u001B[42m"+"삭제 성공");
		}
		
		// 리턴
		int noticeNo = paramComment.getNoticeNo();
		log.debug("\u001B[42m"+noticeNo);
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
	
	//수정
	@GetMapping("/modifyComment")
	public String modifyComment(HttpSession session,Model model,Comment paramComment) {
		//세션 검사
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		// commentService 호출
		log.debug("\u001B[42m"+paramComment);
		Comment originComment = commentService.commentOne(paramComment);
		log.debug("\u001B[42m"+originComment);
		
		// view로 보낼 값 넣기
		model.addAttribute("originComment", originComment);
		
		// 리턴
		return "modifyComment";
	}
	@PostMapping("/modifyComment")
	public String modifyComment(Comment paramComment) {
		
		// commentService 호출
		log.debug("\u001B[42m"+paramComment);
		int row = commentService.modifyComment(paramComment);
		
		if(row == 0) {
			log.debug("\u001B[42m"+"수정 실패");
		}else {
			log.debug("\u001B[42m"+"수정 성공");
		}
		
		// 리턴
		int noticeNo = paramComment.getNoticeNo();
		log.debug("\u001B[42m"+noticeNo);
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
}
