package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.GiangVien;
import dut.com.entity.MucTieuHocPhan;
import dut.com.entity.NguonHocLieu;
import dut.com.libs.LibDate;
import dut.com.libs.LibString;

@Repository
public class NguonHocLieuDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<NguonHocLieu> getItems(){
		String sql  = "SELECT * FROM nguon_hoc_lieu";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<NguonHocLieu>(NguonHocLieu.class));
	}
	
	public int add(NguonHocLieu nguonhoclieu) {	
		final String sql = "INSERT INTO nguon_hoc_lieu(ten_hoc_lieu, de_cuong_chi_tiet_id, loai_hoc_lieu_id) VALUES(?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{nguonhoclieu.getTenHocLieu(), nguonhoclieu.getDeCuongChiTietId(), nguonhoclieu.getLoaiHocLieuId()});
	}
	
	public List<NguonHocLieu> getItemsByDeCuongId(int decuongId){
		String sql  = "SELECT * FROM nguon_hoc_lieu WHERE de_cuong_chi_tiet_id = " + decuongId + " order by loai_hoc_lieu_id asc";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<NguonHocLieu>(NguonHocLieu.class));
	} 
}
