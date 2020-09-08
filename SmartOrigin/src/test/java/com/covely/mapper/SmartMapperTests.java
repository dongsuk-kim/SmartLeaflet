package com.covely.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.covely.dto.MartProductDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SmartMapperTests {
	
	@Autowired
	private SmartMapper mapper;
	
	@Test
	public void testMart() {
		log.info(mapper);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@Test
//	public void insertDummies() {
//		LeapletProductDTO martproductDTO = new LeapletProductDTO();
//		
//		for(int i = 1; i <= 50; i++) {
//			martproductDTO.setMp_name("상품이름"+i);
////			martproductDTO.setMp_price("1000");
////			martproductDTO.setMp_img("/resources/img/industrial/p"+(i % 13)+".jpg");
////			martproductDTO.setMp_img("/resources/img/fruit/p"+(i % 13)+".jpg");
////			martproductDTO.setMp_img("/resources/img/vegetable/p"+(i % 13)+".jpg");
//			martproductDTO.setMp_img("/resources/img/meat/p"+(i % 13)+".jpg");
//			martproductDTO.setMp_origin("원산지");
//			martproductDTO.setMno((long) (i%3)+1);
//			
//			mapper.insert(martproductDTO);
//			
//		}
//	}
//	
//	@Test
//	public void insertDummies2() {
//		LeapletProductDTO leapletproductDTO = new LeapletProductDTO();
//		
//		int count = 0;
//		for(int i = 1; i<=50; i++) {
//			leapletproductDTO.setLno((long) i);
//			leapletproductDTO.setLprice(4000);
//			leapletproductDTO.setLp_img("/resources/img/industrial/t" + (i % 10)+".jpg");
//			leapletproductDTO.setLcategory("상품분류");
//			leapletproductDTO.setLspecial("특가" + i);
//			
//			count = mapper.insert2(leapletproductDTO);
//			log.info(count);
//			
//		}
//		
//		
//	}

}
