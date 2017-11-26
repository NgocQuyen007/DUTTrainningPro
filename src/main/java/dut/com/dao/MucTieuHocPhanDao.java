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

import dut.com.entity.MucTieuHocPhan;

@Repository
public class MucTieuHocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(final MucTieuHocPhan mucTieuHocPhan) {
		final String sql = "INSERT INTO muc_tieu_hoc_phan(ten, trinh_do_nang_luc, de_cuong_chi_tiet_id, mota) VALUES(?, ?, ?, ?)";
		
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				PreparedStatement statement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, mucTieuHocPhan.getTen());
		        statement.setString(2, mucTieuHocPhan.getTrinhDoNangLuc());
		        statement.setInt(3, mucTieuHocPhan.getDeCuongChiTietId());
		        statement.setString(4, mucTieuHocPhan.getMoTa());
		        return statement;
			}
		}, holder);

		long primaryKey = holder.getKey().longValue();
		return (int) primaryKey;
	}

	public MucTieuHocPhan getItem(int id) {
		String sql = "SELECT * FROM muc_tieu_hoc_phan WHERE id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<MucTieuHocPhan>(MucTieuHocPhan.class), id);
	}
	
	public MucTieuHocPhan getItemByDeCuongId(int id) {
		String sql = "SELECT * FROM muc_tieu_hoc_phan where de_cuong_chi_tiet_id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<MucTieuHocPhan>(MucTieuHocPhan.class), id);
	}
	
	public List<MucTieuHocPhan> getItemsByDeCuongId(int decuongId){
		String sql = "SELECT * FROM muc_tieu_hoc_phan where de_cuong_chi_tiet_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<MucTieuHocPhan>(MucTieuHocPhan.class), decuongId);
	}
	
	public int update(int id, String moTa, String trinhDo) {
		String sql = "UPDATE muc_tieu_hoc_phan SET mota = '" + moTa + "', trinh_do_nang_luc = '" + trinhDo + "' where id = " + id;
		return jdbcTemplate.update(sql);
	}
}
