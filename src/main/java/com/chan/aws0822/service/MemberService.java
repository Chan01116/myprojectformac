package com.chan.aws0822.service;
import java.util.ArrayList;

import com.chan.aws0822.domain.MemberVo;


//스프링에서 Member기능에서 사용할 메서드를 선언하는곳
public interface MemberService {
	
	public int memberIdCheck(String memberId);
	public MemberVo memberLoginCheck(String memberId);
	
	public int memberInsert(MemberVo mv);
	

}
