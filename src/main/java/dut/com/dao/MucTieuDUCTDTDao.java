package dut.com.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.MucTieuDUCTDT;
import dut.com.entity.TmpClass;

@Repository
public class MucTieuDUCTDTDao {
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(MucTieuDUCTDT mucTieu) {
		String sql = "INSERT INTO muc_tieu_dap_ung_ctdt(muc_tieu_hoc_phan_id, chuan_dau_ra_ctdt_id) VALUES(?, ?)";
	
		return jdbcTemplate.update(sql, new Object[]{
				mucTieu.getMucTieuHPId(),
				mucTieu.getCDRCTDTId(),
			});
	}
	
	public List<TmpClass> getCDRByDeCuongId(int decuongId) {
		String sql = "select muc_tieu_hoc_phan_id, group_concat(chuan_dau_ra_ctdt_id) as chuanDauRa from muc_tieu_dap_ung_ctdt where muc_tieu_hoc_phan_id in (select id from muc_tieu_hoc_phan where de_cuong_chi_tiet_id = ?) group by muc_tieu_hoc_phan_id";

		return jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<TmpClass>(TmpClass.class), new Object[] { decuongId });
	}
}