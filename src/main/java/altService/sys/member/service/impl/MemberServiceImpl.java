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
import altService.utils.PageMaker;
import altService.utils.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public MemberManageVO login(MemberVO vo) throws SQLException, LoginFailException {
		MemberManageVO member = null;
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
	public Map<String, Object> getMemberManageList(SearchCriteria cri) throws SQLException {
		Map<String,Object> dataMap = new HashMap<>();
		List<MemberManageVO> list = null;
		int totalCount = 0;
		
		list = mMapper.selectMemberManageList(cri);
		totalCount = mMapper.selectMemberManageListCnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("list", list);
		dataMap.put("cri", cri);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public MemberManageVO getMemberManageDetail(MemberManageVO vo) throws SQLException {
		MemberManageVO resVO = null;
		resVO = mMapper.selectMemberManageDetail(vo);
		return resVO;
	}

	@Override
	public void deleteMemberManage(String ids) throws SQLException {
		String id = "";
		String[] idArray = ids.split(",");
		for(int i = 0; i < idArray.length; i++) {
			id = idArray[i];
			mMapper.deleteMemberManage(id);
		}
	}

	@Override
	public boolean getMemeberDupleCheck(String id) throws SQLException {
		boolean flag = false;
		int count = mMapper.selectCheckDupleId(id);
		if(count == 0) flag = true;
		return flag;
	}

	@Override
	public void modifyMemberManage(Map<String, Object> paramMap) throws SQLException {
		MemberManageVO vo = (MemberManageVO) paramMap.get("vo");
		mMapper.updateMemberManage(vo);
	}

	@Override
	public void registMemberManageByExcel(List<MemberManageVO> list) throws SQLException {
		for(int i = 0; i < list.size(); i++) {
			String id = list.get(i).getEmplyr_id();
			int count = mMapper.selectCheckDupleId(id);
			
			if(id != "" && count == 0) {
				mMapper.insertMemberManage(list.get(i));
			}
		}
		/*for(MemberManageVO vo : list) {
			String id = vo.getEmplyr_id();
			System.out.println(id);
			중복체크후 insert
			int count = mMapper.selectCheckDupleId(id);
			if(vo.getEmplyr_id() != "" && count == 0) {
				mMapper.insertMemberManage(vo);
			}
		}*/
	}
}
