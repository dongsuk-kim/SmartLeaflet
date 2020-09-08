package com.covely.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long ano;
	private int lno;
	private String mname,ad_writer,start_date,end_date;

	
	private Date regdate;
	private Date moddate;
	// SQL에서는 대,소문자 구분이 없이 가능하다.
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
	
}
