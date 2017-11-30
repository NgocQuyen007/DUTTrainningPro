package dut.com.entity;

import java.util.List;

public class CTDT {
	private int id;
	private String ten;
	
	private String nienKhoa;
	private int khoaId;
	private int loaiId;
	private Khoa khoa;
	private LoaiCTDT loai;

	private List<HocPhanCTDT> hocPhanCTDTList;
	
	private List<HocPhanHocKiCTDT> hocPhanHocKiCTDTs;
	
	public int getTongSoTinChi(){
		int sum = 0;
		if (hocPhanHocKiCTDTs != null) {
			for (HocPhanHocKiCTDT hocPhanHocKiCTDT : hocPhanHocKiCTDTs) {
				for (HocPhan hp : hocPhanHocKiCTDT.getDsHocPhan()) {
					sum += hp.getSo_tin_chi();
				}
			}
		}
		return sum;
	}
	
	public List<HocPhanHocKiCTDT> getHocPhanHocKiCTDTs() {
		return hocPhanHocKiCTDTs;
	}
	public void setHocPhanHocKiCTDTs(List<HocPhanHocKiCTDT> hocPhanHocKiCTDTs) {
		this.hocPhanHocKiCTDTs = hocPhanHocKiCTDTs;
	}
	public List<HocPhanCTDT> getHocPhanCTDTList() {
		return hocPhanCTDTList;
	}
	public void setHocPhanCTDTList(List<HocPhanCTDT> hocPhanCTDTList) {
		this.hocPhanCTDTList = hocPhanCTDTList;
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
	public String getNienKhoa() {
		return nienKhoa;
	}
	public void setNienKhoa(String nienKhoa) {
		this.nienKhoa = nienKhoa;
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
	public CTDT(String ten, String nienKhoa, int khoaId, int loaiId) {
		super();
		this.ten = ten;
		this.nienKhoa = nienKhoa;
		this.khoaId = khoaId;
		this.loaiId = loaiId;
	}
	
	
	public CTDT(int id, String ten, String nienKhoa, int khoaId, int loaiId) {
		super();
		this.id = id;
		this.ten = ten;
		this.nienKhoa = nienKhoa;
		this.khoaId = khoaId;
		this.loaiId = loaiId;
	}
	public CTDT() {
		super();
	}
	
	public Khoa getKhoa() {
		return khoa;
	}
	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	} 
	
	public LoaiCTDT getLoai() {
		return loai;
	}
	public void setLoai(LoaiCTDT loai) {
		this.loai = loai;
	}
	@Override
	public String toString() {
		return "CTDT [id=" + id + ", ten=" + ten + ", nienKhoa=" + nienKhoa + ", khoaId=" + khoaId + ", loaiId="
				+ loaiId + "]";
	}
	
	
}
