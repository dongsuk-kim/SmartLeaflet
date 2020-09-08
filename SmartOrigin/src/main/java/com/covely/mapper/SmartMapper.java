package com.covely.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.covely.dto.Criteria;
import com.covely.dto.LeapletDTO;
import com.covely.dto.MartDTO;
import com.covely.dto.MartProductDTO;

public interface SmartMapper {
	
//	public List<MartProductDTO> productList(@Param("martproductDTO") MartProductDTO martproductDTO, @Param("mno") Long mno);
	
	public List<MartProductDTO> productList(@Param("cri")Criteria cri, @Param("mno")Long mno);
	
	public List<MartProductDTO> getList(MartProductDTO martproductDTO);
	
	public List<MartDTO> martList ( MartDTO martDTO);
	
	// 테스트용
//	public int insert(LeapletProductDTO martproductDTO);
	
	public int getTotalCount(Criteria cri);
	
	public List<MartProductDTO> productDetail(Long mp_no);
	
	public List<MartDTO> mapList (MartDTO martDTO);
	
	
	public List<LeapletDTO> leapletList(@Param("leapletDTO")LeapletDTO leapletDTO, @Param("mno")Long mno);
	
	// 맵 관련 검색부분
	public List<MartDTO> martSearchMap(MartDTO martDTO);
	
	//장바구니
	public List<MartProductDTO> martCart(List arrayList);
	
	//total합계금액
	public String totalprice(List arrayList);
	
}
