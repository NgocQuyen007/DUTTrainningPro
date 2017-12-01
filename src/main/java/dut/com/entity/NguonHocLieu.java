package dut.com.entity;

public class NguonHocLieu {
	private int id;
	private String tenHocLieu;
	private int deCuongChiTietId;
	private int loaiHocLieuId;
	
	public NguonHocLieu() {
		
		
	}
	
	public NguonHocLieu(String tenHocLieu, int id, int lhlId) {
		this.tenHocLieu = tenHocLieu;
		this.deCuongChiTietId = id;
		this.loaiHocLieuId = lhlId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenHocLieu() {
		return tenHocLieu;
	}
	public void setTenHocLieu(String tenHocLieu) {
		this.tenHocLieu = tenHocLieu;
	}
	public int getDeCuongChiTietId() {
		return deCuongChiTietId;
	}
	public void setDeCuongChiTietId(int deCuongChiTietId) {
		this.deCuongChiTietId = deCuongChiTietId;
	}
	public int getLoaiHocLieuId() {
		return loaiHocLieuId;
	}
	public void setLoaiHocLieuId(int loaiHocLieuId) {
		this.loaiHocLieuId = loaiHocLieuId;
	}
}
