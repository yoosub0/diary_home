package com.example.diary.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Schedule {
	private String scheduleNo;
	private String memberId;
	private String scheduleDate;
	private String scheduleMemo;
	private String scheduleEmoji;
	private String createdate;
	
}
