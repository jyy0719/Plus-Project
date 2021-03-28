package com.project.plus.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.MemberMapper;
import com.project.plus.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;
	
	
	@Autowired
	HttpSession session;

	public void joinMember(MemberVO vo) {
		System.out.println("회원가입 service impl");
		membermapper.joinMember(vo);
	}

	public MemberVO login(MemberVO vo) {
			System.out.println("member Service impl login메서드");
		return membermapper.login(vo);
	}

	public Integer kakaologin(MemberVO vo) {
		System.out.println("카카오로그인 servie impl옴");		
		return membermapper.kakaologin(vo);
	}


	@Override
	public void updateMember(MemberVO vo) {
		membermapper.updateMember(vo);
//		session.update("member.updateMember", vo);
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}

	
	public MemberVO selectMember(MemberVO vo) {
		return membermapper.selectMember(vo);
		
	}

	public int memberPChk(String memberPhone) {
		return membermapper.memberPChk(memberPhone);
	}

	public int memberNChk(String memberNickname) {
		return membermapper.memberNChk(memberNickname);
	}

	public List<MemberVO> memberList(CriteriaMem cmem) {
		List<MemberVO> list = null;
		list = membermapper.memberList(cmem);
		return list;
	}
	
	public int listCount() {
		return membermapper.listCount();
	}

	public MemberVO viewMember(int memberNum) {
		return membermapper.viewMember(memberNum);
	}

	@Override
	   public void updateMemberPoint(MemberVO vo) {
	      membermapper.updateMemberPoint(vo);
	   }
	   
	   @Override
	   public int selectMemberPoint(MemberVO vo) {
	      
	      return membermapper.selectMemberPoint(vo);
	   }

	   @Override
	   public void deductMemberPoint(MemberVO vo) {
	      membermapper.deductMemberPoint(vo);
	   }

	   @Override
	   public void updateClubLeaderPoint(MemberVO vo) {
	      membermapper.updateClubLeaderPoint(vo);
	   }

	   @Override
	   public int selectMemberPointByNickname(MemberVO vo) {
	      return membermapper.selectMemberPointByNickname(vo);
	   }





	
	
	
	

}
