package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.LoaiCTDT;

@Repository
public class LoaiCTDTDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<LoaiCTDT> getLoaiCTDT(){
		String sql  = "SELECT * FROM loai";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<LoaiCTDT>(LoaiCTDT.class));
	}
	
	public LoaiCTDT getLoaiCTDTById(int id) {
		System.out.println("====================="+id);
		String sql = "SELECT * FROM loai WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<LoaiCTDT>(LoaiCTDT.class), id);
	}
}
