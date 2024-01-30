package com.example.diary.vo;

import lombok.Data;

@Data
public class Comment {
	private String isSecret;
	private int commentNo;
	private int noticeNo;
	private String memberId;
	private String commentContent;
	private String createdate;
}
