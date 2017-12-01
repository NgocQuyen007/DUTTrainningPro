package dut.com.entity;

public class ChuanDauRaCTDT {
	
	private int id;
	private String tenCDR;
	private String moTa;
	private int ctdt_id;
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTenCDR() {
		return this.tenCDR;
	}
	
	public void setTenCDR(String tenCDR) {
		this.tenCDR = tenCDR;
	}
	
	public String getMoTa() {
		return this.moTa;
	}
	
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getCtdt_id() {
		return ctdt_id;
	}

	public void setCtdt_id(int ctdt_id) {
		this.ctdt_id = ctdt_id;
	}

	@Override
	public String toString() {
		return "ChuanDauRaCTDT [id=" + id + ", tenCDR=" + tenCDR + ", moTa=" + moTa + ", ctdt_id=" + ctdt_id + "]";
	}
	
	
	
	
}
