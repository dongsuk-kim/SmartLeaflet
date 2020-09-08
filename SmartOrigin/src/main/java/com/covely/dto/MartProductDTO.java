package com.covely.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MartProductDTO {
	
	private Long mp_no;
	private Long mno;
	private String mp_name;
	private int mp_price;
	private String mp_img;
	private String mp_origin;
	private String mp_classify;
	private String mp_expire;
	private String mname;
	
	
	private String price;
	
	private String cookieVal;
	private String type;
	
	// 합계에 대한 금액
	private String total;
	
	
	// 검색 조건이 각 글자(T,W,C)로 구성되어 있음 title,writer,content
		public String[] getTypeArr() {
			
			return type == null || type.trim().length()==0? null: type.split("");
//			return type == null || type.trim().length()==0? new String[] {}: type.split(""); // 원본코드
		}
	
}
