package com.covely.dto;

import lombok.ToString;

import lombok.Getter;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		// 임시로 마지막 번호 7 -> 0.7 -> 1.0 => 10
		// tempEnd는 무조건 10페이지씩 나오는 것.
		// 끝페이지 구하는 것
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		// start가 시작점을 말하고.
		// 마지막에 구해져서 9를 빼면 시작페이지가 된다.
		this.startPage = this.endPage  - 9;
		
		// 101/10 = 10.1
		// realEnd는 실제 토탈크기
		// Math.ceil():0.7이면 1로 올림해주는 속성
//		int realEnd = (int) (Math.ceil(total / (double)cri.getAmount()));
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage ) {
			this.endPage = realEnd;
		}
		
//		this.prev = startPage != 1; // 이전 페이지가 시작했을때 1이 아니면
		this.prev = this.startPage > 1;
		
		this.next = this.endPage  < realEnd;
		
		if(total <= 0 ) {
			return;
		}
		
	}
	
}
