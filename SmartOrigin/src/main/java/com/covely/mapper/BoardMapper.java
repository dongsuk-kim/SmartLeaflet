package com.covely.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.covely.dto.BoardVO;
import com.covely.dto.Criteria;

// 쿼리작성 메서드를 만들어줌
public interface BoardMapper {
	
	@Select("select now()")
	String getTime();
	
	//@Select("select * from cov_board where ano > 0 order by ano desc")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public BoardVO read(Long ano);
	
	public int insert(BoardVO board);
	
	void insertSelectKey(BoardVO board);
	
	public int delete(Long ano);
	
	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("ano") Long ano, @Param("amount") int amount);
	
	
	
}
