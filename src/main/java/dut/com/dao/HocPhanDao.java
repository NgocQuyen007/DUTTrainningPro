package dut.com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import dut.com.entity.HocPhan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class HocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<HocPhan> getAll(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new HocPhanMapper());
	}
	public HocPhan getHocPhanById(int id){
		String sql = "SELECT * FROM hoc_phan WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new HocPhanMapper());
	}
	
	public void add(HocPhan hp){
		String sql = "INSERT INTO hoc_phan (vi_name, en_name, ma_hoc_phan, loai_hoc_phan,"
				+ "khoi_kien_thuc_id, so_tin_chi) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getSo_tin_chi());
	}
	
	public void update(HocPhan hp){
		String sql = "UPDATE hoc_phan set vi_name=?, en_name=?,  ma_hoc_phan=?, loai_hoc_phan=?"
				+ "khoi_kien_thuc_id=?, de_cuong_chi_tiet_id=?, so_tin_chi=? where id=?";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getDe_cuong_chi_tiet_id(),hp.getSo_tin_chi(),hp.getId());
	}
	
	public void delete(int id){
		String sql = "DELETE FROM hoc_phan where id=?";
		jdbcTemplate.update(sql,id);
	}
	public class HocPhanMapper implements RowMapper<HocPhan>{
		public HocPhan mapRow(ResultSet rs, int rowNum) throws SQLException {
			HocPhan hp = new HocPhan();
			hp.setId(rs.getInt(1));
			hp.setVi_name(rs.getString(2));
			hp.setEn_name(rs.getString(3));
			hp.setMa_hoc_phan(rs.getString(4));
			hp.setLoai_hoc_phan(rs.getString(5));
			hp.setKhoi_kien_thuc_id(rs.getInt(6));
			hp.setDe_cuong_chi_tiet_id(rs.getInt(7));
			hp.setSo_tin_chi(rs.getInt(8));
            return hp;
		}
	}
}
