package dut.com.entity;

public class Khoa {
	private int id;
	private String ten;
	private GiangVien giaophuKhoa;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public GiangVien getGiaophuKhoa() {
		return giaophuKhoa;
	}
	public void setGiaophuKhoa(GiangVien giaophuKhoa) {
		this.giaophuKhoa = giaophuKhoa;
	}
	
	public Khoa() {}
	public Khoa(int id, String ten, GiangVien giaophuKhoa) {
		super();
		this.id = id;
		this.ten = ten;
		this.giaophuKhoa = giaophuKhoa;
	}
}
