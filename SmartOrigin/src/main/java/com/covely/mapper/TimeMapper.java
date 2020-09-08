package com.covely.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("select now()")
	public String timeNow();
}


