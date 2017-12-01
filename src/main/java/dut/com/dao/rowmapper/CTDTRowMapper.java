package dut.com.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dut.com.entity.CTDT;
import dut.com.entity.Khoa;
import dut.com.entity.LoaiCTDT;

public class CTDTRowMapper implements RowMapper<CTDT> {
	
	public CTDT mapRow(ResultSet rs, int rowNum) throws SQLException {
		CTDT ctdt = new CTDT();
		ctdt.setId(rs.getInt("id"));
		ctdt.setKhoaId(rs.getInt("khoa_id"));
		ctdt.setLoaiId(rs.getInt("loai_id"));
		ctdt.setNienKhoa(rs.getString("nien_khoa"));
		ctdt.setTen(rs.getString("ten"));
		
		Khoa khoa = new Khoa(rs.getInt("khoa_id"), rs.getString("tenKhoa"), null);
		LoaiCTDT loai = new LoaiCTDT(rs.getInt("loai_id"), rs.getString("tenLoai"));
		ctdt.setKhoa(khoa);
		ctdt.setLoai(loai);
		return ctdt;
	}
}
