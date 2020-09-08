package com.covely.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.covely.dto.Criteria;
import com.covely.dto.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long ano);
	
	public int delete(Long ano);
	
	public int update(ReplyVO reply);
	
	// 댓글들을 페이징 처리하기 위해 해당 게시물의 전체 댓글의 숫자를 파악해서 화면에 보여줌.
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("ano") Long ano);

	
	public int getCountByano(Long ano);
	
}
