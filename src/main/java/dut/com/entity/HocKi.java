package dut.com.entity;

public class HocKi {
	private int id;
	private String ten;
	
	public HocKi(){}
	
	public HocKi(int id, String ten) {
		super();
		this.id = id;
		this.ten = ten;
	}
	public HocKi(String ten) {
		super();
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
		return "HocKi [id=" + id + ", ten=" + ten + "]";
	}
	
}
