package dut.com.entity;

public class HocPhan {
	
	private int id;
	private String viName;
	private String enName;
	private int maHocPhan;
	private String loaiHocPhan;
	private int khoiKienThuc;
	private int soTinChi;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getViName() {
		return this.viName;
	}
	
	public String getEnName() {
		return this.enName;
	}
	
	public void setViName(String ten) {
		this.viName = ten;
	}
	
	public void setEnName(String ten) {
		this.enName = ten;
	}
	
	public String getLoaiHocPhan() {
		return this.loaiHocPhan;
	}
	
	public void setLoaiHocPhan(String loaiHocPhan) {
		this.loaiHocPhan = loaiHocPhan;
	}
}
