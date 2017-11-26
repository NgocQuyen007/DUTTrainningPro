package dut.com.entity;

import java.util.List;

public class HocPhanHocKiCTDT {
	private HocKi hocKi;
	private List<HocPhan> dsHocPhan;
	public HocPhanHocKiCTDT(HocKi hocKi, List<HocPhan> dsHocPhan) {
		super();
		this.hocKi = hocKi;
		this.dsHocPhan = dsHocPhan;
	}
	public HocKi getHocKi() {
		return hocKi;
	}
	public void setHocKi(HocKi hocKi) {
		this.hocKi = hocKi;
	}
	public List<HocPhan> getDsHocPhan() {
		return dsHocPhan;
	}
	public void setDsHocPhan(List<HocPhan> dsHocPhan) {
		this.dsHocPhan = dsHocPhan;
	}
	
}
