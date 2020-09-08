package com.covely.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LeapletDTO {
	
	private Long lno,mno;
	private String lmartlogo;
	private Date startdate;
	private Date lastdate;
	private String lstatus;
	
}
