package altService.sys.menuManage.service.impl;

import java.sql.SQLException;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registMenuManage(Map<String, Object> paramMap) throws SQLException {
		MenuManageVO vo = (MenuManageVO) paramMap.get("vo");
		mMapper.insertMenuManage(vo);
	}

}
