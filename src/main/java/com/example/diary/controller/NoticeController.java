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

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private CommentService commentService;
    
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
    
    @GetMapping("/noticeOne")
    public String noticeOne(HttpSession session, Model model, Notice notice, Comment comment) {
    	if(session.getAttribute("loginMember") == null) {
    		return "redirect:/login";
    	}
    	Member loginMember = (Member)session.getAttribute("loginMember");
    	
    	System.out.println(notice);
    	Notice resultNotice = noticeService.noticeOne(notice);
    	System.out.println(resultNotice);
    	
     	Map<String, Object> map = new HashMap<>();
     	map.put("paramNotice", notice);
     	
     	List<Comment> list = commentService.commentList(map);
     	
     	model.addAttribute("loginMember", loginMember);
     	model.addAttribute("resultNotice", resultNotice);
     	model.addAttribute("list", list);
     	
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
	
    @GetMapping("/noticeList")
    public String noticeList(Model model,
                             @RequestParam(defaultValue = "1") int currentPage) {
        return noticeService.noticeList(model, currentPage);
    }
	
	@PostMapping("/noticeList")
	public  String searchNotice(Model model, Notice notice, @RequestParam(defaultValue = "1") int currentPage) {
		List<Notice> list = noticeService.searchNotice(notice, currentPage);
		System.out.println(list+"<--list");
		int lastPage = noticeService.searchLastPage(notice);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list+"lastpppp");
		return "noticeList";
	}
}
