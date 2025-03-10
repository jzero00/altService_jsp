package altService.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/download")
@Controller
public class UtilDownload {
	
	@RequestMapping("/memberManageExcel.do")
	public void downloadMemberManageExcel() {
		System.out.println("테스트");
	}
}