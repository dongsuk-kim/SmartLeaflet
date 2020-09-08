package com.covely.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long ano;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
}
