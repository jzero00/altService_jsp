package altService.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/download")
@Controller
public class UtilDownload {
	
	@GetMapping("/memberManageExcel.do")
	public void downloadMemberManageExcel(HttpServletResponse response) throws IOException {
		Workbook workbook = new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("사용자 등록 명단");
		int rowNo = 0;
		
		CellStyle cellStyle = workbook.createCellStyle();
		
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setWrapText(true);
		
		Row headerRow = sheet.createRow(rowNo++);
		headerRow.createCell(0).setCellValue("ID");
		headerRow.createCell(1).setCellValue("이름");
		headerRow.createCell(2).setCellValue("성별");
		headerRow.createCell(3).setCellValue("전화번호");
		headerRow.createCell(4).setCellValue("이메일주소");
		headerRow.createCell(5).setCellValue("우편번호");
		headerRow.createCell(6).setCellValue("주소");
		headerRow.createCell(7).setCellValue("상세주소");
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=registUser.xls");
		
		workbook.write(response.getOutputStream());
        workbook.close();
	}
}