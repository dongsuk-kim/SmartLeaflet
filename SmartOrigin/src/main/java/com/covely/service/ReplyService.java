package com.covely.service;

import java.util.List;

import com.covely.dto.Criteria;
import com.covely.dto.ReplyPageDTO;
import com.covely.dto.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long ano);
	
//	ReplyPageDTO를 반환하는 메서드 추가!
	public ReplyPageDTO getListWithPage(Criteria cri, Long ano);

}
