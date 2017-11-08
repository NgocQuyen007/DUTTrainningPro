package dut.com.dao;

import java.util.List;

import dut.com.entity.HocPhan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HocPhanDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<HocPhan> getAll(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocPhan>(HocPhan.class));
	}
}
