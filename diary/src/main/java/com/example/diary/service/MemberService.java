package com.example.diary.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	//MemberController
	//로그인
	public Member login(Member paramMember) {
		log.debug("\u001B[43m"+paramMember);
		Member resultMember = memberMapper.login(paramMember);
		log.debug("\u001B[43m"+resultMember);
		return resultMember;
	}
	//회원가입
	public int addMember(Member paramMember) {
		log.debug("\u001B[43m"+paramMember);
		return memberMapper.insertMember(paramMember);
	}
	//비밀번호변경
	public int modifyPw(int loginMemberNo, String newMemberPw,String memberPw) {
		log.debug("\u001B[43m"+loginMemberNo);
		log.debug("\u001B[43m"+newMemberPw);
		log.debug("\u001B[43m"+memberPw);
		Map<String,Object> pwMap = new HashMap<>();
		pwMap.put("newMemberPw", newMemberPw);
		pwMap.put("memberPw", memberPw);
		pwMap.put("memberNo", loginMemberNo);
		
		return memberMapper.updateMemberPw(pwMap);
	}
	//MemberRest
	//아이디 중복 체크
	public int idCk(String memberId) {
		log.debug("\u001B[43m"+memberId);
		return memberMapper.idCk(memberId);
	}
}
