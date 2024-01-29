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

	@Autowired private ScheduleService scheduleService;
	
	@GetMapping("/scheduleListByDate")
	public String scheduleListByDate(Model model,
			@RequestParam(defaultValue = "") String year,
			@RequestParam(defaultValue = "") String month,
			@RequestParam(defaultValue = "") String day){
		Map<String, Object> resultMap = scheduleService.getScheduleListByDate(year, month, day);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("maxMinMap", resultMap.get("maxMinMap"));
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		return "scheduleListByDate";
	}
	
	@GetMapping("/scheduleByDay")
	public String scheduleByDay(HttpSession session, Model model,
			@RequestParam(defaultValue = "") String Year,
			@RequestParam(defaultValue = "") String Month,
			@RequestParam(defaultValue = "") String Day) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		/*
		 * List<Schedule> list = scheduleService.getScheduleByDay(memberId, year, month,
		 * day); model.addAttribute("list", list);
		 */

		System.out.println(memberId+"<==memberId");
		System.out.println(Day+"<==day");
		System.out.println(Year+"<==year");
		System.out.println(Month+"<==month");
		
		List<Map<String, Object>> resultList = scheduleService.getScheduleByDay(Year, Month, Day, memberId);
		model.addAttribute("resultList", resultList);
//		List<Schedule> resultMap = scheduleService.getScheduleByDay(memberId, year, month, day);
//		model.addAttribute("list", resultMap);
		model.addAttribute("Year", Year);
		model.addAttribute("Month", Month);
		model.addAttribute("Day", Day);
		return "scheduleByDay";
	}
	
	@GetMapping("/scheduleListByWord")
	public String scheduleListByWord(Model model,
			@RequestParam(name="word", defaultValue="")String word) {
			List <Schedule> list = scheduleService.getScheduleListByWord(word);
			model.addAttribute("list", list);
		return "scheduleListByWord";
	}
	
	@GetMapping("/updateSchedule")
	public String updateSchedule(Schedule schedule, Model model) {
		model.addAttribute("scheduleMemo", schedule.getScheduleMemo());
		model.addAttribute("scheduleNo", schedule.getScheduleNo());
		return "updateSchedule";
	}
	
	@PostMapping("/updateSchedule")
	public String updateNotice(@RequestParam String scheduleMemo, Schedule schedule) {
		int row = scheduleService.updateSchedule(schedule);
		System.out.println(schedule.getScheduleMemo());
		if(row==0) {
			System.out.println("업뎃실패");
			return "redirect:/updateSchedule";
		} else {
			System.out.println("업뎃성공");
		}
		return "redirect:/home";
	}
	
	@GetMapping("/deleteSchedule")
	public String deleteSchedule(Schedule schedule) {
		int row = scheduleService.deleteSchedule(schedule);
		if(row==0) {
			System.out.println("삭제 실패");
			return "redirect:/scheduleByDay";
		} else {
			System.out.println("삭제 성공");
		}
		return "redirect:/home";
	}
	
	@PostMapping("/insertSchedule")
	public String insertSchedule(HttpSession session, int targetY, int targetM, int targetD, Schedule schedule) {
		
		// service로 보낼 아이디
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		int row = scheduleService.insertSchedule(targetY, targetM, targetD, memberId);
		if(row==0) {
			System.out.println("추가 실패");
			return "redirect:/scheduleByDay";
		} else {
			System.out.println("추가 성공");
		}
		String url = "redirect:/home?Year";
		return url;
	}
	
}
