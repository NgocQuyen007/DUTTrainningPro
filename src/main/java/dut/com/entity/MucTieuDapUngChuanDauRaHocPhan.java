package dut.com.entity;

public class MucTieuDapUngChuanDauRaHocPhan {
	
	private int mucTieuHocPhanId;
	private int chuanDauRaHocPhanId;
	private String mucDoGiangDay;
	private int deCuongChiTietId;
	
	public MucTieuDapUngChuanDauRaHocPhan() {
		
	}
	
	public MucTieuDapUngChuanDauRaHocPhan(int id1, int id2, String str, int id3) {
		this.mucTieuHocPhanId = id1;
		this.chuanDauRaHocPhanId = id2;
		this.mucDoGiangDay = str;
		this.deCuongChiTietId = id3;
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
	public String getMucDoGiangDay() {
		return mucDoGiangDay;
	}
	public void setMucDoGiangDay(String mucDoGiangDay) {
		this.mucDoGiangDay = mucDoGiangDay;
	}
	public int getDeCuongChiTietId() {
		return deCuongChiTietId;
	}
	public void setDeCuongChiTietId(int deCuongChiTietId) {
		this.deCuongChiTietId = deCuongChiTietId;
	}

	@Override
	public String toString() {
		return "MucTieuDapUngChuanDauRaHocPhan [mucTieuHocPhanId=" + mucTieuHocPhanId + ", chuanDauRaHocPhanId="
				+ chuanDauRaHocPhanId + ", mucDoGiangDay=" + mucDoGiangDay + ", deCuongChiTietId=" + deCuongChiTietId
				+ "]";
	}
}
