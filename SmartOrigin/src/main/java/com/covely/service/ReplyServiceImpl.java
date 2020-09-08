package com.covely.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.covely.dto.Criteria;
import com.covely.dto.ReplyPageDTO;
import com.covely.dto.ReplyVO;
import com.covely.mapper.BoardMapper;
import com.covely.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
// 기능구현 부분
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		
		log.info("register..............." + vo);
		
		boardMapper.updateReplyCnt(vo.getAno(), 1);
		
		return mapper.insert(vo);
	}

	@Transactional
	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get............" + rno);
		
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify..............." + vo);
		
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		
		log.info("remove..............." + rno);
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getAno(), -1);
		return mapper.delete(rno);
	}

	@Transactional
	@Override
	public List<ReplyVO> getList(Criteria cri, Long ano) {
		
		log.info("get Reply List of a Board " + ano);
		
		return mapper.getListWithPaging(cri, ano);
	}

	@Transactional
	@Override
	public ReplyPageDTO getListWithPage(Criteria cri, Long ano) {
		
		return new ReplyPageDTO(mapper.getCountByano(ano), 
								mapper.getListWithPaging(cri, ano));
	}
	
	
}
