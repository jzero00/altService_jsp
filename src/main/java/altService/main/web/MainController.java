package altService.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping("/main.do")
	public ModelAndView mainPage (ModelAndView mnv) {
		String url = "main";
		mnv.setViewName(url);
		return mnv;		
	}
}