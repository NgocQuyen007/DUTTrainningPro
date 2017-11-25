package dut.com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.entity.CTDT;

@Repository
public class CTDTDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean add(CTDT ctdt) {	
		try {
			String sql = "INSERT INTO chuong_trinh_dao_tao(ten, khoa_id, nien_khoa_id, loai_id) VALUES(?,?,?,?)";
			int rs = jdbcTemplate.update(sql, new Object[]{ctdt.getTen(), ctdt.getKhoaId(), ctdt.getNienKhoaId(), ctdt.getLoaiId()});
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
}
