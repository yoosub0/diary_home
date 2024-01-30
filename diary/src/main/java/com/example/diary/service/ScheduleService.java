package com.example.diary.service;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleMapper scheduleMapper;
	int rowPerPage = 10;
	//달력 속 출력
	public List<Map<String, Object>> getScheduleListByMonth(String memberId , int targetYear, int targetMonth){
		log.debug("\u001B[43m"+memberId);
		log.debug("\u001B[43m"+targetYear);
		log.debug("\u001B[43m"+targetMonth);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("targetYear", targetYear);
		paramMap.put("targetMonth", targetMonth+1);
		
		return scheduleMapper.selectScheduleListByMonth(paramMap);
	}
	//일별 출력
	public List<Schedule> getScheduleListByDay(String memberId , int targetYear, int targetMonth, int targetDate){
		log.debug("\u001B[43m"+memberId);
		log.debug("\u001B[43m"+targetYear);
		log.debug("\u001B[43m"+targetMonth);
		log.debug("\u001B[43m"+targetDate);
		LocalDate date = LocalDate.of(targetYear, targetMonth, targetDate);
		String scheduleDate = date.toString();
		log.debug("\u001B[43m"+scheduleDate);
		Schedule schedule = new Schedule();
		schedule.setMemberId(memberId);
		schedule.setScheduleDate(scheduleDate);
		log.debug("\u001B[43m"+schedule);
		return scheduleMapper.selectScheduleListByDay(schedule);
	}
	//상세조회
	public Schedule getScheduleOne(Schedule schedule) {
		log.debug("\u001B[43m"+schedule);
		return scheduleMapper.selectScheduleOne(schedule);
	}
	//입력
	public int addSchedule(String memberId, int targetYear, int targetMonth, int targetDate, Schedule schedule) {
		LocalDate date = LocalDate.of(targetYear, targetMonth, targetDate);
		String scheduleDate = date.toString();
		
		schedule.setMemberId(memberId);
		schedule.setScheduleDate(scheduleDate);
		log.debug("\u001B[43m"+schedule);
		return scheduleMapper.insertSchedule(schedule);
	}
	//수정
	public int modifySchedule(Schedule schedule, int targetYear, int targetMonth, int targetDate) {
		
		LocalDate date = LocalDate.of(targetYear, targetMonth, targetDate);
		String scheduleDate = date.toString();
		
		schedule.setScheduleDate(scheduleDate);
		log.debug("\u001B[43m"+schedule);
		return scheduleMapper.updateSchedule(schedule);
	}
	//삭제
	public int removeSchedule(Schedule schedule) {
		log.debug("\u001B[43m"+schedule);
		return scheduleMapper.deleteSchedule(schedule);
	}
	//검색
	public List<Schedule> getScheduleListByWord(String memberId, int currentPage, String word){
		log.debug("\u001B[43m"+memberId);
		log.debug("\u001B[43m"+word);
		int beginRow = (currentPage -1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("word", word);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		log.debug("\u001B[43m"+paramMap);
		
		return scheduleMapper.selectScheduleListByWord(paramMap);
	}
	//검색 목록 페이징
	public int getScheduleListCnt(String memberId, String word) {
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("word", word);
		
		int totalCnt = scheduleMapper.selectScheduleByWordCnt(paramMap);
		int lastPage = totalCnt / rowPerPage;
		if((totalCnt % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		log.debug("\u001B[43m"+lastPage);
		return lastPage;
	}
	//최대 최소 년
	public Map<String, Integer> getScheduleYearMaxMin(){
		Integer maxYear = scheduleMapper.selectScheduleMaxYear();
		Integer minYear = scheduleMapper.selectScheduleMinYear();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("minYear", minYear);
		map.put("maxYear", maxYear);
		log.debug("\u001B[43m"+map);
		return map;
	}
	//연월일 검색
	public List<Schedule> getScheduleListByYMD(String memberId,int currentPage, String year,String month,String date){
		int beginRow = (currentPage -1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		if(year.equals("")) {
			paramMap.put("year",null);
		}else {
			paramMap.put("year", Integer.parseInt(year));
		}
		if(month.equals("")) {
			paramMap.put("month",null);
		}else {
			paramMap.put("month", Integer.parseInt(month));
		}
		if(date.equals("")) {
			paramMap.put("date",null);
		}else {
			paramMap.put("date", Integer.parseInt(date));
		}
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		paramMap.put("memberId", memberId);
		log.debug("\u001B[43m"+paramMap);
		return scheduleMapper.selectScheduleListByYMD(paramMap);
	}
	//연월일 검색 목록 페이징
	public int getScheduleListByYMDCnt(String memberId,String year,String month,String date) {
		
		Map<String, Object> paramMap = new HashMap<>();
		if(year.equals("")) {
			paramMap.put("year",null);
		}else {
			paramMap.put("year", Integer.parseInt(year));
		}
		if(month.equals("")) {
			paramMap.put("month",null);
		}else {
			paramMap.put("month", Integer.parseInt(month));
		}
		if(date.equals("")) {
			paramMap.put("date",null);
		}else {
			paramMap.put("date", Integer.parseInt(date));
		}
		paramMap.put("memberId", memberId);
		log.debug("\u001B[43m"+paramMap);
		int totalCnt = scheduleMapper.selectScheduleByYMDCnt(paramMap);
		int lastPage = totalCnt / rowPerPage;
		if((totalCnt % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		log.debug("\u001B[43m"+lastPage);
		return lastPage;
	}
}
