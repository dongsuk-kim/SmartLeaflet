package com.covely.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MartDTO {
	
	private Long mno;
	private String mname;
	private String madd;
	private String mtel;
	private boolean mdelivery;
	private double mlat;
	private double mlng;
	private String madmin;
	private String mlogo;
	private String mbackground;
	private String msale;
	
	private Date mstartdate;	
	private Date mlastdate;
	
	
}
