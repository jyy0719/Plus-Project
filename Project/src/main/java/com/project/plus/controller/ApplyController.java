package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.ApplyVO;
import com.project.plus.service.ApplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ApplyController {
	
	@Autowired
	ApplyService applyService;
	
	@RequestMapping("/apply.do")
	@ResponseBody
	public int apply(ApplyVO apply) {
		log.info("신청할 모임 번호 : " + apply.getClubNum());
		log.info("신청할 회원 번호 : " + apply.getMemberNum());
		
		// 모임에 신청하는 회원이 이미 신청을 했는지 확인
		int result = applyService.getOneApply(apply);
		
		if(result==1) {
			return 0;
		} else {
			// 없다면 insert 
			applyService.apply(apply);
			return 1;
		}
		
	}
	
	// 무료 더하기 목록 가져오기 
	public String getFreeClubList() {
		
		
		return "index";
	}
}
