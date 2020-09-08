package com.covely.mapper;

import java.util.List;

import com.covely.dto.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void insertModify(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByano(Long ano);
	
//	첨부파일 삭제 처리
	public void deleteAll(Long bno);
	
//	FileCheckTask DB에 등록된 모든 파일의 목록
	public List<BoardAttachVO> getOldFiles();
	
}
