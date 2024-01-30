package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	//월 별 스케줄 조회
	List<Map<String, Object>> selectScheduleListByMonth(Map<String, Object> paramMap);
	//일 별 스케줄 조회
	List<Schedule> selectScheduleListByDay(Schedule schedule);
	//단일 스케줄 조회
	Schedule selectScheduleOne(Schedule schedule);
	//입력
	int insertSchedule(Schedule schedule);
	//수정
	int updateSchedule(Schedule schedule);
	//삭제
	int deleteSchedule(Schedule schedule);
	//검색
	List<Schedule> selectScheduleListByWord(Map<String, Object> paramMap);
	//단어 검색 결과 페이징
	int selectScheduleByWordCnt(Map<String, Object> paramMap);
	//스케줄 최대년 구하기
	int selectScheduleMaxYear();
	//스케줄 최소년 구하기
	int selectScheduleMinYear();
	//연월일로 검색
	List<Schedule> selectScheduleListByYMD(Map<String, Object> paramMap);
	//연월일 검색 결과 페이징
	int selectScheduleByYMDCnt(Map<String, Object> paramMap);
}
