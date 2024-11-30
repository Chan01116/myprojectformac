package com.chan.aws0822.persistance;

import com.chan.aws0822.domain.MemberVo;

public interface MemberMapper {
	
	public int memberIdCheck(String memberId);
	public MemberVo memberLoginCheck(String memberId);
	
	public int memberInsert(MemberVo mv);

}
