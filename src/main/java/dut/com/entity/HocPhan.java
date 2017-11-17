package dut.com.entity;

/**
 * @author taqua
 *
 */
public class HocPhan {
	private int id;
	private String vi_name;
	private String en_name;
	private String ma_hoc_phan;
	private String loai_hoc_phan;
	private int khoi_kien_thuc_id;
	private int de_cuong_chi_tiet_id;
	private int so_tin_chi;
	
	public HocPhan() {
		super();
	}

	public HocPhan(int id, String vi_name, String en_name, String ma_hoc_phan,
			String loai_hoc_phan, int khoi_kien_thuc_id) {
		super();
		this.id = id;
		this.vi_name = vi_name;
		this.en_name = en_name;
		this.ma_hoc_phan = ma_hoc_phan;
		this.loai_hoc_phan = loai_hoc_phan;
		this.khoi_kien_thuc_id = khoi_kien_thuc_id;
	}

	public HocPhan(String vi_name, String en_name, String ma_hoc_phan,
			String loai_hoc_phan, int khoi_kien_thuc_id) {
		super();
		this.vi_name = vi_name;
		this.en_name = en_name;
		this.ma_hoc_phan = ma_hoc_phan;
		this.loai_hoc_phan = loai_hoc_phan;
		this.khoi_kien_thuc_id = khoi_kien_thuc_id;
	}

	public HocPhan(int id, String vi_name, String en_name, String ma_hoc_phan,
			String loai_hoc_phan, int khoi_kien_thuc_id,
			int de_cuong_chi_tiet_id, int so_tin_chi) {
		super();
		this.id = id;
		this.vi_name = vi_name;
		this.en_name = en_name;
		this.ma_hoc_phan = ma_hoc_phan;
		this.loai_hoc_phan = loai_hoc_phan;
		this.khoi_kien_thuc_id = khoi_kien_thuc_id;
		this.de_cuong_chi_tiet_id = de_cuong_chi_tiet_id;
		this.so_tin_chi = so_tin_chi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVi_name() {
		return vi_name;
	}

	public void setVi_name(String vi_name) {
		this.vi_name = vi_name;
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}

	public String getMa_hoc_phan() {
		return ma_hoc_phan;
	}

	public void setMa_hoc_phan(String ma_hoc_phan) {
		this.ma_hoc_phan = ma_hoc_phan;
	}

	public String getLoai_hoc_phan() {
		return loai_hoc_phan;
	}

	public void setLoai_hoc_phan(String loai_hoc_phan) {
		this.loai_hoc_phan = loai_hoc_phan;
	}

	public int getKhoi_kien_thuc_id() {
		return khoi_kien_thuc_id;
	}

	public void setKhoi_kien_thuc_id(int khoi_kien_thuc_id) {
		this.khoi_kien_thuc_id = khoi_kien_thuc_id;
	}

	public int getDe_cuong_chi_tiet_id() {
		return de_cuong_chi_tiet_id;
	}

	public void setDe_cuong_chi_tiet_id(int de_cuong_chi_tiet_id) {
		this.de_cuong_chi_tiet_id = de_cuong_chi_tiet_id;
	}

	public int getSo_tin_chi() {
		return so_tin_chi;
	}

	public void setSo_tin_chi(int so_tin_chi) {
		this.so_tin_chi = so_tin_chi;
	}

	@Override
	public String toString() {
		return "HocPhan [id=" + id + ", vi_name=" + vi_name + ", en_name="
				+ en_name + ", ma_hoc_phan=" + ma_hoc_phan + ", loai_hoc_phan="
				+ loai_hoc_phan + ", khoi_kien_thuc_id=" + khoi_kien_thuc_id
				+ "]";
	}
	
	
	
}
