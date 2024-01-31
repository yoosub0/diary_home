package com.example.diary.mapper;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
	// 로그인
	Member login(Member member);
 
 	// 회원가입
 	int insertMember(Member member);
 	
 	// 업데이트
 	int updateMemberPw(Map<String, Object> MemberPw);
 	
 	// 삭제
 	int deleteMember(Member member);
 	
 	// 아이디 중복 확인
 	int idCk (String memberId);
}
