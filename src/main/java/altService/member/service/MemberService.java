package altService.member.service;

import java.sql.SQLException;

import altService.exception.LoginFailException;

public interface MemberService {

	public MemberVO login(MemberVO vo) throws SQLException, LoginFailException;

}
