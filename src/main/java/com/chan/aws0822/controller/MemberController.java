package com.chan.aws0822.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chan.aws0822.domain.MemberVo;
import com.chan.aws0822.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
	private MemberService memberService;
   
    @RequestMapping(value = "memberLogin.aws", method = RequestMethod.GET)
    public String memberLogin() {
    	
    	//System.out.println("조인들어오나요?");
        return "/member/memberLogin";
    }
    
    
    @RequestMapping(value="memberLoginAction.aws",method=RequestMethod.POST)
	public String memberLoginAction(
			
			
			
			@RequestParam("memberid") String memberid, 
			@RequestParam("memberpassword") String memberpassword,
			RedirectAttributes rttr,
			HttpSession session
			) {		
    	//System.out.println("로그인액션들어옵니까?");
		MemberVo mv = memberService.memberLoginCheck(memberid);
		//저장된 비밀번호를 가져온다
		
		String path = "";
		if (mv != null) {  //객체값이 있으면
			String reservedPassword = mv.getMemberpassword(); 
		
			if(bCryptPasswordEncoder.matches(memberpassword, reservedPassword)) {
				System.out.println("비밀번호 일치");
				rttr.addAttribute("midx", mv.getMidx());
				rttr.addAttribute("memberId", mv.getMemberid());
				rttr.addAttribute("memberName", mv.getMembername());
				
				//logger.info("saveUrl===>"+session.getAttribute("saveUrl"));
				
				if(session.getAttribute("saveUrl") != null) {
					path ="redirect:"+session.getAttribute("saveUrl").toString();
				}else {
				
					path ="redirect:/";
				}
				
				
			}else {
				
				//rttr.addAttribute("midx", "");
				//rttr.addAttribute("memberId", "");
				//rttr.addAttribute("memberName", "");
				rttr.addFlashAttribute("msg", "아이디/비밀번호를 확인해주세요.");
				path = "redirect:/member/memberLogin.aws";
			}		
		}else {
			//rttr.addAttribute("midx", "");
			//rttr.addAttribute("memberId", "");
			//rttr.addAttribute("memberName", "");    //위험해서 안씀
			rttr.addFlashAttribute("msg", "해당하는 아이디가 없습니다.");  //플래쉬는 한번만
			path = "redirect:/member/memberLogin.aws";
		}		
		//회원정보를  세션에 담는다
				
		return path;
	}
    
    
    
    
    
    
    
    @RequestMapping(value = "memberJoin.aws",method = RequestMethod.GET)
	public String memberJoin() {
		
		
		
		return "/member/memberJoin";
	}
    
    @RequestMapping(value = "memberJoinAction.aws",method = RequestMethod.POST)
	public String memberJoinAction(MemberVo mv) {
		
		
		String memberpassword_enc = bCryptPasswordEncoder.encode(mv.getMemberpassword());
		mv.setMemberpassword(memberpassword_enc);
		
		
		int value = memberService.memberInsert(mv);
		
		
		String path = "";
		if(value == 1) {
			path = "redirect:/";
			
		}else if(value == 0) {
			path = "redirect:/member/memberJoin.aws";
			
		}
				
		
		return path;
	}
    
    
    
    
    
    


}