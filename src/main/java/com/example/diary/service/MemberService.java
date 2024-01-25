package com.example.diary.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;

	public Member login(Member paramMember) {
		Member resultMember = memberMapper.login(paramMember);
		return resultMember;
	}
	
	// 회원가입
	public int addMember(Member paramMember) {
		memberMapper.insertMember(paramMember);
		return 0;
	}
	
	public int updateMemberPw(Map<String, Object> paramMap) {
		return memberMapper.updateMemberPw(paramMap);
	}
	
	public int deleteMember(Member paramMember) {
		return memberMapper.deleteMember(paramMember);
	}
}
