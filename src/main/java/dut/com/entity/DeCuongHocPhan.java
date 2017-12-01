package dut.com.entity;

public class DeCuongHocPhan {
	
	private int id ;
	private int giangVienId;
	private int giangVienAssId;
	private String moTa;
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getGiangVienId() {
		return this.giangVienId;
	}
	
	public void setGiangVienId(int id) {
		this.giangVienId = id;
	}
	
	public int getGiangVienAssId() {
		return this.giangVienAssId;
	}
	
	public void setGiangVienAssId(int id) {
		this.giangVienAssId = id;
	}
	
	public String getMoTa() {
		return this.moTa;
	}
	
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
}
