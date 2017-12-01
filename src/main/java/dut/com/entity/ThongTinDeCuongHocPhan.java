package dut.com.entity;

public class ThongTinDeCuongHocPhan {
	
	private int id;
	private String vi_name;
	private String en_name;
	private String ma_hoc_phan;
	
	private String ma_ctdt;
	private String ten_ctdt;
	private String loai_hoc_phan;
	
	private int so_tin_chi;
	private int so_tiet_ly_thuyet;
	private int so_tiet_thuc_hanh;
	private int so_tiet_tu_hoc;
	
	private String ma_hoc_phan_tien_quyet;
	private String ma_hoc_phan_hoc_truoc;
	private String ma_hoc_phan_song_hanh;
	
	private String ten_hoc_phan_tien_quyet;
	private String ten_hoc_phan_hoc_truoc;
	private String ten_hoc_phan_song_hanh;
	
	
	private String dieuKienKhac;
	
	private GiangVien giangVienPhuTrach;
	private GiangVien giangVienPhu;
	
	private String moTaHocPhan;
	
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
	public String getMa_ctdt() {
		return ma_ctdt;
	}
	public void setMa_ctdt(String ma_ctdt) {
		this.ma_ctdt = ma_ctdt;
	}
	public String getTen_ctdt() {
		return ten_ctdt;
	}
	public void setTen_ctdt(String ten_ctdt) {
		this.ten_ctdt = ten_ctdt;
	}
	public String getLoai_hoc_phan() {
		return loai_hoc_phan;
	}
	public void setLoai_hoc_phan(String loai_hoc_phan) {
		this.loai_hoc_phan = loai_hoc_phan;
	}
	public int getSo_tin_chi() {
		return so_tin_chi;
	}
	public void setSo_tin_chi(int so_tin_chi) {
		this.so_tin_chi = so_tin_chi;
	}
	public int getSo_tiet_ly_thuyet() {
		return so_tiet_ly_thuyet;
	}
	public void setSo_tiet_ly_thuyet(int so_tiet_ly_thuyet) {
		this.so_tiet_ly_thuyet = so_tiet_ly_thuyet;
	}
	public int getSo_tiet_thuc_hanh() {
		return so_tiet_thuc_hanh;
	}
	public void setSo_tiet_thuc_hanh(int so_tiet_thuc_hanh) {
		this.so_tiet_thuc_hanh = so_tiet_thuc_hanh;
	}
	public int getSo_tiet_tu_hoc() {
		return so_tiet_tu_hoc;
	}
	public void setSo_tiet_tu_hoc(int so_tiet_tu_hoc) {
		this.so_tiet_tu_hoc = so_tiet_tu_hoc;
	}
	public String getMa_hoc_phan_tien_quyet() {
		return ma_hoc_phan_tien_quyet;
	}
	public void setMa_hoc_phan_tien_quyet(String ma_hoc_phan_tien_quyet) {
		this.ma_hoc_phan_tien_quyet = ma_hoc_phan_tien_quyet;
	}
	public String getMa_hoc_phan_hoc_truoc() {
		return ma_hoc_phan_hoc_truoc;
	}
	public void setMa_hoc_phan_hoc_truoc(String ma_hoc_phan_hoc_truoc) {
		this.ma_hoc_phan_hoc_truoc = ma_hoc_phan_hoc_truoc;
	}
	public String getMa_hoc_phan_song_hanh() {
		return ma_hoc_phan_song_hanh;
	}
	public void setMa_hoc_phan_song_hanh(String ma_hoc_phan_song_hanh) {
		this.ma_hoc_phan_song_hanh = ma_hoc_phan_song_hanh;
	}
	public String getTen_hoc_phan_tien_quyet() {
		return ten_hoc_phan_tien_quyet;
	}
	public void setTen_hoc_phan_tien_quyet(String ten_hoc_phan_tien_quyet) {
		this.ten_hoc_phan_tien_quyet = ten_hoc_phan_tien_quyet;
	}
	public String getTen_hoc_phan_hoc_truoc() {
		return ten_hoc_phan_hoc_truoc;
	}
	public void setTen_hoc_phan_hoc_truoc(String ten_hoc_phan_hoc_truoc) {
		this.ten_hoc_phan_hoc_truoc = ten_hoc_phan_hoc_truoc;
	}
	public String getTen_hoc_phan_song_hanh() {
		return ten_hoc_phan_song_hanh;
	}
	public void setTen_hoc_phan_song_hanh(String ten_hoc_phan_song_hanh) {
		this.ten_hoc_phan_song_hanh = ten_hoc_phan_song_hanh;
	}
	public String getDieuKienKhac() {
		return dieuKienKhac;
	}
	public void setDieuKienKhac(String dieuKienKhac) {
		this.dieuKienKhac = dieuKienKhac;
	}
	public GiangVien getGiangVienPhuTrach() {
		return giangVienPhuTrach;
	}
	public void setGiangVienPhuTrach(GiangVien giangVienPhuTrach) {
		this.giangVienPhuTrach = giangVienPhuTrach;
	}
	public GiangVien getGiangVienPhu() {
		return giangVienPhu;
	}
	public void setGiangVienPhu(GiangVien giangVienPhu) {
		this.giangVienPhu = giangVienPhu;
	}
	
	// private int khoi_kien_thuc_id;
	
	public ThongTinDeCuongHocPhan() {}
	@Override
	public String toString() {
		return "ThongTinDeCuongHocPhan [id=" + id + ", vi_name=" + vi_name + ", en_name=" + en_name + ", ma_hoc_phan="
				+ ma_hoc_phan + ", ma_ctdt=" + ma_ctdt + ", ten_ctdt=" + ten_ctdt + ", loai_hoc_phan=" + loai_hoc_phan
				+ ", so_tin_chi=" + so_tin_chi + ", so_tiet_ly_thuyet=" + so_tiet_ly_thuyet + ", so_tiet_thuc_hanh="
				+ so_tiet_thuc_hanh + ", so_tiet_tu_hoc=" + so_tiet_tu_hoc + ", ma_hoc_phan_tien_quyet="
				+ ma_hoc_phan_tien_quyet + ", ma_hoc_phan_hoc_truoc=" + ma_hoc_phan_hoc_truoc
				+ ", ma_hoc_phan_song_hanh=" + ma_hoc_phan_song_hanh + ", ten_hoc_phan_tien_quyet="
				+ ten_hoc_phan_tien_quyet + ", ten_hoc_phan_hoc_truoc=" + ten_hoc_phan_hoc_truoc
				+ ", ten_hoc_phan_song_hanh=" + ten_hoc_phan_song_hanh + ", dieuKienKhac=" + dieuKienKhac
				+ ", giangVienPhuTrach=" + giangVienPhuTrach + ", giangVienPhu=" + giangVienPhu + "]";
	}
	public String getMoTaHocPhan() {
		return moTaHocPhan;
	}
	public void setMoTaHocPhan(String moTaHocPhan) {
		this.moTaHocPhan = moTaHocPhan;
	}
	
	
}
