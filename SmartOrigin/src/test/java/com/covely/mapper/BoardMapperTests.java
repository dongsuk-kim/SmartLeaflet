package com.covely.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.covely.dto.BoardVO;
import com.covely.dto.Criteria;
import com.covely.dto.MartProductDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
						})
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testInsert() {
//		
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 ");
//		board.setContent("새로 작성하는 내용");
//		board.setAd_writer("newbie");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//		
//	}
	
//	@Test
//	public void testInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setAd_writer("newbie");
//		
//		mapper.insertSelectKey(board);
//		
//		log.info(board);
//		
//	}
	
	@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(2L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(2L));
	}
	
	@Test
	public void testinsert() {
		BoardVO board = new BoardVO();
		// 실행전 존재하는 번호인지 확인할 것
		
		for(int i=1; i<=100;i++) {
			board.setAno(0L);
			board.setEnd_date("2020-07-22");
			board.setStart_date("2020-07-15");
			if(i%7==1) {
				board.setMname("웰빙마트");
				board.setAd_writer("웰빙관리자");
			}else if(i%7==2) {
				board.setMname("곰식자재마트");
				board.setAd_writer("곰관리자");
			}else if(i%7==3) {
				board.setMname("모닝식자재마트");
				board.setAd_writer("모닝관리자");
			}else if(i%7==4) {				
				board.setMname("고양하나로마트");
				board.setAd_writer("고양관리자");
			}else if(i%7==5) {
				board.setMname("오렌지식자재마트");
				board.setAd_writer("오렌지관리자");
			}else if(i%7==6) {
				board.setMname("동북식자재마트");
				board.setAd_writer("동북관리자");
			}else {
				board.setMname("현대코아식자재마트");
				board.setAd_writer("현대관리자");
			}
			board.setLno(i);
			mapper.insert(board);
		}
		
		
		
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board.getAno()));
		
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("TC");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
		
	}
	
	
//	@Test
//	public void testSearchMart() {
//		MartProductDTO martproductDTO = new MartProductDTO();
//		martproductDTO.setK("새로");
//		cri.setType("TC");
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//		
//	}
	
	
	
	
	
}
