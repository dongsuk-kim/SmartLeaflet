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
public class TimeMapperTests {
	
	@Autowired
	private TimeMapper time_mapper;
	
	@Test
	public void timeTest() {
		time_mapper.timeNow();
	}
		
}
