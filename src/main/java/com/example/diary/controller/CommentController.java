package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		
	}
	
	@GetMapping("/deleteComment")
	public String deleteComment(Comment comment) {
		
	}
	
	@GetMapping("/updateComment")
	public String updateComment(HttpSession session, Model model, Comment comment) {
		
	}
	
	@PostMapping("/updateComment")
	public String updateComment(Comment comment) {
		
	}
}
