package dut.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;

import dut.com.entity.DCHPCTDT;;

@Repository
public class DCHPCTDTDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int update(int ctdtId, int hpId, int deCuongId) {
		final String sql = "UPDATE hoc_phan_ctdt SET de_cuong_hoc_phan_id = " + deCuongId + " WHERE chuong_trinh_dao_tao_id = " + ctdtId
				+ " and hoc_phan_id = " + hpId;
		
		return jdbcTemplate.update(sql);
	}
}
