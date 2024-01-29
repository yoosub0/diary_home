package com.example.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	public Comment commentOne(Comment comment) {
		return;
	}
}
