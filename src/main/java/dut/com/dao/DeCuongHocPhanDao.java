package dut.com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.DeCuongHocPhan;

@Repository
public class DeCuongHocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(DeCuongHocPhan deCuongHocPhan) {
		String sql = "INSERT INTO de_cuong_hoc_phan(giang_vien_id, giang_vien_ass_id, hoc_phan_id, mo_ta) VALUES(?, ?, ?, ?)";
	
		return jdbcTemplate.update(sql, new Object[]{
				deCuongHocPhan.getGiangVienId(),
				deCuongHocPhan.getGiangVienAssId(),
				deCuongHocPhan.getHocPhanId(),
				deCuongHocPhan.getMoTa(),
			});
	}

	public DeCuongHocPhan getItem(int id) {
		String sql = "SELECT * FROM de_cuong_hoc_phan WHERE id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<DeCuongHocPhan>(DeCuongHocPhan.class), id);
	}
	
	public DeCuongHocPhan getItemByHocPhanId(int id) {
		String sql = "SELECT * FROM de_cuong_hoc_phan where hoc_phan_id = ?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<DeCuongHocPhan>(DeCuongHocPhan.class), id);
	}
	
}
