package dut.com.entity;

import java.util.ArrayList;

public class HocPhanCTDT {
	private int id;
	private int ctdtId;
	private int hocPhanId;
	private int hocKiId;
	
	private HocPhan hocPhan;
	private HocKi hocKi;
	private ArrayList<HocPhanCTDT> hocPhanCTDTList;
	
	public HocPhanCTDT() {
		super();
	}

	public HocPhanCTDT(int ctdtId, int hocPhanId, int hocKiId) {
		super();
		this.ctdtId = ctdtId;
		this.hocPhanId = hocPhanId;
		this.hocKiId = hocKiId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCtdtId() {
		return ctdtId;
	}

	public void setCtdtId(int ctdtId) {
		this.ctdtId = ctdtId;
	}

	public int getHocPhanId() {
		return hocPhanId;
	}

	public void setHocPhanId(int hocPhanId) {
		this.hocPhanId = hocPhanId;
	}

	public int getHocKiId() {
		return hocKiId;
	}

	public void setHocKiId(int hocKiId) {
		this.hocKiId = hocKiId;
	}

	public HocPhan getHocPhan() {
		return hocPhan;
	}

	public void setHocPhan(HocPhan hocPhan) {
		this.hocPhan = hocPhan;
	}

	public HocKi getHocKi() {
		return hocKi;
	}

	public void setHocKi(HocKi hocKi) {
		this.hocKi = hocKi;
	}

	public ArrayList<HocPhanCTDT> getHocPhanCTDTList() {
		return hocPhanCTDTList;
	}

	public void setHocPhanCTDTList(ArrayList<HocPhanCTDT> hocPhanCTDTList) {
		this.hocPhanCTDTList = hocPhanCTDTList;
	}

	@Override
	public String toString() {
		return "HocPhanCTDT [id=" + id + ", ctdtId=" + ctdtId + ", hocPhanId=" + hocPhanId + ", hocKiId=" + hocKiId
				+ "]";
	}
	
	
	
}
