package dut.com.entity;

public class ChuanDauRaHocPhan {
	private int id;
	private String moTa;
	private String mucDoGiangDay;
	private String ten;
	private int deCuongChiTietId;
	
	public ChuanDauRaHocPhan() {
		
	}
	
	public ChuanDauRaHocPhan(String ten, String moTa, String mucDoGiangDay, int id) {
		this.ten = ten;
		this.moTa = moTa;
		this.mucDoGiangDay = mucDoGiangDay;
		this.deCuongChiTietId = id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getMucDoGiangDay() {
		return mucDoGiangDay;
	}
	public void setMucDoGiangDay(String mucDoGiangDay) {
		this.mucDoGiangDay = mucDoGiangDay;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public int getDeCuongChiTietId() {
		return deCuongChiTietId;
	}
	public void setDeCuongChiTietId(int deCuongChiTietId) {
		this.deCuongChiTietId = deCuongChiTietId;
	}

	@Override
	public String toString() {
		return "ChuanDauRaHocPhan [id=" + id + ", moTa=" + moTa + ", mucDoGiangDay=" + mucDoGiangDay + ", ten=" + ten
				+ ", deCuongChiTietId=" + deCuongChiTietId + "]";
	}
	
}
