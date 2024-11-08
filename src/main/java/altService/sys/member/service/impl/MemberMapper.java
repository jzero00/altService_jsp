package altService.sys.member.service.impl;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import altService.sys.member.service.MemberManageVO;
import altService.sys.member.service.MemberVO;

@Repository("MemberMapper")
public interface MemberMapper {
	
	public MemberVO login(MemberVO vo) throws SQLException;

	public void insertMemberManage(MemberManageVO vo) throws SQLException;
	
}