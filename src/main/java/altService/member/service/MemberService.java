package altService.member.service;

import java.sql.SQLException;

public interface MemberService {

	public MemberVO login(MemberVO vo) throws SQLException;

}
