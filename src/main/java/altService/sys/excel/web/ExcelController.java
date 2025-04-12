package altService.sys.excel.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import altService.sys.member.service.MemberManageVO;
import altService.sys.member.service.MemberService;

@RequestMapping("/excel")
@Controller
public class ExcelController {
	
	@Autowired
	private MemberService mService;

	@PostMapping("/insertMember.do")
	public void insertMemberExcel(MultipartFile excelFile) throws IOException {
		/*엑셀파일 처리 */
		Workbook workbook = new HSSFWorkbook(excelFile.getInputStream());
		Sheet worksheet = workbook.getSheetAt(0);
		
		List<MemberManageVO> list = new ArrayList<>();
		
		for(int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
			MemberManageVO vo = new MemberManageVO();
			
			DataFormatter formatter = new DataFormatter();
			Row row = worksheet.getRow(i);
			
			String emplyr_id = formatter.formatCellValue(row.getCell(0));
			String user_nm = formatter.formatCellValue(row.getCell(1));
			String sexdstn_code = formatter.formatCellValue(row.getCell(2));
			String moblphon_no = formatter.formatCellValue(row.getCell(3));
//			String[] tel_no = formatter.formatCellValue(row.getCell(3)).split("-");
//			String area_no = formatter.formatCellValue(row.getCell(3)).substring(0,2);
//			String house_middle_telno = formatter.formatCellValue(row.getCell(3)).substring(4,7);
//			String house_end_telno = formatter.formatCellValue(row.getCell(3)).substring(9,12);
			String email_adres = formatter.formatCellValue(row.getCell(4));
			String zip = formatter.formatCellValue(row.getCell(5));
			String house_adres = formatter.formatCellValue(row.getCell(6));
			String detail_adres = formatter.formatCellValue(row.getCell(7));
			
			vo.setEmplyr_id(emplyr_id);
			/*비밀번호 설정 0000 암호화*/
			vo.setPassword("9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0");
			vo.setUser_nm(user_nm);
			vo.setSexdstn_code(sexdstn_code);
			vo.setMoblphon_no(moblphon_no);
//			vo.setArea_no(area_no);
//			vo.setHouse_middle_telno(house_middle_telno);
//			vo.setHouse_end_telno(house_end_telno);
			vo.setEmail_adres(email_adres);
			vo.setZip(zip);
			vo.setHouse_adres(house_adres);
			vo.setDetail_adres(detail_adres);
			
			list.add(vo);
		}
		
		/*중복체크는 service에서 처리 insert*/
		try {
			mService.registMemberManageByExcel(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}