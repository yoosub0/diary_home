package com.example.diary.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String memberId;
	private String noticeTitle;
	private String noticeContent;
	private String noticePw;
	private String createdate;
}
