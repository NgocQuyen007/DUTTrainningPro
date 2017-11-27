package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.LoaiHocLieu;

@Repository
public class LoaiHocLieuDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<LoaiHocLieu> getItems(){
		String sql  = "SELECT * FROM loai_hoc_lieu";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<LoaiHocLieu>(LoaiHocLieu.class));
	}	
}