package altService.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import altService.sys.member.service.MemberService;

@Controller
@RequestMapping("/excel/")
public class ExcelController {
	
	@Autowired
	MemberService mService;

	@PostMapping("insertMember.do")
	public void insertMemberExcel(MultipartFile file) {
		/*엑셀파일 처리 후 중복체크해서 중복 아닐시 insert*/
	}
}