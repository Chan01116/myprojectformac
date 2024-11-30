package com.chan.aws0822.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.aws0822.domain.MemberVo;
import com.chan.aws0822.persistance.MemberMapper;
@Service
public class MemberServiceImpl implements MemberService{

	private MemberMapper mm;
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public MemberServiceImpl(SqlSession sqlSession) {
		this.mm = sqlSession.getMapper(MemberMapper.class);
		
	}	
	
	@Override
	public int memberIdCheck(String memberId) {
		int value = mm.memberIdCheck(memberId);
		return value;
	}

	@Override
	public MemberVo memberLoginCheck(String memberId) {
		MemberVo mv = mm.memberLoginCheck(memberId);
		return mv;
	}

	@Override
	public int memberInsert(MemberVo mv) {
		int value = mm.memberInsert(mv);
		return value;
	}

	

}
