package com.sist.service;

import com.sist.vo.MemberVO;

/*
 *   결합성이 낮은 프로그램 => 유지보수 
 *   user==> controller  ==> service ==> dao ==> 오라클 
 *   user==> controller <==  service <== dao <== 오라클
 */
public interface MemberService {
	public int idCheck(String userId);
	public void memberInsert(MemberVO vo);
	public void memberAuthorityInsert(String userId);
	public MemberVO memberInfoData(String userId);
	public MemberVO memberSessionData(String userId);
}