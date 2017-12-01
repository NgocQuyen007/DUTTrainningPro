package dut.com.entity;

public class MucTieuDapUngChuanDauRaHocPhan {
	private int mucTieuHocPhanId;
	private int chuanDauRaHocPhanId;
	
	public MucTieuDapUngChuanDauRaHocPhan(int id1, int id2) {
		this.mucTieuHocPhanId = id1;
		this.chuanDauRaHocPhanId = id2;
	}
	
	public int getMucTieuHocPhanId() {
		return mucTieuHocPhanId;
	}
	public void setMucTieuHocPhanId(int mucTieuHocPhanId) {
		this.mucTieuHocPhanId = mucTieuHocPhanId;
	}
	public int getChuanDauRaHocPhanId() {
		return chuanDauRaHocPhanId;
	}
	public void setChuanDauRaHocPhanId(int chuanDauRaHocPhanId) {
		this.chuanDauRaHocPhanId = chuanDauRaHocPhanId;
	}
}
