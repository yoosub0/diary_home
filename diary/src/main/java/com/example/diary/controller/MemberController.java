package com.example.diary.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인
	@GetMapping("/login")
	public String login(HttpSession session) {
		//로그인 전
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/home";
		}
		return "login";
	}
	@PostMapping("/login")
	public String login(Member paramMember, HttpSession session) {
		log.debug("\u001B[42m"+paramMember);
		Member loginMember = memberService.login(paramMember);
		if(loginMember == null) {
			System.out.println("로그인 실패");
			return "redirect:/login";
		}
		
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/home";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	//회원가입
	@GetMapping("/addMember")
	public String addMember(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/home";
		}
		return "addMember";
	}
	@PostMapping("/addMember")
	public String addMember(Member paramMember, HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/home";
		}
		log.debug("\u001B[42m"+paramMember);
		int row = memberService.addMember(paramMember);
		if(row == 0) {
			log.debug("\u001B[42m"+"회원가입 실패");
			return "redirect:/addmember";
		}else {
			log.debug("\u001B[42m"+"회원가입 성공");
		}
		return "redirect:/login";
	}
	
	//비밀번호 변경
	@GetMapping("/modifyMemberPw")
	public String modifyMemberPw(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		//리턴
		return "modifyMemberPw";
	}
	@PostMapping("/modifyMemberPw")
	public String modifyMemberPw(HttpSession session,String newMemberPw,String memberPw) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		// 세션에서 memberNo 추출
		int loginMemberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		
		// MemberService 호출
		log.debug("\u001B[42m"+loginMemberNo);
		log.debug("\u001B[42m"+newMemberPw);
		log.debug("\u001B[42m"+memberPw);
		int row = memberService.modifyPw(loginMemberNo,newMemberPw,memberPw);
		
		if(row == 0) {
			log.debug("\u001B[42m"+row + " <-- 수정 실패");
		}else {
			log.debug("\u001B[42m"+row + " <-- 수정 성공");
			session.invalidate();
		}
		
		//리턴
		return "redirect:/modifyMemberPw";
	}
}
