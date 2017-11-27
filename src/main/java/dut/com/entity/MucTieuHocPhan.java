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
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getTrinhDoNangLuc() {
		return trinhDoNangLuc;
	}

	public void setTrinhDoNangLuc(String trinhDoNangLuc) {
		this.trinhDoNangLuc = trinhDoNangLuc;
	}

	public int getDeCuongChiTietId() {
		return deCuongChiTietId;
	}

	public void setDeCuongChiTietId(int deCuongChiTietId) {
		this.deCuongChiTietId = deCuongChiTietId;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	@Override
	public String toString() {
		return "MucTieuHocPhan [id=" + id + ", ten=" + ten + ", trinhDoNangLuc=" + trinhDoNangLuc
				+ ", deCuongChiTietId=" + deCuongChiTietId + ", moTa=" + moTa + "]";
	}
	
	
	
}
