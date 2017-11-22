package dut.com.entity;

public class MucTieuHocPhan {
	
	private int id;
	private String ten;
	private String trinhDoNangLuc;
	private int deCuongChiTietId;
	private String moTa;
	
	public MucTieuHocPhan() {
		
	}
	
	public MucTieuHocPhan(String ten, String trinhDoNangLuc, int deCuongChiTietId, String moTa) {
		this.ten = ten;
		this.trinhDoNangLuc = trinhDoNangLuc;
		this.deCuongChiTietId = deCuongChiTietId;
		this.moTa = moTa;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTen() {
		return this.ten;
	}
	
	public void setTen(String ten) {
		this.ten = ten;
	}
	
	public String getMoTa() {
		return this.moTa;
	}
	
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	public int getDCCTId() {
		return this.deCuongChiTietId;
	}
	
	public void setDCCTId(int id) {
		this.deCuongChiTietId = id;
	}
	
	public String getTDNLuc() {
		return this.trinhDoNangLuc;
	}
	
	public void setTDNLuc(String TDNLuc) {
		this.trinhDoNangLuc = TDNLuc;
	}
}
