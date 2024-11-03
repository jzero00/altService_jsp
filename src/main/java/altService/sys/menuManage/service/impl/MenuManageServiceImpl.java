package altService.sys.menuManage.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import altService.sys.menuManage.service.MenuManageService;
import altService.sys.menuManage.service.MenuManageVO;

@Service
public class MenuManageServiceImpl implements MenuManageService {
	
	@Autowired
	private MenuManageMapper mMapper;

	@Override
	public Map<String, Object> getMenuMangeList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();
		List<MenuManageVO> menuList = null;
		
		menuList = mMapper.selectMenuList();
		
		dataMap.put("list", menuList);
		
		return dataMap;
	}

	@Override
	public void registMenuManage(Map<String, Object> paramMap) throws SQLException {
		MenuManageVO vo = (MenuManageVO) paramMap.get("vo");
		mMapper.insertMenuManage(vo);
	}

	@Override
	public List<MenuManageVO> getUpperMenuNoByMenuNm(String keyword) throws SQLException {
		List<MenuManageVO> list = null;
		list = mMapper.selectUpperMenuNoByMenuNm(keyword);
		return list;
	}

	@Override
	public Map<String, Object> getMenuManageDetail(Map<String, Object> paramMap) throws SQLException {
		Map<String,Object> dataMap = new HashMap<>();
		String menu_no = (String) paramMap.get("menu_no");
		MenuManageVO vo = null;
		
		vo = mMapper.selectMenuManageDetail(menu_no);
		
		dataMap.put("vo", vo);
		
		return dataMap;
	}

}
