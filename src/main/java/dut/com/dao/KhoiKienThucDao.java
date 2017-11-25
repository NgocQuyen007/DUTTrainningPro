package dut.com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dut.com.entity.KhoiKienThuc;

@Repository
public class KhoiKienThucDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<KhoiKienThuc> getAll(){
		String sql = "SELECT * FROM khoi_kien_thuc";
		return jdbcTemplate.query(sql, new KhoiKienThucMapper());
	}
	
	public KhoiKienThuc getKhoiKienThucById(int id){
		String sql = "SELECT * FROM khoi_kien_thuc WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new KhoiKienThucMapper());
	}
	public class KhoiKienThucMapper implements RowMapper<KhoiKienThuc>{
		public KhoiKienThuc mapRow(ResultSet rs, int rowNum) throws SQLException {
			KhoiKienThuc kkt = new KhoiKienThuc();
            kkt.setId(rs.getInt(1));
            kkt.setTen(rs.getString(2));
            return kkt;
		}
	}
	public void add(KhoiKienThuc kkt){
		String sql = "INSERT INTO khoi_kien_thuc (ten) VALUES (?)";
		jdbcTemplate.update(sql,kkt.getTen());
	}
	
	public void update(KhoiKienThuc kkt){
		String sql = "UPDATE khoi_kien_thuc set ten=? where id=?";
		jdbcTemplate.update(sql,kkt.getTen(),kkt.getId());
	}
	
	public void delete(int id){
		String sql = "DELETE FROM khoi_kien_thuc where id=?";
		jdbcTemplate.update(sql,id);
	}
}
