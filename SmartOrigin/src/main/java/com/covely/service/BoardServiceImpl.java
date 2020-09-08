package com.covely.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.covely.dto.BoardAttachVO;
import com.covely.dto.BoardVO;
import com.covely.dto.Criteria;
import com.covely.mapper.BoardAttachMapper;
import com.covely.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
// BoardService는 고객이 보는 용어인데 여기에서 미리 선언을 해줘야지 @Override를 할 수가 있다.
// 각각의 list,register,modify,remove,getTotal 선언해서 인터페이스를 구현
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;

	// 상세조회
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList.......................");
//		return mapper.getList();
//	}
	
	
	// 상세조회
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long ano) {
		
		log.info("get............." + ano);
		
		return mapper.read(ano);
	}
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		
		log.info("register............." + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			log.info(board.getAno());
			
			//attach.setano(board.getano()); // ano=null이 나오는데 여기에서는 값이 들어오지 않는다.
			attachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify.................." + board);
		
		attachMapper.deleteAll(board.getAno());
		
		
		boolean modifyResult = mapper.update(board) == 1;
		log.info("modifyResult: " + modifyResult);
		
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			
			board.getAttachList().forEach(attach -> {
				
				attach.setAno(board.getAno());
				attachMapper.insertModify(attach);
				log.info("attach: " + attach);
			});
		}
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long ano) {
		
		log.info("remove.............." + ano);
		
//		attachMapper.deleteAll(ano);
		
		return mapper.delete(ano) == 1;
	}

	@Override
	public int getToal(Criteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long ano) {
		
		log.info("get Attach list by ano" + ano);
		
		return attachMapper.findByano(ano);
	}
	

	
}
