package com.covely.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	private Long mno;
	private Long lp_no;
	
	
	public Criteria() {
		this(1,12);
	}
	
	public Criteria(Integer pageNum, Integer amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public int getSkip() {
		return (pageNum -1) * amount; 
	}
	
//	검색 조건 각 해당 글자(meat,fruit,vegetable,dairy,industrial,aquatic)로 구성되어있음.
	public String[] getTypeArr() {
		
//		System.out.println("type= " + type);
//		System.out.println("=======================================");
		
		return type == null || type.trim().length()==0 ? null: type.split("");
	}
	
//  리스트 링크 연결부분	
//	public String getListLink() {
//		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//				.queryParam("pageNum", this.pageNum)
//				.queryParam("amount", this.getAmount())
//				.queryParam("type", this.getType())
//				.queryParam("keyword", this.getKeyword());
//		
//			return builder.toUriString();
//	}
	
}
