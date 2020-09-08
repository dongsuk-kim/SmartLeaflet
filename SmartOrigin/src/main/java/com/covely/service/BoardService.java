package com.covely.service;

import java.util.List;

import com.covely.dto.BoardAttachVO;
import com.covely.dto.BoardVO;
import com.covely.dto.Criteria;

// 고객부분
public interface BoardService {

	 // public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	public BoardVO get(Long ano);
	
	public void register(BoardVO board);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long ano);
	
	public int getToal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long ano);
}
