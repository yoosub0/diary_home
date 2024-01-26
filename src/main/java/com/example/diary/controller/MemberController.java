package com.example.diary.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		// 로그인 전에만
		if(session.getAttribute("loginMember")!= null) {
			return "redirect:/home";
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Member paramMember) {
		// 로그인 전에만
		Member loginMember = memberService.login(paramMember);
		if(loginMember == null) {
			return "redirect:/login";
		}
		session.setAttribute("loginMember", loginMember);
		return "redirect:/home";
		}
	
	// 회원가입 폼
	@GetMapping("/addMember")
	public String addMember() {
		return "addMember";
	}
	
	// 회원가입 액션
	@PostMapping("/addMember")
	public String addMember(Member paramMember, HttpSession session) {
		memberService.addMember(paramMember);
		return "redirect:/login";
	}
	
	// 비밀번호 변경
	@GetMapping("/updateMemberPw")
	public String updateMemberPw(HttpSession session) {
		if(session.getAttribute("loginMember")== null) {
			return "redirect:/login";
		}
		return "updateMemberPw";
	}
	
	@PostMapping("/updateMemberPw")
	public String updateMemberPw(HttpSession session, String oldPw, String newPw, Member member) {
		if(session.getAttribute("loginMember")== null) {
			return "redirect:/login";
		}
		// MemberService로 보낼 값
		int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		Map<String, Object> p = new HashMap<>();
		p.put("oldPw", oldPw);
		p.put("newPw", newPw);
		p.put("memberNo", memberNo);
		
		System.out.println(oldPw + "<--oldPw");
		System.out.println(newPw + "<--newPw");
		System.out.println(memberNo + "<--memberNo");
		int row = memberService.updateMemberPw(p);
		
		if(row == 0) {
			System.out.println("수정 실패");
			return "redirect:/updateMemberPw?memberNo="+member.getMemberNo();
		}else {
			System.out.println("수정 성공");
			session.invalidate();
	}
		return "redirect:/updateMemberPw";
}
	
	@GetMapping("/deleteMember")
	public String deleteMember(Model model, HttpSession session, Member member) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if(loginMember == null) {
			return "redirect:/login";
		}
		model.addAttribute("memberNo", member.getMemberNo());
		return "/deleteMember";
	}
	
	@PostMapping("/deleteMember")
	public String deleteMember(HttpSession session, Member member) {
		if(session.getAttribute("loginMember")==null) {
			return "redirect:/login";	
		}
	int row = memberService.deleteMember(member);
	System.out.println(member.getMemberPw());
	if(row ==0) {
		System.out.println("삭제실패");
		return "redirect:/deleteMember";
	} else {
		System.out.println("삭제성공");
	}
	session.invalidate();
	return "redirect:/login";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/login";
	}
}
	
	
