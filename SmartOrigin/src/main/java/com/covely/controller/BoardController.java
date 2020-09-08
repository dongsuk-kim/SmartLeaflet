package com.covely.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.covely.dto.BoardAttachVO;
import com.covely.dto.BoardVO;
import com.covely.dto.Criteria;
import com.covely.dto.PageDTO;
import com.covely.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j

public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long ano) {
		
		log.info("getAttachList " + ano);
		
		return new ResponseEntity<>(service.getAttachList(ano), HttpStatus.OK);
		
	}
	
	@GetMapping("/list") 			
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getToal(cri);
		
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		model.addAttribute("board", service.getList(cri));
		
	}
	
	// GET 방식
	@GetMapping("/register")
	public void register() {
		log.info("register get........................");
	}
	
	
	// POST 방식
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("=========================================");
		log.info("board: "+ board);
		log.info("register: " + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("=========================================");
		
		service.register(board); // 수집한 파라미터 객체를 insert함
		
		rttr.addFlashAttribute("result", "success"); // 모달창 작업 
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/read")
	public void getRead(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get");
		model.addAttribute("board", service.get(ano)); // 타입을 맞게 설정해야줘야 함.
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify: " + board);
		log.info("cri : "+ cri.getPageNum());
		log.info("cri : "+ cri.getAmount());
		log.info("cri : "+ cri.getKeyword());
		log.info("cri : "+ cri.getType());
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "modify"); // 모달창 부분
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
//		type,keyword 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + ano);
		
		List<BoardAttachVO> attachList = service.getAttachList(ano);
		
		if(service.remove(ano)) {
			// delete Attach Files
			deleteFiles(attachList);
			
//			rttr.addFlashAttribute("result", "remove"); 아래로 변경함
			rttr.addFlashAttribute("result", "success"); 
		}
		
		rttr.addFlashAttribute("result", "remove"); // 모달창 부분
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
//		type,keyword 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list"; 
//		return "redirect:/board/list" + cri.getListLink(); // cri.getListLink(): 이 코드를 넣었기 때문에 타입에서 두번이나 발생이 되었고 ,로 나오게되서 에러가 발생되었다. 
		
	}
	@GetMapping("/center")
	public void  center() {
		log.info("login.......");
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		log.info("-------------------------"); // Teacher
		log.info(cri);
		log.info("========================"); // Teacher
		model.addAttribute("board", service.get(ano));
		
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+ attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
				
			}catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} //end catch
		}); //end foreachd
		
	}
	
	
	
	
	
}
