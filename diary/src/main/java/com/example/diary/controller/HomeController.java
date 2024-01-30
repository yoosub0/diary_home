package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.CounterService;
import com.example.diary.service.NoticeService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private CounterService counterService;
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/")
	public String start(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home(HttpSession session,Model model,
						@RequestParam(required = false) Integer targetYear,	//(required = false)을 넣으면 null값도 받을 수 있음
						@RequestParam(required = false) Integer targetMonth) {
		//로그인 후
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		//세션에서 로그인 아이디 출력
		String loginId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		//CalendarService 호출
		log.debug("\u001B[42m"+targetYear);
		log.debug("\u001B[42m"+targetMonth);
		Map<String, Object> calendarMap = calendarService.getCalendar(targetYear,targetMonth);
		log.debug("\u001B[42m"+calendarMap);
		
		//ScheduleService 호출
		List<Map<String, Object>> scheduleList = scheduleService.getScheduleListByMonth(loginId,(Integer)calendarMap.get("targetYear"),(Integer)calendarMap.get("targetMonth"));
		log.debug("\u001B[42m"+scheduleList.size()+" <-- schedule size");
		Map<String, Integer> maxMinMap = scheduleService.getScheduleYearMaxMin();
		log.debug("\u001B[42m"+maxMinMap);
		
		//CounterService 호출
		int totalCnt = counterService.selectCntSum();
		log.debug("\u001B[42m"+totalCnt);
		
		//NoticeService 호출
		List<Notice> noticeList = noticeService.noticeList(1);
		log.debug("\u001B[42m"+noticeList);
		
		//home.jsp로 보낼 값 넣기
		model.addAttribute("loginId", loginId);
		model.addAttribute("calendarMap", calendarMap);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("maxMinMap", maxMinMap);
		model.addAttribute("noticeList", noticeList);
		
		//리턴
		return "home";
	}
}
