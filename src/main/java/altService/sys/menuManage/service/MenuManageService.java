package altService.sys.menuManage.service;

import java.sql.SQLException;
import java.util.Map;

public interface MenuManageService {

	public Map<String,Object> getMenuMangeList() throws SQLException;
	
	public void registMenuManage(Map<String,Object> paramMap) throws SQLException;;
	
}