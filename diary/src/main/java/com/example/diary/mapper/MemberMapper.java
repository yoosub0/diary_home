package com.example.diary.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
	//MemberController
	//로그인
	Member login(Member member);
	//회원가입
	int insertMember(Member member);
	//비밀번호 수정
	int updateMemberPw(Map<String, Object> MemberPwMap);
	
	//MemberRest
	//아이디 중복 체크
	int idCk(String memberId);
}
