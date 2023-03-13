package altService.member.web;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import altService.exception.LoginFailException;
import altService.member.service.MemberService;
import altService.member.service.MemberVO;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	private final String rootView = "/member/";
	
	@GetMapping("/login.do")
	public ModelAndView login(ModelAndView mnv) {
		String url = rootView + "login";
		
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/login.do")
	public ModelAndView postLogin(ModelAndView mnv, MemberVO vo) {
		
		MemberVO session = null;
		try {
			session = mService.login(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (LoginFailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(session != null) System.out.println("로그인 성공");
		
		return mnv;
		
	}
	
}