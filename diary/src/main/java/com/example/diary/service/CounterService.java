package com.example.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.diary.mapper.CounterMapper;
import com.example.diary.vo.Counter;

@Service
public class CounterService {
	@Autowired
	CounterMapper counterMapper;
	public Counter selectCntByToday() {
		return counterMapper.selectCntByToday();
	}
	
	public int insertCnt() {
		return counterMapper.insertCnt();
	}
	
	public int updateCnt() {
		return counterMapper.updateCnt();
	}
	
	public int selectCntSum() {
		return counterMapper.selectCntSum();
	}
}
