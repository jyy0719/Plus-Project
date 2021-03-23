package com.project.plus.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.domain.ReviewVO;
import com.project.plus.service.ClubService;
import com.project.plus.service.ReviewService;
import com.project.plus.utils.FileUtils;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class ClubController {
	
	@Autowired
	private ClubService clubService;

	@Autowired
	private ReviewService reviewService;

	// 모임 등록, 파일 업로드
	@RequestMapping(value = "/insertClub.do", method = RequestMethod.POST)
	public String insertClub(ClubVO vo, @RequestParam("upload") MultipartFile[] file, HttpServletRequest request)
			throws Exception {

		// 파일을 저장할 절대 경로 지정
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = FileUtils.uploadFile(vo, uploadPath, file);
		clubService.insertClub(vo); // DB에 저장
		log.info("모임 번호 : " + vo.getClubNum() + " 등록 완료 ");
		return "index";

	}

	// 모임 수정  
	@RequestMapping("/updateClub.do")
	public String updateClub(ClubVO vo, @RequestParam("upload") MultipartFile[] file, HttpServletRequest request)
			throws Exception {
		System.out.println(vo.getClubShutDate());
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = FileUtils.uploadFile(vo, uploadPath, file);
		clubService.updateClub(vo);
		log.info("모임 번호 : " + vo.getClubNum() + " 수정 완료 ");
		return "index";
	}

	
	// 컬럼에 저장된 해시태그 list 가져와서 model에 저장
	@ModelAttribute("tags")
	public List<String> getTags() {
		return clubService.getClubHashtag();
	}

	
	// 미리 보여줄 5개의 리뷰 데이터
	public void getReviews(Model model) {
		// club_num과 member_num을 이용하여 닉네임 가져오기
		// club_num은 rttr로 가져왔다고 치고
		ReviewVO review = new ReviewVO();
		// 임의 값
		review.setClubNum(11);
		model.addAttribute("reviews", reviewService.getReviews(review));
		model.addAttribute("reviewCount", reviewService.getReviewCount());
		log.info("리뷰 5개 가져오기");
	}

	
	// json을 이용하여 더보기 리뷰 리스트 가져오기
	// produces : response의 content-type을 utf-8로 인코딩하여 보내기
	@RequestMapping(value = "/getMoreReview.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String getMoreReview(@RequestBody Map<String, String> param) throws JsonProcessingException {
		Map<String, Integer> condition = new HashMap<String, Integer>();

		// json string으로 들어온 파라미터 형변환
		int startIndex = Integer.valueOf(param.get("startIndex").toString());
		int clubNum = Integer.valueOf(param.get("clubNum").toString());

		condition.put("startIndex", startIndex);
		condition.put("clubNum", clubNum);

		List<ReviewVO> newList = reviewService.getMoreReviews(condition);

		// java object -> json
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(newList);
		return jsonString;

	}

	// 모임 상세정보 
	@RequestMapping("/getClub.do")
	public String getClub(ClubVO vo, Model model) {

		getReviews(model);
		model.addAttribute("club", clubService.getClub(vo));
		log.info("모임 번호 : " + vo.getClubNum() + " 상세 정보 ");
		return "getClub.page";
	}

	// 회원 모임 수정 폼 
	@RequestMapping("/getMyClubInfo.do")
	public String getMyClubInfo(ClubVO vo, Model model) {
		vo = clubService.getMyClubInfo(vo);

		// 경로를 자르고 파일명+확장자만 set
		if (vo.getClubMain_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubMain_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		if (vo.getClubContent1_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubContent1_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		if (vo.getClubContent2_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubContent2_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		model.addAttribute("club", vo);
		log.info("모임 수정 폼 : " + vo.getClubNum());
		return "myClubInfo.page";
	}

	@RequestMapping("/deleteClub.do")
	public String deleteClub(ClubVO vo) {
		clubService.deleteClub();
		log.info("모임 번호 : " + vo.getClubNum() + " 삭제 완료 ");
		return "index";
	}
	
}
