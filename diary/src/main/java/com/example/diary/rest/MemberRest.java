package com.example.diary.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.diary.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class MemberRest {
	@Autowired
	private MemberService memberService;
	
	//아이디 중복 체크
	@PostMapping("idCk")
	public int idCk(@RequestParam(name="idCk")String idCk) {
		log.debug("\u001B[41m"+idCk);
		int Cnt = memberService.idCk(idCk);
		log.debug("\u001B[41m"+Cnt+"");
		return Cnt;
	}
}
