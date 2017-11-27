package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.GiangVienRowMapper;
import dut.com.entity.GiangVien;
import dut.com.libs.LibDate;
import dut.com.libs.LibString;

@Repository
public class GiangVienDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<GiangVien> getItems(){
		String sql  = " SELECT gv.*, k.id idkhoa, k.ten tenkhoa, hv.hoc_vi tenHocVi "
					+ " FROM giang_vien gv"
					+ " JOIN khoa k    ON gv.khoa_id = k.id"
					+ " JOIN hoc_vi hv ON gv.hocvi_id = hv.id"
					+ " ORDER BY k.ten ASC";
		return jdbcTemplate.query(sql, new GiangVienRowMapper());
	}
	public List<GiangVien> getItems(int idKhoa){
		String sql  = " SELECT gv.*, k.id idkhoa, k.ten tenkhoa, hv.hoc_vi tenHocVi "
					+ " FROM giang_vien gv"
					+ " JOIN khoa k    ON gv.khoa_id = k.id"
					+ " JOIN hoc_vi hv ON gv.hocvi_id = hv.id"
					+ " WHERE k.id = ?";
		return jdbcTemplate.query(sql, new GiangVienRowMapper(), idKhoa);
	}

	public int add(GiangVien giangvien) {	
		final String sql = "INSERT INTO giang_vien(ten, ngay_sinh, gioi_tinh, email, so_dien_thoai, username, password, avatar, hocvi_id, khoa_id) VALUES(?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{giangvien.getTen(),LibDate.convertToSDate(giangvien.getNgaySinh()),giangvien.isGioiTinh(),
				giangvien.getEmail(),giangvien.getSoDienThoai(),giangvien.getUsername(),LibString.md5(giangvien.getSoDienThoai()),
				giangvien.getAvatar(),giangvien.getHocVi().getId(),giangvien.getKhoa().getId()});
	}
	
	public GiangVien getItem(int id) {
		String sql  = " SELECT gv.*, k.ten tenkhoa,hv.hoc_vi tenHocVi "
				+ " FROM giang_vien gv"
				+ " JOIN khoa k    ON gv.khoa_id = k.id"
				+ " JOIN hoc_vi hv ON gv.hocvi_id = hv.id"
				+ " WHERE gv.id = ?";
		return jdbcTemplate.queryForObject(sql, new GiangVienRowMapper(), new Object[]{id});
	}

	public int del(int id) {
		String sql = "DELETE FROM giang_vien WHERE id = ? LIMIT 1";
		return jdbcTemplate.update(sql, id);
	}

	public int edit(GiangVien giangvien) {
		String sql = " UPDATE giang_vien"
				   + " SET ten       = ?,"
				   + " ngay_sinh      = ?,"
				   + " gioi_tinh     = ?,"
				   + " email         = ?,"
				   + " so_dien_thoai = ?,"
				   + " avatar        = ?, "
				   + " hocvi_id      = ?,"
				   + " khoa_id       = ?"
				   + " WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[]{giangvien.getTen(), giangvien.getNgaySinh(), giangvien.isGioiTinh(), giangvien.getEmail(),
				giangvien.getSoDienThoai(), giangvien.getAvatar(), giangvien.getHocVi().getId(), giangvien.getKhoa().getId(), giangvien.getId()});
	}

	public int updatePassword(GiangVien giangvien) {
		System.out.println("COME HERE NOW");
		String sql = " UPDATE giang_vien  "
				   + " SET   password = ? "
				   + " WHERE id       = ? ";
		return jdbcTemplate.update(sql, new Object[]{LibString.md5(giangvien.getPassword()),giangvien.getId()});
	}
	
}
