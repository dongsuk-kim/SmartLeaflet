package com.covely.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.covely.dto.Criteria;
import com.covely.dto.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
						})
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = {96396L, 96365L,96394L,96393L, 96393L};
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	// 여기서 jUnit으로 테스트하면 MySQL에 select * from cov_reply;를 실행주면 값 10개가 들어가진 것을 확인할 수 있다.
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			// 게시물의 번호
			vo.setAno(bnoArr[i%5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}	
	
	@Test
	public void testRead() {
		
		Long targetRno = 1L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 1L;
		
		mapper.delete(targetRno);
	}
	
	
	@Test
	public void testUpdate() {
		Long targetRno = 42L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
		
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		//96396
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	// 96396번에 대한 게시글 1페이지에 10개의 글이 보여지게 하게 테스트함 
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		//
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 96396L);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	
	

}
