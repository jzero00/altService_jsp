package altService.member.service.impl;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import altService.member.service.MemberVO;

@Repository("MemberMapper")
public interface MemberMapper {
	
	public MemberVO login(MemberVO vo) throws SQLException;
	
}