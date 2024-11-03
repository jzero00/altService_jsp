package altService.sys.menuManage.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import altService.sys.menuManage.service.MenuManageVO;

@Repository("MenuManageMapper")
public interface MenuManageMapper {

	public void insertMenuManage(MenuManageVO vo) throws SQLException;
	
	public List<MenuManageVO> selectUpperMenuNoByMenuNm(String keyword) throws SQLException;
	
	public List<MenuManageVO> selectMenuList() throws SQLException;
	
	public MenuManageVO selectMenuManageDetail(String menu_no) throws SQLException;

	public void updateMenuManage(MenuManageVO vo) throws SQLException;
	
}