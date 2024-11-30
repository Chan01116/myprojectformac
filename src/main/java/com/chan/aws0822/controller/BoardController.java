package com.chan.aws0822.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
	
	
	@RequestMapping(value = "noticeList.aws", method = RequestMethod.GET)
    public String noticeList() {
    	
        
        return "/board/noticeList";
    }
    
	
	
	
	@RequestMapping(value = "noticeWrite.aws", method = RequestMethod.GET)
    public String noticeWrite() {
    	
        
        return "/board/noticeWrite";
    }
	
	
	
	@RequestMapping(value = "qnaList.aws", method = RequestMethod.GET)
    public String qnaList() {
    	
        
        return "/board/qnaList";
    }
	
	
	
	@RequestMapping(value = "qnaWrite.aws", method = RequestMethod.GET)
    public String qnaWrite() {
    	
        
        return "/board/qnaWrite";
    }
	
	
	
}
