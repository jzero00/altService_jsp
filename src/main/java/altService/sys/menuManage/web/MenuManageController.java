package altService.sys.menuManage.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import altService.sys.menuManage.service.MenuManageService;
import altService.sys.menuManage.service.MenuManageVO;

@Controller
@RequestMapping("/sys/")
public class MenuManageController {
	
	private String rootPath = "/sys/menu/";
	
	@Autowired
	private MenuManageService mService;

	@SuppressWarnings("unchecked")
	@RequestMapping("menuManage.do")
	public ModelAndView menuManage(ModelAndView mnv) {
		String url = rootPath + "menuManage";
		Map<String,Object> dataMap = null;
		try {
			dataMap = mService.getMenuMangeList();
			List<MenuManageVO> list = null;
			
			list = (List<MenuManageVO>) dataMap.get("list");
			mnv.addObject("list", list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	@RequestMapping("upperMenuNoSearchView.do")
	public ModelAndView upperMenuNoSearchView(ModelAndView mnv) {
		String url = rootPath + "upperMenuNoSearch";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("upperMenuNoSearch.do")
	@ResponseBody
	public List<MenuManageVO> upperMenuNoSearch(String keyword) {
//		Map<String, Object> resMap = new HashMap<>();
		List<MenuManageVO> list = null;
		try {
			list = mService.getUpperMenuNoByMenuNm(keyword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping("menuModView.do")
	public ModelAndView menuModView(ModelAndView mnv, int menu_no) {
		String url = rootPath + "menuManageMod";
		Map<String,Object> dataMap = null;
		Map<String,Object> paramMap = new HashMap<>();
		
		try {
			dataMap = mService.getMenuManage(paramMap);
			mnv.addAllObjects(dataMap);
			mnv.setViewName(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mnv;
	}
}