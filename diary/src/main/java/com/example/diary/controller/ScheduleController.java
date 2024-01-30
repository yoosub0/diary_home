package com.example.diary.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	
	//조회
	@GetMapping("/scheduleOne")
	public String scheduleListByDay(HttpSession session,
						@RequestParam (required = false) Integer targetYear,
						@RequestParam (required = false) Integer targetMonth,
						@RequestParam (required = false) Integer targetDate,
						Model model) {
		
		//세션 검사
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		//세션에서 id 추출
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		//scheduleService 호출
		log.debug("\u001B[42m"+memberId);
		log.debug("\u001B[42m"+targetYear);
		log.debug("\u001B[42m"+targetMonth);
		log.debug("\u001B[42m"+targetDate);
		List<Schedule> scheduleList = scheduleService.getScheduleListByDay(memberId,targetYear,targetMonth,targetDate);
		log.debug("\u001B[42m"+scheduleList.size());
		
		//view로 보낼 값 넣기
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDate", targetDate);
		model.addAttribute("memberId", memberId);
		
		//리턴
		return "scheduleOne";
	}
	
	//입력
	@PostMapping("/addSchedule")
	public String addSchedule(HttpSession session, int targetYear, int targetMonth, int targetDate , Schedule schedule) {
		
		// service로 보낼 아이디 
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
	    // service 호출 
		log.debug("\u001B[42m"+memberId);
		log.debug("\u001B[42m"+targetYear);
		log.debug("\u001B[42m"+targetMonth);
		log.debug("\u001B[42m"+targetDate);
		int row = scheduleService.addSchedule(memberId,targetYear,targetMonth,targetDate,schedule);
		if(row == 0) {
			log.debug("\u001B[42m"+"추가 실패");
		}else {
			log.debug("\u001B[42m"+"추가 성공");
		}
		
		// 리턴
		String u = "redirect:/scheduleOne?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDate="+targetDate;
		return u;
	}
	
	//삭제
	@GetMapping("/removeSchedule")
	public String removeSchedule(int targetYear, int targetMonth, int targetDate ,Schedule schedule) {
		
		// service 호출
		log.debug("\u001B[42m"+schedule);
		log.debug("\u001B[42m"+targetYear);
		log.debug("\u001B[42m"+targetMonth);
		log.debug("\u001B[42m"+targetDate);
		int row = scheduleService.removeSchedule(schedule);
		if(row == 0) {
			log.debug("\u001B[42m"+"삭제 실패");
		}else {
			log.debug("\u001B[42m"+"삭제 성공");
		}
		
		// 리턴
		String u = "redirect:/scheduleOne?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDate="+targetDate;
		return u;
	}
	
	//수정
	@GetMapping("/modifySchedule")
	public String modifySchedule(HttpSession session, int targetYear, int targetMonth, int targetDate ,Schedule schedule, Model model) {
		//세션 검사
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		log.debug("\u001B[42m"+schedule);
		Schedule originSchedule = scheduleService.getScheduleOne(schedule);
		log.debug("\u001B[42m"+originSchedule);
		
		model.addAttribute("originSchedule", originSchedule);
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDate", targetDate);
		model.addAttribute("memberId", memberId);
		
		return "modifySchedule";
	}
	@PostMapping("/modifySchedule")
	public String modifySchedule(Schedule schedule, int targetYear, int targetMonth, int targetDate) {
		
		log.debug("\u001B[42m"+schedule);
		log.debug("\u001B[42m"+targetYear);
		log.debug("\u001B[42m"+targetMonth);
		log.debug("\u001B[42m"+targetDate);
		int row = scheduleService.modifySchedule(schedule,targetYear,targetMonth,targetDate);
		if(row == 0) {
			log.debug("\u001B[42m"+"수정 실패");
		}else {
			log.debug("\u001B[42m"+"수정 성공");
		}
		// 리턴
		String u = "redirect:/scheduleOne?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDate="+targetDate;
		return u;
	}
	
	//단어 검색
	@GetMapping("/scheduleListByWord")
	public String scheduleListByWord(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(name="word", defaultValue = "")String word, Model model, HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		// scheduleService 호출
		log.debug("\u001B[42m"+memberId);
		log.debug("\u001B[42m"+currentPage);
		log.debug("\u001B[42m"+word);
		List<Schedule> list = scheduleService.getScheduleListByWord(memberId, currentPage, word);
		log.debug("\u001B[42m"+list.size());
		int lastPage = scheduleService.getScheduleListCnt(memberId, word);
		log.debug("\u001B[42m"+lastPage);
		
		//view로 보낼 값 넣기
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("paramWord", word);
		
		//리턴
		return "scheduleListByWord";
	}
	
	//연월일 검색
	@GetMapping("/scheduleListByYMD")
	public String scheduleListByYMD(HttpSession session, Model model,
									@RequestParam(defaultValue = "1")int currentPage,
									@RequestParam(defaultValue = "")String year,
									@RequestParam(defaultValue = "")String month,
									@RequestParam(defaultValue = "")String date) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		// scheduleService 호출
		log.debug("\u001B[42m"+currentPage);
		log.debug("\u001B[42m"+year);
		log.debug("\u001B[42m"+month);
		log.debug("\u001B[42m"+date);
		Map<String, Integer> maxMinMap = scheduleService.getScheduleYearMaxMin();
		List<Schedule> list = scheduleService.getScheduleListByYMD(memberId,currentPage, year, month, date);
		int lastPage = scheduleService.getScheduleListByYMDCnt(memberId,year, month, date);
		log.debug("\u001B[42m"+list.size());
		log.debug("\u001B[42m"+lastPage);
		log.debug("\u001B[42m"+maxMinMap.get("maxYear")+"");
		log.debug("\u001B[42m"+maxMinMap.get("minYear")+"");
		
		//view로 보낼 값 넣기
		model.addAttribute("list", list);
		model.addAttribute("maxMinMap", maxMinMap);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);
		
		//리턴
		return "/scheduleListByYMD";
	}
}
