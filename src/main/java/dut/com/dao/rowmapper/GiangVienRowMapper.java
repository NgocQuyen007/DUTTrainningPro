package dut.com.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dut.com.entity.GiangVien;
import dut.com.entity.HocVi;
import dut.com.entity.Khoa;

public class GiangVienRowMapper implements RowMapper<GiangVien>{

	public GiangVien mapRow(ResultSet rs, int rowNum) throws SQLException {
		GiangVien giangvien = new GiangVien();
		
		giangvien.setId(rs.getInt("id"));
		
		giangvien.setTen(rs.getString("ten"));
		giangvien.setNgaySinh(rs.getString("ngay_sinh"));
		giangvien.setGioiTinh(rs.getBoolean("gioi_tinh"));
		giangvien.setEmail(rs.getString("email"));
		giangvien.setSoDienThoai(rs.getString("so_dien_thoai"));
		giangvien.setAvatar(rs.getString("avatar"));
		giangvien.setUsername(rs.getString("username"));
		giangvien.setPassword(rs.getString("password"));
		
		HocVi hocvi = new HocVi();
		hocvi.setId(rs.getInt("hocvi_id"));
		hocvi.setHocVi(rs.getString("tenHocVi"));
		giangvien.setHocVi(hocvi);
		
		Khoa khoa = new Khoa();
		khoa.setId(rs.getInt("khoa_id"));
		khoa.setTen(rs.getString("tenkhoa"));
		giangvien.setKhoa(khoa);
		
		return giangvien;
	}

}
