package dut.com.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dut.com.entity.HocPhan;

public class HocPhanRowMapper implements RowMapper<HocPhan>{
	public HocPhan mapRow(ResultSet rs, int rowNum) throws SQLException {
		HocPhan hp = new HocPhan();
		hp.setId(rs.getInt(1));
		hp.setVi_name(rs.getString(2));
		hp.setEn_name(rs.getString(3));
		hp.setMa_hoc_phan(rs.getString(4));
		hp.setLoai_hoc_phan(rs.getString(5));
		hp.setKhoi_kien_thuc_id(rs.getInt(6));
		hp.setSo_tin_chi(rs.getInt(7));
        return hp;
	}
}
