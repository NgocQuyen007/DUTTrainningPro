package dut.com.entity;

public class HocVi {
	
	private int id;
	private String hocVi;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHocVi() {
		return hocVi;
	}
	public void setHocVi(String hocVi) {
		this.hocVi = hocVi;
	}
	public HocVi() {
		
	}
	
	public HocVi(int id, String hocVi) {
		super();
		this.id = id;
		this.hocVi = hocVi;
	}
}
