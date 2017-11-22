package dut.com.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.ChuanDauRaCTDT;

@Repository
public class ChuanDauRaCTDTDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	public int add(MucTieuHocPhan mucTieuHocPhan) {
//		String sql = "INSERT INTO muc_tieu_hoc_phan(ten, trinh_do_nang_luc, de_cuong_chi_tiet_id, mo_ta) VALUES(?, ?, ?, ?)";
//	
//		return jdbcTemplate.update(sql, new Object[]{
//				mucTieuHocPhan.getTen(),
//				mucTieuHocPhan.getTDNLuc(),
//				mucTieuHocPhan.getDCCTId(),
//				mucTieuHocPhan.getMoTa(),
//			});
//	}

	public ChuanDauRaCTDT getItem(int id) {
		String sql = "SELECT * FROM chuan_dau_ra_ctdt WHERE id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<ChuanDauRaCTDT>(ChuanDauRaCTDT.class), id);
	}
	
	public List<ChuanDauRaCTDT> getItems() {
		String sql = "SELECT * FROM chuan_dau_ra_ctdt";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ChuanDauRaCTDT>(ChuanDauRaCTDT.class));
	}
}
