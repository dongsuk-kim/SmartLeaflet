package com.covely.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covely.dto.Criteria;
import com.covely.dto.LeapletDTO;
import com.covely.dto.MartDTO;
import com.covely.dto.MartProductDTO;
import com.covely.dto.PageDTO;
import com.covely.service.SmartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/smart")
@AllArgsConstructor
@Log4j
public class MartController {
	
	@Autowired
	private SmartService service;
	
	@GetMapping(value = "/{mno}") // PathVariable을 이용해서 url를 지정
	public String mart(@ModelAttribute("martproductDTO") MartProductDTO martproductDTO, 
					   @ModelAttribute("martDTO") MartDTO martDTO,
					   @ModelAttribute("leapletDTO") LeapletDTO leapletDTO,
					   @PathVariable("mno") Long mno, Criteria cri, Model model) {
		
		log.info("martproductDTO: " + service.martList(martDTO, mno));
		log.info("mart1-------------------------------------------" + cri);
		log.info(cri); // cri 값 들어가는 것 확인!(페이징처리 부분)
		
		int total = service.getTotalCount(cri,mno);
		
		log.info("total : " + total);		
		
		model.addAttribute("list", service.productList(cri, mno));
		model.addAttribute("martlist", service.martList(martDTO, mno));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		model.addAttribute("leapletList", service.leapletList(leapletDTO,mno));
		model.addAttribute("getList", service.getList(martproductDTO));
		
		return "/smart/paper";
		
	}

	@GetMapping("/detail")
	public void detail(@ModelAttribute("mp_no") Long mp_no, 
					   @ModelAttribute("martDTO") MartDTO martDTO, Long mno, Model model) {
		log.info("detail............................." + service.productDetail(mp_no));
		log.info("service.martList(martDTO, mno).................." + service.martList(martDTO, mno));
		
		model.addAttribute("detail", service.productDetail(mp_no));
		model.addAttribute("martlist", service.martList(martDTO, mno));
		
	}
	
//	 map 연결
	@GetMapping("/map")
	public void map() {
		log.info("map.....................");
		
	}
	
	
	@GetMapping("/intro")
	public void json() {
		log.info("intro.....................");
		
	}
	
	@GetMapping("/temp")
	public void temp() {
		log.info("temp.............................");
		
	}
	
	
	
	
	@GetMapping("/temp100")
	public void temp100() {
		log.info("temp100.............................");
		
	}
	
	@GetMapping("/popup")
	public void popup() {
		log.info("popup");
	}
	
	@GetMapping("/autoslide")
	public void autoslide() {
		log.info("autoslide................................");
	}
	
	   @ResponseBody
	   @GetMapping(value = "/mapAction", produces = MediaType.APPLICATION_JSON_VALUE)
	   public ResponseEntity<List<MartDTO>> martMap(MartDTO martDTO) {
//	      log.info("mno======" + martDTO.getMno());
//	      log.info("LongMno===="+mno);
	      List<MartDTO> list = service.martSearchMap(martDTO);
//	      req.getParameter("mno");
//	      log.info("reqMno="+req.getParameter("mno"));
	      log.info("list====" + list);
	      
	      
	      return new ResponseEntity<>(list, HttpStatus.OK);
	   
	   }
	   
//	   ajax 연결
	   @ResponseBody
	   @GetMapping(value= "/searchAction", produces = MediaType.APPLICATION_JSON_VALUE)
	   public ResponseEntity<List<MartProductDTO>> 
	   		martSearch(@ModelAttribute("martproductDTO") MartProductDTO martproductDTO,
	   				   @ModelAttribute("martDTO") MartDTO martDTO, Model model) {
		   
		   List<MartProductDTO> list_search = service.getList(martproductDTO);
		   log.info("list=========" + list_search);
		   
		   return new ResponseEntity<>(list_search, HttpStatus.OK);
	   }
	   
	
	// @PathVariable을 이용해서 url주소에 /1,/2,/3을 입력해도 주소만 바뀌게함(값은 그대로)
//	@GetMapping(value = "/{mno}")
//	public String mart(@ModelAttribute("martproductDTO") MartProductDTO martproductDTO, 
//					  @ModelAttribute("martDTO") MartDTO martDTO, Model model,
//					  @PathVariable("mno") Long mno) {
//		log.info("martproductDTO: " + service.getList(martDTO));
//		
//		log.info("mart1-------------------------------------------");
//		model.addAttribute("list", service.productList(martproductDTO, mno));
//		model.addAttribute("martlist", service.martList(martDTO, mno));
//
//		return "/smart/paper";
//		
//	}
  
	 // 쿠키로 장바구니 구현. 
	 // 장바구니 데이터 넘기는 부분 
	  @GetMapping("/cart")
	  public List<MartProductDTO> cart
	  		 (@CookieValue("cart") String cookieVal, 
			  @ModelAttribute("martproductDTO")MartProductDTO martproductDTO,
			  Model model) {
		 
		  
		  log.info("==============================");
		  log.info("cookieVal: "+cookieVal);
		  log.info(cookieVal.split("/"));
		  
		  String cartStr= "";
		  
		  //만약 martproductDTO의 값이 널이 아니라면 cartStr에 카트값을 넣어줌
//		  if(martproductDTO.getCookieVal()!=null) {
//			  
//			  cartStr = martproductDTO.getCookieVal();
//		  
//			  log.info(cartStr);
//		  }
//		  if(mpDTO.getParameter("cookieVal")!=null) {
//			  cartStr=mpDTO.getParameter("cookieVal");
//			  log.info("cartStr=="+cartStr);
//		  }
		  
		  List<String> cartList = Arrays.stream(cookieVal.split("/")).collect(Collectors.toList());
		  
		  // 로그로 cartList에 값이 들어가있는지 확인.
		  log.info("cartList==="+cartList);
		  
		  // cart 객체에 cartList 값 불러오고 저장.
		  List<MartProductDTO> cart = service.martCart(cartList);
		  model.addAttribute("cart",  cart);
		  model.addAttribute("total", service.totalprice(cartList)); // total 관련 model.addAttribute()를 적용
		  
//		  List<MartProductDTO> cart=service.martCart(cartList);
		  log.info("========"+cart);
		  
		  return service.martCart(cartList);
	  }
	

	
//	   @ResponseBody
//	   @GetMapping(value="/cart", produces=MediaType.APPLICATION_JSON_VALUE)
//	  
//	   public ResponseEntity<List<MartProductDTO>> 
//	   	cart(MartProductDTO martproductDTO, Model model) {
//			 
//			  String cartStr= "";
//			  log.info("martproductDTO.getCookieVal()="+martproductDTO.getCookieVal());
//			  //만약 martproductDTO의 값이 널이 아니라면 cartStr에 카트값을 넣어줌
//			  if(martproductDTO.getCookieVal()!=null) {
//			  cartStr=martproductDTO.getCookieVal();
//			  log.info("cartSTr===="+cartStr);
//			  }
//
//			  ArrayList<String> cartList = new ArrayList<>(Arrays.asList(cartStr.split("/")));
//			 
//			  List<MartProductDTO> list = service.martCart(cartList);
//			  log.info("==cart=="+service.martCart(cartList));
//			  log.info("cartList======="+list);
//			  
//			  return new ResponseEntity<>(list, HttpStatus.OK);
//			 
//		  }
	   

}