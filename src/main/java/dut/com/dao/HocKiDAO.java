package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.HocKi;

@Repository
public class HocKiDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public HocKi getItem(int id) {
		String sql = "SELECT * FROM hoc_ky WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HocKi>(HocKi.class), id);
	}

	public List<HocKi> getItems(){
		String sql = "SELECT * FROM hoc_ky";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocKi>(HocKi.class));
	}
	
	public List<HocKi> getItemsFromListId(int ctdtId){
		String sql = "SELECT * FROM hoc_ky where id in (SELECT distinct(hoc_ki_id) FROM hoc_phan_ctdt where chuong_trinh_dao_tao_id = ?)";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocKi>(HocKi.class), ctdtId);
	}
}
