package com.project.plus.controller;

import java.io.File;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;

@Controller
@SessionAttributes("user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="memberJoin.do", method=RequestMethod.GET)
	public String memberJoin(MemberVO vo) throws Exception {
		
		
		MultipartFile uploadFile = vo.getUploadfile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/" + fileName));
		}
		
		
		memberService.joinMember(vo);
		return "redirect:/index.do";
			
	}
	


}
