package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.Khoa;

@Repository
public class KhoaDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Khoa> getItems(){
		String sql  = "SELECT * FROM khoa";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Khoa>(Khoa.class));
	}
}
