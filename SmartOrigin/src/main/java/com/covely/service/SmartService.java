package com.covely.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.covely.dto.Criteria;
import com.covely.dto.LeapletDTO;
import com.covely.dto.MartDTO;
import com.covely.dto.MartProductDTO;

public interface SmartService {
	
	public List<MartProductDTO> productList(Criteria cri, Long mno);
	
	public List<MartProductDTO> getList(MartProductDTO martproductDTO);
	
	public List<MartDTO> martList (MartDTO martDTO, Long mno);
	
	public int getTotalCount(Criteria cri, Long mno);
	
	public List<MartProductDTO> productDetail(Long mp_no);
	
	public List<MartDTO> mapList (MartDTO martDTO);
	
	public List<LeapletDTO> leapletList(LeapletDTO leapletDTO, Long mno);
	
	
	// 맵 관련 검색부분
	public List<MartDTO> martSearchMap(MartDTO martDTO);
	//장바구니
	public List<MartProductDTO> martCart(List cartList);
//	public String address(String loc);
	//합계금액
	public String totalprice(List cartList);

}
