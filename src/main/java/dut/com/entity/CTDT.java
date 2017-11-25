package dut.com.entity;

public class CTDT {
	private int id;
	private String ten;
	
	private int nienKhoaId;
	private int khoaId;
	private int loaiId;
	public CTDT(String ten, int nienKhoaId, int khoaId, int loaiId) {
		super();
		this.ten = ten;
		this.nienKhoaId = nienKhoaId;
		this.khoaId = khoaId;
		this.loaiId = loaiId;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public int getNienKhoaId() {
		return nienKhoaId;
	}
	public void setNienKhoaId(int nienKhoaId) {
		this.nienKhoaId = nienKhoaId;
	}
	public int getKhoaId() {
		return khoaId;
	}
	public void setKhoaId(int khoaId) {
		this.khoaId = khoaId;
	}
	public int getLoaiId() {
		return loaiId;
	}
	public void setLoaiId(int loaiId) {
		this.loaiId = loaiId;
	}
	@Override
	public String toString() {
		return "CTDT [id=" + id + ", nienKhoaId=" + nienKhoaId + ", khoaId=" + khoaId + ", loaiId=" + loaiId + "]";
	}
	
	
}
