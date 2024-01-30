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
	
	//
	@PostMapping("/insertComment")
	public String insertComment(Comment comment, Model model) {
		
		int row = commentService.insertComment(comment);
		if(row==0) {
			System.out.println("추가 실패");
		} else {
			System.out.println("추가 성공");
		}
		
		int noticeNo = comment.getNoticeNo();
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
	
	@GetMapping("/deleteComment")
	public String deleteComment(Comment comment) {
		int row = commentService.deleteComment(comment);
		
		if(row==0) {
			System.out.println("삭제 실패");
		} else {
			System.out.println("삭제 성공");
		}
		int noticeNo = comment.getNoticeNo();
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
	
	@GetMapping("/updateComment")
	public String updateComment(HttpSession session, Model model, Comment comment) {
		Comment originComment = commentService.commentOne(comment);
		
		model.addAttribute("originComment", originComment);
		
		return "updateComment";
	}
	
	@PostMapping("/updateComment")
	public String updateComment(Comment comment) {
		int row = commentService.updateComment(comment);
		if(row==0) {
			System.out.println("수정 실패");
		} else {
			System.out.println("수정 성공");
		}
		int noticeNo = comment.getNoticeNo();
		String u = "redirect:/noticeOne?noticeNo="+noticeNo;
		return u;
	}
}
