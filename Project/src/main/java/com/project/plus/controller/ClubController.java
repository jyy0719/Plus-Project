package com.project.plus.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.plus.domain.ClubVO;
import com.project.plus.service.ClubService;
import com.project.plus.utils.FileUtils;

@Controller
public class ClubController {

	@Autowired
	private ClubService clubService;

	@RequestMapping(value = "/insertClub.do", method = RequestMethod.POST)
	public String insertClub(ClubVO vo, @RequestParam("upload") MultipartFile file, HttpServletRequest request) {

		// 파일을 저장할 절대 경로 지정
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");

		// 넘어온 파일이 있다면
		if (!file.getOriginalFilename().isEmpty() && !file.isEmpty()) {
			// 파일의 원본 이름을 얻고
			String orgFileName = file.getOriginalFilename();
			
			// 겹쳐지지 않는 파일명을 위한 유니크한 값 생성
			UUID uid = UUID.randomUUID();

			// 원본파일 이름과 UUID 결합
			String newFileName = uid.toString() + "_" + orgFileName;

			// 파일을 저장할 폴더 생성(년 월 일 기준)
			String datePath = FileUtils.calcPath(uploadPath);

			try {
				// 지정해준 경로로 파일을 저장한다
				file.transferTo(new File(uploadPath + datePath + File.separator + newFileName));
				vo.setClubThumb_Pic(File.separator + "uploadImg" + datePath + File.separator + newFileName);
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 업로드 오류");
			}
			
			

		} else {
			System.out.println("파일이 없습니다");
		}

		
		clubService.insertClub(vo); // DB에 저장
		return "index";
	}

	// 컬럼에 저장된 해시태그 list 가져와서 model에 저장
	@ModelAttribute("tags")
	public List<String> getTags() {
		return clubService.getClubHashtag();
	}

	@RequestMapping("/getClub.do")
	public String getClubInfo(ClubVO vo, Model model) {
		System.out.println("모임 상세정보 보기");
		model.addAttribute("club", clubService.getClubInfo(vo));
		return "clubInfo";
	}

	@RequestMapping("/getMyClubInfo.do")
	public String getMyClubInfo(ClubVO vo, Model model) {
		System.out.println("수정할 모임의 폼 보여주기");
		model.addAttribute("club", clubService.getMyClubInfo(vo));
		return "/myClubInfo";
	}

	@RequestMapping("/updateClub.do")
	public String updateClub(ClubVO vo) {
		System.out.println("모임 수정하기 완료");
		clubService.updateClub(vo);
		return "index";
	}
	
	@RequestMapping("/deleteClub.do")
	public String deleteClub(ClubVO vo) {
		System.out.println("모임 삭제 완료");
		clubService.deleteClub();
		return "index";
	}
}
