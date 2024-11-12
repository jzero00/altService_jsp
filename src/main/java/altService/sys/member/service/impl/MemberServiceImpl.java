package altService.sys.member.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import altService.exception.LoginFailException;
import altService.sys.member.service.MemberManageVO;
import altService.sys.member.service.MemberService;
import altService.sys.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public MemberVO login(MemberVO vo) throws SQLException, LoginFailException {
		MemberVO member = null;
		member = mMapper.login(vo);
		System.out.println(member.toString());
		
		return member;
	}

	@Override
	public void registMemberManage(Map<String, Object> paramMap) throws SQLException {
		MemberManageVO vo = (MemberManageVO) paramMap.get("vo");
		mMapper.insertMemberManage(vo);
	}

	@Override
	public Map<String, Object> getMemberManageList() throws SQLException {
		Map<String,Object> dataMap = new HashMap<>();
		List<MemberManageVO> list = null;
		
		list = mMapper.selectMemberManageList();
		
		dataMap.put("list", list);
		return dataMap;
	}

}
