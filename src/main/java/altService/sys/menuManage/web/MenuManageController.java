package altService.sys.menuManage.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import altService.sys.menuManage.service.MenuManageService;
import altService.sys.menuManage.service.MenuManageVO;

@Controller
@RequestMapping("/sys/")
public class MenuManageController {
	
	private String rootPath = "/sys/menu/";
	
	@Autowired
	private MenuManageService mService;

	@RequestMapping("menuManage.do")
	public ModelAndView menuManage(ModelAndView mnv) {
		String url = rootPath + "menuManage";
//		Map<String,Object> dataMap = null;
//		dataMap = mService.getMenuMangeList();
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("menuRegView.do")
	public ModelAndView menuManageView(ModelAndView mnv) {
		String url = rootPath + "menuManageReg";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("menuReg.do")
	public ModelAndView menuReg(ModelAndView mnv, MenuManageVO vo) {
		Map<String,Object> paramMap = new HashMap<>();
		String url = rootPath + "menuManageMessage";
		paramMap.put("vo", vo);
		try {
			mService.registMenuManage(paramMap);
			mnv.setViewName(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mnv;
	}
	
	@RequestMapping("upperMenuNoSearch.do")
	public ModelAndView upperMenuNoSearch(ModelAndView mnv) {
		String url = rootPath + "upperMenuNoSearch";
		mnv.setViewName(url);
		return mnv;
	}
}