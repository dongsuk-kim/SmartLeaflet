package com.covely.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.covely.domain.AuthVO;
import com.covely.domain.MemberVO;
import com.covely.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
						"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"
					 })
@Log4j
public class MemberTests {
							
		@Autowired
		PasswordEncoder pwEncoder;
		
		@Autowired
		MemberMapper mapper;
		
		@Test
		public void testReadMember() {
			
			String userid = "U90";
			
			MemberVO vo = mapper.read(userid);
			List<AuthVO> authList = mapper.readAuth(userid);
			
			log.info(vo);
			log.info(authList);
			
			vo.setAuthList(authList);
			
		}
		
		// 데이터 집어넣자
		@Test
		public void testAdd() {
			
			for(int i = 101; i <= 110; i++) {
				MemberVO vo = new MemberVO();
				vo.setUserid(("Mart"+i));
				vo.setUserpw(pwEncoder.encode("P"+i));
				vo.setUserName("마트관리자"+i);
				vo.setEnabled(true);
				log.info(mapper.addMember(vo));
				
			}
			
		}
		
		@Test
		public void testAddAuth() {
			for(int i = 90; i < 100; i++) {
				log.info(mapper.addMemberAuth("U"+i, "ROLE_ADMIN"));
			}
		}
		
		@Test
		public void testCompare() {
			
			String password = "1234";
			
			String en1 = pwEncoder.encode(password);
			
			log.info(en1);
			
			String en2 = pwEncoder.encode(password);
			
			log.info(en2);
			
			log.info(pwEncoder.matches(password, en1));
			log.info(pwEncoder.matches(password, en2));
			
			
		}

}
