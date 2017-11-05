package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.GiangVien;

@Repository
public class GiangVienDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<GiangVien> getItems(){
		String sql = "SELECT * FROM giang_vien";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<GiangVien>(GiangVien.class));
	}
	
}
