package com.covely.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.covely.dto.Criteria;
import com.covely.dto.LeapletDTO;
import com.covely.dto.MartDTO;
import com.covely.dto.MartProductDTO;
import com.covely.mapper.SmartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SmartServiceImpl implements SmartService {
	
	@Autowired
	private SmartMapper mapper;
	
	// productList 하는 역할: martproductDTO,mno의 파라미터의 값들이 MySQL mart테이블에 mno컬럼을 이용해 url의 주소값에 이미지를 뿌려진다. 
	@Override
	public List<MartProductDTO> productList(Criteria cri, Long mno) {
		log.info("Criteria............" + cri);
		
		cri.setMno(mno); // DB에 있는 mno를 Criteria로 셋팅해주는 코드.
		return mapper.productList(cri,mno);
	}

	
	@Override
	public List<MartDTO> martList(MartDTO martDTO, Long mno) {
		log.info("martDTO................" + martDTO);
		
		martDTO.setMno(mno); // martDTO.setMno(1L): 마트번호(mno)가 1L로 설정해주어서 mno가 1L로 나옴. 숫자를 넣어 마트별로 나올 수 있게 됬음.
		return mapper.martList(martDTO);
	}

	@Override
	public int getTotalCount(Criteria cri, Long mno) {
		log.info("getTotalCount.......................");
		
		log.info("cri............" + cri);
		log.info("mapper.............." + mapper);
		log.info("-------------------------");
		
		cri.setMno(mno);
		return mapper.getTotalCount(cri);
		
	}
	
	@Override
	public List<MartProductDTO> productDetail(Long mp_no) {
		log.info("productDetail.........................");
		log.info("mapper..........." + mapper);
		
		return mapper.productDetail(mp_no);
	}
	


	@Override
	public List<MartDTO> mapList(MartDTO martDTO) {
		log.info("mapList.........");
		
		return mapper.mapList(martDTO);
	}

//	마트별 맵 검색 DTO
	@Override
	public List<MartDTO> martSearchMap(MartDTO martDTO) {
		log.info("mapSearchMap.................");
		
		
		return mapper.martSearchMap(martDTO);
	}

	@Override
	public List<LeapletDTO> leapletList(LeapletDTO leapletDTO,Long mno) {
		log.info("leapletList...................");
		
		leapletDTO.setMno(mno);
		return mapper.leapletList(leapletDTO,mno);
	}


	@Override
	public List<MartProductDTO> getList(MartProductDTO martproductDTO) {
		log.info("getList.................");
		return mapper.getList(martproductDTO);
	}


	@Override
	public List<MartProductDTO> martCart(List cartList) {
		
		
		return mapper.martCart(cartList);
	}


	@Override
	public String totalprice(List cartList) {
		
		return mapper.totalprice(cartList);
	}

//	@Override
//	public String address(String loc) {
//		
//		String[] arr = loc.split("-");
//		String addr = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?";
//		
//		addr = addr + "x=" + arr[1] + "&y=" + arr[0];
//		
//		try {
//			URL url = new URL(addr);
//			
//			HttpURLConnection con = (HttpURLConnection)url.openConnection();
//			
//			// 인증받기
//			con.setRequestProperty("Authorization", "KaKaoAK 77889d0f01a7757dffeface0c08d54ba");
//			// 옵션을 설정
//			con.setConnectTimeout(20000);
//			con.setUseCaches(false);
//			
//			// 줄 단위 데이터 읽기
//			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			
//			// 문자열을 임시로 저장할 객체 만들기
//			StringBuilder sb = new StringBuilder();
//			
//			while(true) {
//				// 한 줄의 데이터 읽기
//				String line = br.readLine();
//				
//				// 읽은 데이터가 없으면 반복문 종료
//				if(line == null) {
//					break;
//				}
//				
//				// 읽은 데이터가 있으면 sb에 추가
//				sb.append(line);
//			}
//			
//			// 연결 해제
//			br.close();
//			
//			con.disconnect();
//			
//			// JSONObject를 생성
//			JSONObject obj = new JSONObject(sb.toString());
//			
//			JSONArray imsi = obj.getJSONArray("documents");
//			JSONObject o = imsi.getJSONObject(0);
//			String address = o.getString("address_name");
//			System.out.println(address);
//			return address;
//			
//			
//		}catch (Exception e) {
//			System.out.println("주소 가져오기 실패:" + e.getMessage());
//		}
//		return null;
//		
//	}
	
	
}
