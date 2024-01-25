package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    
    @GetMapping("/updateNotice")
	public String updateNotice(Notice notice, HttpSession session, Model model) {
		Notice resultNotice = noticeService.noticeOne(notice);
		
		model.addAttribute("resultNotice", resultNotice);
		Member member = (Member)session.getAttribute("loginMember");

		return "updateNotice";
	}
	
	@PostMapping("/updateNotice")
	public String updateNotice(Notice notice, HttpSession session) {
		// mapper 호출
		int row = noticeService.updateNotice(notice);
		System.out.println(notice.getNoticePw());
		if(row==0) {
			System.out.println("업뎃실패");
			return "redirect:/updateNotice?noticeNo="+notice.getNoticeNo();
		} else {
			System.out.println("업뎃성공");
		}
		return "redirect:/noticeList";
	}
	
	@GetMapping("/addComment")
	public String addComment(Notice notice, Comment comment, HttpSession session, Model model) {
		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice", resultNotice);
		// mapper 호출
		return "addComment";
	}
	
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(HttpSession session, Model model, Notice notice) {
		if(session.getAttribute("loginMember")==null) {
			return "redirect:/login";
		}
		model.addAttribute("notice", notice);
		return "deleteNotice";
	}
	
	@PostMapping("/deleteNotice")
	public String deleteNotice(HttpSession session, Notice notice, Model model) {
		if(session.getAttribute("loginMember")==null) {
			return "redirect:/login";
		}
		System.out.println(notice.getNoticeNo() + "<--noticeNo");
		System.out.println(notice.getNoticePw());
		model.addAttribute("notice", notice);
		int row = noticeService.deleteNotice(notice);
		if(row==0) {
			System.out.println("삭제 실패");
			return "redirect:/deleteNotice?noticeNo="+notice.getNoticeNo();
		} else {
			System.out.println("삭제 성공");
	
	}
		return "redirect:/noticeList";
}

    @GetMapping("/noticeList")
    public String noticeList(Model model,
                             @RequestParam(defaultValue = "1") int currentPage) {
        return noticeService.noticeList(model, currentPage);
    }
    
    @GetMapping("/noticeOne")
    public String noticeOne(Model model, Notice notice, Comment comment) {
    	Notice resultNotice = noticeService.noticeOne(notice);
    	model.addAttribute("resultNotice", resultNotice);
    	  System.out.println(resultNotice.getNoticeNo()+"<----getNoticeNo");
    	  System.out.println(resultNotice.getNoticeTitle()+"<----getNoticeTitle");
     	  
    	  return "noticeOne";  
    }
    
    @GetMapping("/addNotice")
    public String addNotice() {
        return "addNotice";
    }

    @PostMapping("/addNotice")
    public String addNotice(Notice notice) {
        noticeService.addNotice(notice);
        return "redirect:/noticeList";
    }
	@PostMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/login";
	}
}
