package dut.com.entity;

public class TmpClass {
	int mucTieuHocPhanId;
	String chuanDauRa;
	
	
	
	public int getMucTieuHocPhanId() {
		return mucTieuHocPhanId;
	}



	public void setMucTieuHocPhanId(int mucTieuHocPhanId) {
		this.mucTieuHocPhanId = mucTieuHocPhanId;
	}



	public String getChuanDauRa() {
		return chuanDauRa;
	}



	public void setChuanDauRa(String chuanDauRa) {
		this.chuanDauRa = chuanDauRa;
	}


	@Override
	public String toString() {
		return "tmpClass [mucTieuHocPhanId=" + mucTieuHocPhanId + ", chuanDauRa=" + chuanDauRa + "]";
	}
}
