package dut.com.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.ChuanDauRaCTDTRowMapper;
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
		return jdbcTemplate.query(sql, new ChuanDauRaCTDTRowMapper());
	}
	
	public List<ChuanDauRaCTDT> getListByCTDT(int ctdtId) {
		String sql = "SELECT * FROM chuan_dau_ra_ctdt where ctdt_id = ?";
		return jdbcTemplate.query(sql, new ChuanDauRaCTDTRowMapper(), ctdtId);
	}

	public boolean add(int ctdtId, String ten, String mota) {
		try {
			String sql = "INSERT INTO chuan_dau_ra_ctdt(ten_cdr, mota, ctdt_id) VALUES(?,?,?)";
			jdbcTemplate.update(sql, new Object[]{ ten, mota, ctdtId });
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	public boolean deleteAll(int ctdtId) {
		try {
			String sql = "DELETE from chuan_dau_ra_ctdt WHERE ctdt_id = ?";
			jdbcTemplate.update(sql, new Object[]{ ctdtId });
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		
	}
}
