package dut.com.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dut.com.entity.ChuanDauRaCTDT;

public class ChuanDauRaCTDTRowMapper implements RowMapper<ChuanDauRaCTDT> {

	@Override
	public ChuanDauRaCTDT mapRow(ResultSet rs, int rowNum) throws SQLException {
		ChuanDauRaCTDT cdr = new ChuanDauRaCTDT();
		cdr.setId(rs.getInt("id"));
		cdr.setTenCDR(rs.getString("ten_cdr"));
		cdr.setMoTa(rs.getString("mota"));
		cdr.setCtdt_id(rs.getInt("ctdt_id"));
		return cdr;
	}

}
