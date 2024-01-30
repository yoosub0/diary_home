package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Counter;

@Mapper
public interface CounterMapper {
	public Counter selectCntByToday();
	
	public int insertCnt();
	
	public int updateCnt();
	
	public int selectCntSum();
}
