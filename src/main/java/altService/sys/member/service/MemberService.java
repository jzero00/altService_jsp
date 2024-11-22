package altService.sys.member.service;

import java.sql.SQLException;
import java.util.Map;

import altService.exception.LoginFailException;

public interface MemberService {

	public MemberVO login(MemberVO vo) throws SQLException, LoginFailException;

	public void registMemberManage(Map<String, Object> paramMap) throws SQLException;
	
	public Map<String,Object> getMemberManageList() throws SQLException;
	
	public MemberManageVO getMemberManageDetail(MemberManageVO vo) throws SQLException;

}
