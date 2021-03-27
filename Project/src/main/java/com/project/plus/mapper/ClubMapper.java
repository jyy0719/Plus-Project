package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;

public interface ClubMapper {
	public void insertClub(ClubVO vo);
	public ClubVO getClub(int clubNum);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(int clubNum);
	public int updateClub(ClubVO vo);
	public void deleteClub(ClubVO vo);
	public int apply(ApplyVO apply);
	public Integer getOneApply(ApplyVO apply);
	public List<ClubVO> getChatList(int memNum);
<<<<<<< HEAD
	public List<ChatVO> getMessages(int clubNum);
	public int insertMessage(ChatVO msg);
=======
	public int insertMessage(ChatVO msg);
	public List<ChatVO> getMessages(int clubNum);
>>>>>>> e17b1a88e3fd2bdb7175bf9f7864a9913fb62b9f
	
	//정연하단 추가 20210326

	public ClubVO selectClub(ClubVO vo);
}
