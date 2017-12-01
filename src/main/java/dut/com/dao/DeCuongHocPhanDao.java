package dut.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;

import dut.com.entity.DeCuongHocPhan;

@Repository
public class DeCuongHocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(DeCuongHocPhan deCuongHocPhan) {
		String sql = "INSERT INTO de_cuong_hoc_phan(giang_vien_id, giang_vien_ass_id, mo_ta, hoc_phan_id) VALUES(?, ?, ?, ?)";
		GeneratedKeyHolder holder = new GeneratedKeyHolder();

		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				PreparedStatement statement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		        statement.setInt(1, deCuongHocPhan.getGiangVienId());
		        statement.setInt(2, deCuongHocPhan.getGiangVienAssId());
		        statement.setString(3, deCuongHocPhan.getMoTa());
		        statement.setInt(4, deCuongHocPhan.getHocPhanId());
		        return statement;
			}
		}, holder);
		
		long primaryKey = holder.getKey().longValue();
	
		return (int) primaryKey;
	}

	public DeCuongHocPhan getItem(int id) {
		String sql = "SELECT * FROM de_cuong_hoc_phan WHERE id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<DeCuongHocPhan>(DeCuongHocPhan.class), id);
	}
	
	public DeCuongHocPhan getItemByCTDTAndHP(int ctdtId, int hpId) {
		String sql = "SELECT * FROM de_cuong_hoc_phan where id in (SELECT de_cuong_hoc_phan_id FROM hoc_phan_ctdt WHERE chuong_trinh_dao_tao_id"
				+ " = " + ctdtId + " and hoc_phan_id = " + hpId + ")";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<DeCuongHocPhan>(DeCuongHocPhan.class));
	}
	
	public int checkExist(int id) {
		String sql = "SELECT count(*) from de_cuong_hoc_phan where hoc_phan_id = " + id;
		
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
