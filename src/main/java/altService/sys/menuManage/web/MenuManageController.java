package altService.sys.menuManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import altService.sys.menuManage.service.MenuManageService;

@Controller
@RequestMapping("/sys/")
public class MenuManageController {
	
	private String rootPath = "/sys/menu/";
	
//	@Autowired
//	private MenuManageService mService;

	@RequestMapping("menuManage.do")
	public ModelAndView menuManage(ModelAndView mnv) {
		String url = rootPath + "menuManage";
//		Map<String,Object> dataMap = null;
//		dataMap = mService.getMenuMangeList();
		mnv.setViewName(url);
		return mnv;
	}
}