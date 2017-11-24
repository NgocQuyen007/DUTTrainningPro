package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.HocPhanRowMapper;
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
	public List<HocPhan> getAll(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new HocPhanRowMapper());
	}
	public HocPhan getHocPhanById(int id){
		String sql = "SELECT * FROM hoc_phan WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new HocPhanRowMapper());
	}
	
	public void add(HocPhan hp){
		String sql = "INSERT INTO hoc_phan (vi_name, en_name, ma_hoc_phan, loai_hoc_phan,"
				+ "khoi_kien_thuc_id, so_tin_chi) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getSo_tin_chi());
	}
	
	public void update(HocPhan hp){
		String sql = "UPDATE hoc_phan SET vi_name=?, en_name=?,  ma_hoc_phan=?, loai_hoc_phan=?,"
				+ "khoi_kien_thuc_id=?, so_tin_chi=? where id=?";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getSo_tin_chi(),hp.getId());
	}
	
	public void delete(int id){
		String sql = "DELETE FROM hoc_phan where id=?";
		jdbcTemplate.update(sql,id);
	}
}
