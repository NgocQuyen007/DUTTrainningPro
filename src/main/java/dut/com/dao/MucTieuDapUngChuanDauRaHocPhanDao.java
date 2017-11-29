package dut.com.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.MucTieuDapUngChuanDauRaHocPhan;
import dut.com.entity.TmpClassCDRHP;

@Repository
public class MucTieuDapUngChuanDauRaHocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(MucTieuDapUngChuanDauRaHocPhan mucTieu) {
		String sql = "INSERT INTO muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan(muc_tieu_hoc_phan_id, chuan_dau_ra_hoc_phan_id) VALUES(?, ?)";
	
		return jdbcTemplate.update(sql, new Object[]{
				mucTieu.getMucTieuHocPhanId(),
				mucTieu.getChuanDauRaHocPhanId(),
			});
	}
	
	public List<TmpClassCDRHP> getMucTieuByCDRId(int cdrId) {
		String sql = "select group_concat(ten) as mucTieuHocPhan, " + cdrId + "as chuanDauRaId from muc_tieu_hoc_phan where id in" 
					 + "(select muc_tieu_hoc_phan_id from muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan where chuan_dau_ra_hoc_phan_id = ?)";
		return jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<TmpClassCDRHP>(TmpClassCDRHP.class), new Object[] { cdrId });
	}
	
	public List<TmpClassCDRHP> getMucTieu(int decuongId) {
		String sql = "select chuan_dau_ra_hoc_phan_id as chuanDauRaId, group_concat(ten) as mucTieuHocPhan from (select tmp1.muc_tieu_hoc_phan_id, tmp1.chuan_dau_ra_hoc_phan_id, tmp2.ten from muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan as tmp1\n" + 
				"inner join muc_tieu_hoc_phan as tmp2 on tmp1.muc_tieu_hoc_phan_id = tmp2.id where de_cuong_chi_tiet_id = ? ) as lastTmp group by  chuan_dau_ra_hoc_phan_id";
		return jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<TmpClassCDRHP>(TmpClassCDRHP.class), new Object[] { decuongId });
	}
}