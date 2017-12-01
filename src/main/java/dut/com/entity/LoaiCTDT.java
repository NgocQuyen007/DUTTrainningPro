package dut.com.entity;

public class LoaiCTDT {
	private int id;
	private String ten;
	
	public LoaiCTDT() {
		
	}

	public LoaiCTDT(String ten) {
		super();
		this.ten = ten;
	}
	
	public LoaiCTDT(int id, String ten) {
		super();
		this.id = id;
		this.ten = ten;
	}

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
	
	
	

}
