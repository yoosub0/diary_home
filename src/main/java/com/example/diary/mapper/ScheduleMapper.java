package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {

	List<Schedule> selectScheduleListByDate(Map<String, Integer> map);
	
	Integer selectScheduleDateMaxYear();
	Integer selectScheduleDateMinYear();
	
	List<Schedule> selectScheduleList();
	List<Schedule> selectScheduleListByWord(String word);
	
	List<Map<String, Object>> selectScheduleByDay(Map<String, Object> paraMap);
	
	List<Map<String, Object>> selectScheduleListByMonth(Map<String, Object> map);
	
	int updateSchedule(Schedule schedule);
	
	int deleteSchedule(Schedule schedule);

	int insertSchedule(Schedule schedule);

}