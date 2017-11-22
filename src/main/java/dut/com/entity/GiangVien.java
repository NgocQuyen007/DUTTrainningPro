package dut.com.entity;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class GiangVien {
	private int id ;
	
	@NotEmpty(message="Ten is not Empty")
	@Size(max=45, min=6, message="Ten is from 6 to 45 lettes")
	private String ten;
	
	@NotEmpty(message="NgaySinh is not Empty")
	private String ngaySinh;
	
	private boolean gioiTinh;
	
	@NotEmpty(message="Email is not Empty")
	@Size(max=45, min=6, message="Email is from 6 to 45 lettes")
	private String email;
	
	@NotEmpty(message="SDT is not Empty")
	@Size(max=20, message="SDT one have less than 20 digits")
	private String soDienThoai;
	
	@NotEmpty(message="TaiKhoan is not Empty")
	@Size(max=45, min=6, message="TaiKhoan is from 6 to 45 lettes")
	private String username;
	
	private String password;
	
	private String avatar;
	
	private HocVi hocVi;
	
	private Khoa khoa;
	
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
	public String getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public boolean isGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public HocVi getHocVi() {
		return hocVi;
	}
	public void setHocVi(HocVi hocVi) {
		this.hocVi = hocVi;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Khoa getKhoa() {
		return khoa;
	}
	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	}
	
	public GiangVien() {}
	
	public GiangVien(int id, String ten, String ngaySinh, boolean gioiTinh, String email, 
			String soDienThoai, String username, String password, HocVi hocVi, 
			String avatar, Khoa khoa) {
		this.id = id;
		this.ten = ten;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.username = username;
		this.password = password;
		this.hocVi = hocVi;
		this.avatar = avatar;
		this.khoa = khoa;
	}
	@Override
	public String toString() {
		return "GiangVien [id=" + id + ", ten=" + ten + ", ngaySinh=" + ngaySinh + ", gioiTinh=" + gioiTinh + ", email="
				+ email + ", soDienThoai=" + soDienThoai + ", username=" + username + ", password=" + password
				+ ", avatar=" + avatar + ", hocVi=" + hocVi + ", khoa=" + khoa + "]";
	}
	
	
}
