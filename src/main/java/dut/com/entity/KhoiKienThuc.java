package dut.com.entity;

public class KhoiKienThuc {
	
	private int id;
	private String ten;
		
	public KhoiKienThuc() {
		super();
	}
	
	public KhoiKienThuc(int id, String ten) {
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

	@Override
	public String toString() {
		return "khoi_kien_thuc [id=" + id + ", ten=" + ten + "]";
	}
	
	
	
}
