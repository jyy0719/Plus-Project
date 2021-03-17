package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ReviewVO;

public interface ReviewMapper {
	
		public List<ReviewVO> selectNotReview(ReviewVO vo);
		public List<ReviewVO> selectOkayReview(ReviewVO vo);
		public void insertReview(ReviewVO vo);
		public String reviewList();

}
