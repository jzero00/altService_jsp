package altService.sys.member.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import altService.exception.LoginFailException;
import altService.sys.member.service.MemberManageVO;
import altService.sys.member.service.MemberService;
import altService.sys.member.service.MemberVO;

@RequestMapping("/sys")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	private final String rootView = "/member/";
	private final String suffix = ".page";

	@GetMapping("/login.do")
	public ModelAndView login(ModelAndView mnv) {
		String url = rootView + "login";

		mnv.setViewName(url);
		return mnv;
	}

	@PostMapping("/login.do")
	public ModelAndView postLogin(ModelAndView mnv, MemberVO vo, HttpServletRequest req) {

		MemberVO loginUser = null;
		try {
			loginUser = mService.login(vo);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", loginUser);
			String url = rootView + "loginSuccess";
			mnv.setViewName(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (LoginFailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (loginUser != null)
			System.out.println("로그인 성공");

		return mnv;
	}

	@RequestMapping("/memberManage.do")
	public ModelAndView memberManage(ModelAndView mnv) {
		String url = "/sys" + rootView + "memberManage" + suffix;
		Map<String, Object> dataMap = null;

		try {
			dataMap = mService.getMemberManageList();
			mnv.addAllObjects(dataMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/memberRegView.do")
	public ModelAndView memberRegView(ModelAndView mnv) {
		String url = "/sys" + rootView + "memberRegView" + suffix;
		mnv.setViewName(url);
		return mnv;
	}

	@PostMapping("/memberReg.do")
	public ModelAndView memberReg(ModelAndView mnv, MemberManageVO vo) {
		Map<String, Object> paramMap = new HashMap<>();
		String url = "";
		paramMap.put("vo", vo);

		try {
			mService.registMemberManage(paramMap);
			url = "/alert";

			mnv.addObject("url", "/sys/memberManage.do");
			mnv.addObject("result", "사용자 등록 완료");
			mnv.setViewName(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mnv;
	}

	@RequestMapping("/memberDtl.do")
	public ModelAndView memberDtl(ModelAndView mnv, MemberManageVO vo) {
		String url = "/sys" + rootView + "memberRegView" + suffix;

		try {
			MemberManageVO resVO = mService.getMemberManageDetail(vo);
			mnv.addObject("vo", resVO);
			mnv.setViewName(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mnv;
	}
}