package dut.com.entity;

public class MucTieuDUCTDT {
	private int mucTieuHPId;
	private int cdrCTDTId;
	
	public MucTieuDUCTDT(int id1, int id2) {
		this.mucTieuHPId = id1;
		this.cdrCTDTId = id2;
	}
	
	public int getMucTieuHPId() {
		return this.mucTieuHPId;
	}
	
	public void setMucTieuHPId(int id) {
		this.mucTieuHPId = id;
	}
	
	public int getCDRCTDTId() {
		return this.cdrCTDTId;
	}
	
	public void setCDRCTDTId(int id) {
		this.cdrCTDTId = id;
	}
	
}
