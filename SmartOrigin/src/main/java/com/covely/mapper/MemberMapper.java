package com.covely.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.covely.domain.AuthVO;
import com.covely.domain.MemberVO;

public interface MemberMapper {
	
	@Insert("insert into tbl_member (userid,userpw,username) values (#{userid},#{userpw},#{userName} )")
	int addMember(MemberVO member);
	
	
	@Insert("insert into tbl_member_auth (userid,auth) values (#{userid},#{auth} )")
	int addMemberAuth(@Param("userid") String userid, @Param("auth") String auth);
	
	
	@Select("select * from tbl_member where userid = #{userid}")
	MemberVO read(String userid);
	
	@Select("select * from tbl_member_auth where userid = #{userid}")
	List<AuthVO> readAuth(String userid);
	
	
}
