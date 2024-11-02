package altService.sys.menuManage.service.impl;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import altService.sys.menuManage.service.MenuManageVO;

@Repository("MenuManageMapper")
public interface MenuManageMapper {

	public void insertMenuManage(MenuManageVO vo) throws SQLException;
	
}