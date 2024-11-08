package altService.sys.member.service;

public class MemberManageVO {

	private String emplyr_id;
	private String emplyr_nm;
	private String password;
	private String password_hint;
	private String password_cnsr;
	private String area_no;
	private String middle_telno;
	private String end_telno;

	public String getEmplyr_id() {
		return emplyr_id;
	}

	public void setEmplyr_id(String emplyr_id) {
		this.emplyr_id = emplyr_id;
	}

	public String getEmplyr_nm() {
		return emplyr_nm;
	}

	public void setEmplyr_nm(String emplyr_nm) {
		this.emplyr_nm = emplyr_nm;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_hint() {
		return password_hint;
	}

	public void setPassword_hint(String password_hint) {
		this.password_hint = password_hint;
	}

	public String getPassword_cnsr() {
		return password_cnsr;
	}

	public void setPassword_cnsr(String password_cnsr) {
		this.password_cnsr = password_cnsr;
	}

	public String getArea_no() {
		return area_no;
	}

	public void setArea_no(String area_no) {
		this.area_no = area_no;
	}

	public String getMiddle_telno() {
		return middle_telno;
	}

	public void setMiddle_telno(String middle_telno) {
		this.middle_telno = middle_telno;
	}

	public String getEnd_telno() {
		return end_telno;
	}

	public void setEnd_telno(String end_telno) {
		this.end_telno = end_telno;
	}
}