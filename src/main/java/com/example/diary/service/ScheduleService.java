package com.example.diary.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Notice;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired private ScheduleMapper scheduleMapper;
	
	public Map<String, Object> getScheduleListByDate(String year, String month, String day) {
		
		// 월 범위
		Integer minYear = scheduleMapper.selectScheduleDateMinYear();
		Integer maxYear = scheduleMapper.selectScheduleDateMaxYear();		
		
		Map<String, Integer> maxMinMap = new HashMap<>();
		maxMinMap.put("minYear", minYear);
		maxMinMap.put("maxYear", maxYear);
		
		// 스케줄 리스트
		Map<String, Integer> paramMap = new HashMap<>();
		if(year.equals("")) {
			paramMap.put("year", null);
		} else {
			paramMap.put("year",  Integer.parseInt(year));
		}
		
		// if.. else
		if(month.equals("")) {
			paramMap.put("month", null);			
		} else {
			paramMap.put("month",  Integer.parseInt(month));
		}
		// if.. else
		if(day.equals("")) {
			paramMap.put("day", null);			
		} else {
		paramMap.put("day",  Integer.parseInt(day));
		}
		
		
		List <Schedule> list = scheduleMapper.selectScheduleListByDate(paramMap);
	
		// 반환 맵
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("maxMinMap", maxMinMap); // 년도 최소/최대 값
		resultMap.put("list", list); // 조건 결과 리스트
		return resultMap;
	}
	
	public List<Schedule> getScheduleListByWord(String word) {
		List<Schedule> list = null;
	
			list = scheduleMapper.selectScheduleListByWord(word);	
		return list;
	}
	

	public List<Map<String, Object>> getScheduleListByMonth(String memberId, int year, int month) {
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("memberId", memberId);
		paraMap.put("year", year);
		paraMap.put("month", month);
			
		return scheduleMapper.selectScheduleListByMonth(paraMap);
	}
	
	public List<Map<String, Object>> getScheduleByDay (String Year, String Month, String Day, String memberId){
		
		System.out.println(Year + "<--year");
		System.out.println(Month + "<--month");
		System.out.println(Day + "<--day");

		
		Map<String, Object> paraMap = new HashMap<>();
			paraMap.put("year", Year);
			paraMap.put("month", Month);
			paraMap.put("day", Day);
			paraMap.put("memberId", memberId);   
		
		List<Map<String, Object>> list = scheduleMapper.selectScheduleByDay(paraMap);
		System.out.println(list + "<--hi");
		
		return list;
	}
	
    public int insertSchedule(int targetY, int targetM, int targetD, Schedule schedule) {
        
    	LocalDate date = LocalDate.of(targetY, targetM, targetD);
        String scheduleDate = date.toString();
        
        System.out.println("schedule" + schedule);
        
        schedule.setScheduleDate(scheduleDate);
      
        return scheduleMapper.insertSchedule(schedule);
    }
	
	public int updateSchedule(Schedule schedule) {
		return scheduleMapper.updateSchedule(schedule);
	}
	
	public int deleteSchedule(Schedule schedule) {
		return scheduleMapper.deleteSchedule(schedule);
	}
	
}