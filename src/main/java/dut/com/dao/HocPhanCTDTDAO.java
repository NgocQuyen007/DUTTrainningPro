package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.CTDTRowMapper;
import dut.com.entity.CTDT;
import dut.com.entity.HocKi;
import dut.com.entity.HocPhanCTDT;
import dut.com.entity.Khoa;


@Repository
public class HocPhanCTDTDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean add(HocPhanCTDT hpCTDT) {	
		try {
			String sql = "INSERT INTO hoc_phan_ctdt(chuong_trinh_dao_tao_id, hoc_phan_id, hoc_ki_id) VALUES(?,?,?)";
			jdbcTemplate.update(sql, new Object[]{ hpCTDT.getCtdtId(), hpCTDT.getHocPhanId(), hpCTDT.getHocKiId() });
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public List<HocPhanCTDT> getItems(int ctdtId){
		String sql  = "SELECT * FROM hoc_phan_ctdt where chuong_trinh_dao_tao_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocPhanCTDT>(HocPhanCTDT.class), ctdtId);
	}

//	public List<Integer> getHocKiPluck(int ctdtId){
//		String sql = "SELECT distinct(hoc_ki_id) FROM hoc_phan_ctdt where chuong_trinh_dao_tao_id = ?";
//		List<Integer> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Integer>(Integer.class), ctdtId);
//		return list;
//	}
}
