package dut.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.CTDTRowMapper;
import dut.com.dao.rowmapper.HocPhanRowMapper;
import dut.com.entity.CTDT;
import dut.com.entity.HocKi;
import dut.com.entity.HocPhan;
import dut.com.entity.HocPhanCTDT;
import dut.com.entity.HocPhanHocKiCTDT;

@Repository
public class CTDTDAO {
	@Autowired
	private CTDTDAO ctdtDAO;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	HocPhanCTDTDAO hocPhanCTDTDAO;
	
	@Autowired
	HocKiDAO hocKiDAO;
	
	public List<CTDT> getItems(){
		String sql = "SELECT ctdt.*, k.id khoaId, k.ten tenKhoa, k.giao_vu_khoa_id, l.id loaiId, l.ten tenLoai FROM chuong_trinh_dao_tao ctdt "
					+ "JOIN khoa k ON k.id = ctdt.khoa_id "
					+ "JOIN loai l ON l.id = ctdt.loai_id;";
		return jdbcTemplate.query(sql, new CTDTRowMapper());
	}
	public List<CTDT> getCTDTByHocPhanId(int id){
		String sql = "select * from chuong_trinh_dao_tao where chuong_trinh_dao_tao.id "
				+ "in (select hoc_phan_ctdt.chuong_trinh_dao_tao_id "
				+ "from hoc_phan_ctdt where hoc_phan_id = ?)";;
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<CTDT>(CTDT.class), id);
	}
	public int add(CTDT ctdt) {	
		try {
			String sql = "INSERT INTO chuong_trinh_dao_tao(ten, khoa_id, nien_khoa, loai_id) VALUES(?,?,?,?)";
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(
			    new PreparedStatementCreator() {
			        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
			            PreparedStatement ps =
			                connection.prepareStatement(sql, new String[] {"id"});
			            ps.setString(1, ctdt.getTen());
			            ps.setInt(2, ctdt.getKhoaId());
			            ps.setString(3, ctdt.getNienKhoa());
			            ps.setInt(4, ctdt.getLoaiId());
			            return ps;
			        }
			    },
			    keyHolder);
		
			System.out.println("Id: "+ keyHolder.getKey());
			
//			jdbcTemplate.update(sql, new Object[]{ctdt.getTen(), ctdt.getKhoaId(), ctdt.getNienKhoa(), ctdt.getLoaiId()});
			return Integer.parseInt(keyHolder.getKey().toString());
		} catch (Exception e) {
			return -1;
		}
	}
	
	public CTDT getById(int id){
		String sql = "SELECT ctdt.*, k.id khoaId, k.ten tenKhoa, k.giao_vu_khoa_id, l.id loaiId, l.ten tenLoai FROM chuong_trinh_dao_tao ctdt "
					+ "JOIN khoa k ON k.id = ctdt.khoa_id "
					+ "JOIN loai l ON l.id = ctdt.loai_id where ctdt.id = ? LIMIT 1;";
		CTDT ctdt = jdbcTemplate.queryForObject(sql, new CTDTRowMapper(), new Object[]{id});
//		List<HocPhanCTDT> hocPhanCTDTList = hocPhanCTDTDAO.getItems(id);
//		List<Integer> hocKiIds = hocPhanCTDTDAO.getHocKiPluck(id);
		List<HocKi> hocKis = hocKiDAO.getItemsFromListId(id);
		List<HocPhanHocKiCTDT> hocPhanHocKiCTDTs = new ArrayList<HocPhanHocKiCTDT>();
		for (HocKi hocKi : hocKis) {
			List<HocPhan> dsHP = ctdtDAO.getHocPhanByHocKi(id, hocKi.getId());
			hocPhanHocKiCTDTs.add(new HocPhanHocKiCTDT(hocKi, dsHP));
		}
		ctdt.setHocPhanHocKiCTDTs(hocPhanHocKiCTDTs);
		return ctdt;
	}
	
	public List<HocPhan> getHocPhanByHocKi(int ctdtId, int hocKiId){
		String sql = "SELECT hp.* FROM hoc_phan_ctdt hc JOIN hoc_phan hp ON hc.hoc_phan_id = hp.id where hc.chuong_trinh_dao_tao_id = ? AND hc.hoc_ki_id = ?;";
		return jdbcTemplate.query(sql, new HocPhanRowMapper(), ctdtId, hocKiId);
	}
	
	public List<HocKi> getHocKiRemain(int id){
		String sql = "select * from hoc_ky where id not in (SELECT distinct(hoc_ki_id) FROM trainningpro.hoc_phan_ctdt where chuong_trinh_dao_tao_id = ?);";
		List<HocKi> rs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocKi>(HocKi.class), id);
		return rs;
	}
	public List<HocPhan> getHocPhanRemain(int id){
		String sql = "select * from hoc_phan where id not in (select distinct(hoc_phan_id) from hoc_phan_ctdt where chuong_trinh_dao_tao_id = ?);";
		return jdbcTemplate.query(sql, new HocPhanRowMapper(), id);
	}

	public boolean addHocPhanCTDT(HocPhanCTDT hocPhanCTDT) {
		try {
			String sql = "INSERT INTO hoc_phan_ctdt(chuong_trinh_dao_tao_id, hoc_phan_id, hoc_ki_id) VALUES(?,?,?)";
			jdbcTemplate.update(sql, new Object[]{ hocPhanCTDT.getCtdtId(), hocPhanCTDT.getHocPhanId(), hocPhanCTDT.getHocKiId() });
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delHocPhanCTDT(HocPhanCTDT hocPhanCTDT) {
		try {
			String sql = "DELETE from hoc_phan_ctdt WHERE chuong_trinh_dao_tao_id = ? AND hoc_phan_id=? AND hoc_ki_id=?";
			jdbcTemplate.update(sql, new Object[]{ hocPhanCTDT.getCtdtId(), hocPhanCTDT.getHocPhanId(), hocPhanCTDT.getHocKiId() });
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	public boolean delelteCTDT(int id) {
		try {
			String sql = "DELETE from hoc_phan_ctdt WHERE chuong_trinh_dao_tao_id = ?";
			jdbcTemplate.update(sql, new Object[]{ id });
			sql = "DELETE from chuong_trinh_dao_tao WHERE id = ?";
			jdbcTemplate.update(sql, new Object[]{ id });
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	public boolean update(CTDT ctdt) {
		try {
			String sql = "UPDATE chuong_trinh_dao_tao SET ten=?, khoa_id=?, nien_khoa=?, loai_id=? WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{ctdt.getTen(), ctdt.getKhoaId(), ctdt.getNienKhoa(), ctdt.getLoaiId(), ctdt.getId() });
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	public boolean delHocKiCTDT(int ctdtId, int hocKiId) {
		try {
			String sql = "DELETE from hoc_phan_ctdt WHERE chuong_trinh_dao_tao_id = ? AND hoc_ki_id=?";
			jdbcTemplate.update(sql, new Object[]{ ctdtId, hocKiId });
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	
}
