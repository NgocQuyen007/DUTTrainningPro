package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.HocVi;

@Repository
public class HocViDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<dut.com.entity.HocVi> getItems(){
		String sql  = "SELECT * FROM hoc_vi";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocVi>(HocVi.class));
	}

	
	
}
