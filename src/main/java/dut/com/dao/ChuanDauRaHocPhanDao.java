package dut.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;

import dut.com.entity.ChuanDauRaHocPhan;

@Repository
public class ChuanDauRaHocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(final ChuanDauRaHocPhan cdrhp) {
		final String sql = "INSERT INTO chuan_dau_ra_hoc_phan(mota, muc_do_giang_day, ten, de_cuong_chi_tiet_id) VALUES(?, ?, ?, ?)";
		
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				PreparedStatement statement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, cdrhp.getMoTa());
		        statement.setString(2, cdrhp.getMucDoGiangDay());
		        statement.setString(3, cdrhp.getTen());
		        statement.setInt(4, cdrhp.getDeCuongChiTietId());
		        return statement;
			}
		}, holder);

		long primaryKey = holder.getKey().longValue();
		return (int) primaryKey;
	}
	
//	public ChuanDauRaCTDT getItem(int id) {
//		String sql = "SELECT * FROM chuan_dau_ra_ctdt WHERE id = ?";
//		
//		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<ChuanDauRaCTDT>(ChuanDauRaCTDT.class), id);
//	}
//	
	
	public List<ChuanDauRaHocPhan> getItems() {
		String sql = "SELECT * FROM chuan_dau_ra_hoc_phan";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ChuanDauRaHocPhan>(ChuanDauRaHocPhan.class));
	}
	
	public List<ChuanDauRaHocPhan> getItemsByDeCuongId(int id) {
		String sql = "SELECT * FROM chuan_dau_ra_hoc_phan WHERE id in"
				+ " (SELECT chuan_dau_ra_hoc_phan_id FROM muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan "
				+ "where de_cuong_chi_tiet_id = " + id +")";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ChuanDauRaHocPhan>(ChuanDauRaHocPhan.class));
	}
}
