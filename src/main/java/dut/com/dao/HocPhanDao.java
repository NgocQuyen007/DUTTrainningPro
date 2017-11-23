package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.HocPhan;

@Repository
public class HocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public HocPhan getItem(int id) {
		String sql = "SELECT * FROM hoc_phan WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HocPhan>(HocPhan.class), id);
	}
	
	public List<HocPhan> getItems(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocPhan>(HocPhan.class));
	}
	
	public int updateDeCuong(int decuongid, int id) {
		String sql = "UPDATE hoc_phan SET de_cuong_chi_tiet_id = ? where id = ?";
	
		return jdbcTemplate.update(sql, decuongid, id);
	}
}
