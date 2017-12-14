

DROP TABLE IF EXISTS chuan_dau_ra_ctdt;
CREATE TABLE chuan_dau_ra_ctdt (
  id int(10) NOT NULL AUTO_INCREMENT,
  ten_cdr varchar(45) NOT NULL,
  mota varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS chuan_dau_ra_hoc_phan;
CREATE TABLE chuan_dau_ra_hoc_phan (
  id int(10) NOT NULL AUTO_INCREMENT,
  mota varchar(100) NOT NULL,
  muc_do_giang_day varchar(10) DEFAULT NULL,
  ten varchar(45) DEFAULT NULL,
  de_cuong_chi_tiet_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE1 (id),
  KEY fk_chuan_dau_ra_hoc_phan_de_cuong_chi_tiet1_idx (de_cuong_chi_tiet_id),
  CONSTRAINT fk_chuan_dau_ra_hoc_phan_de_cuong_chi_tiet1 FOREIGN KEY (de_cuong_chi_tiet_id) REFERENCES de_cuong_hoc_phan (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS chuong_trinh_dao_tao;
CREATE TABLE chuong_trinh_dao_tao (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  khoa_id int(10) unsigned NOT NULL,
  loai_id int(10) unsigned NOT NULL,
  ten varchar(45) DEFAULT NULL,
  nien_khoa varchar(45) DEFAULT NULL,
  PRIMARY KEY (id,loai_id,khoa_id),
  UNIQUE KEY id_UNIQUE2 (id),
  KEY fk_education_program_faculties1_idx (khoa_id),
  KEY fk_education_program_category1_idx (loai_id),
  CONSTRAINT fk_education_program_category1 FOREIGN KEY (loai_id) REFERENCES loai (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_education_program_faculties1 FOREIGN KEY (khoa_id) REFERENCES khoa (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS de_cuong_hoc_phan;

CREATE TABLE de_cuong_hoc_phan (
  id int(11) NOT NULL AUTO_INCREMENT,
  giang_vien_id int(10) unsigned NOT NULL,
  giang_vien_ass_id int(10) unsigned NOT NULL,
  hoc_phan_id int(10) unsigned NOT NULL,
  mo_ta varchar(45) DEFAULT NULL,
  PRIMARY KEY (id,giang_vien_id),
  KEY fk_subject_outlines_lecturers1_idx (giang_vien_id),
  KEY fk_de_cuong_chi_tiet_giang_vien1_idx (giang_vien_ass_id),
  KEY fk_de_cuong_chi_tiet_hoc_phan1_idx (hoc_phan_id),
  CONSTRAINT fk_de_cuong_chi_tiet_giang_vien1 FOREIGN KEY (giang_vien_ass_id) REFERENCES giang_vien (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_hoc_phan_de_cuong_chi_tiet1 FOREIGN KEY (hoc_phan_id) REFERENCES hoc_phan (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_subject_outlines_lecturers1 FOREIGN KEY (giang_vien_id) REFERENCES giang_vien (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS giang_vien;
CREATE TABLE giang_vien (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ten varchar(45) NOT NULL,
  ngay_sinh date NOT NULL,
  gioi_tinh tinyint(1) unsigned NOT NULL,
  email varchar(45) DEFAULT NULL,
  so_dien_thoai varchar(20) DEFAULT NULL,
  username varchar(45) NOT NULL,
  password varchar(45) NOT NULL,
  avatar varchar(100) NOT NULL,
  hocvi_id int(10) NOT NULL,
  khoa_id int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE3 (id),
  UNIQUE KEY username_UNIQUE (username),
  UNIQUE KEY email_UNIQUE (email),
  KEY fk_lecturers_faculties1_idx (khoa_id)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS hoc_ky;
CREATE TABLE hoc_ky (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ten varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE4 (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS hoc_phan;
CREATE TABLE hoc_phan (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  vi_name varchar(45) NOT NULL,
  en_name text,
  ma_hoc_phan varchar(45) DEFAULT NULL,
  loai_hoc_phan varchar(45) DEFAULT NULL,
  khoi_kien_thuc_id int(11) NOT NULL,
  so_tin_chi float DEFAULT NULL,
  PRIMARY KEY (id,khoi_kien_thuc_id),
  UNIQUE KEY id_UNIQUE5 (id),
  KEY fk_hoc_phan_khoi_kien_thuc1_idx (khoi_kien_thuc_id),
  CONSTRAINT fk_hoc_phan_khoi_kien_thuc1 FOREIGN KEY (khoi_kien_thuc_id) REFERENCES khoi_kien_thuc (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS hoc_phan_ctdt;
CREATE TABLE hoc_phan_ctdt (
  chuong_trinh_dao_tao_id int(10) unsigned NOT NULL,
  hoc_phan_id int(10) unsigned NOT NULL,
  hoc_ki_id int(10) DEFAULT NULL,
  PRIMARY KEY (chuong_trinh_dao_tao_id,hoc_phan_id),
  KEY fk_subjects_has_education_program_education_program1_idx (chuong_trinh_dao_tao_id),
  KEY fk_hoc_phan_ctdt_hoc_phan1_idx (hoc_phan_id),
  CONSTRAINT fk_hoc_phan_ctdt_hoc_phan1 FOREIGN KEY (hoc_phan_id) REFERENCES hoc_phan (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_subjects_has_education_program_education_program1 FOREIGN KEY (chuong_trinh_dao_tao_id) REFERENCES chuong_trinh_dao_tao (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS hoc_vi;
CREATE TABLE hoc_vi (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  hoc_vi varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS khoa;
CREATE TABLE khoa (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ten varchar(45) NOT NULL,
  giao_vu_khoa_id int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE6 (id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS khoi_kien_thuc;
CREATE TABLE khoi_kien_thuc (
  id int(11) NOT NULL AUTO_INCREMENT,
  ten varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS loai;
CREATE TABLE loai (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ten varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE7 (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS loai_hoc_lieu;
CREATE TABLE loai_hoc_lieu (
  id int(11) NOT NULL AUTO_INCREMENT,
  ten_loai varchar(150) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE8 (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS muc_tieu_dap_ung_ctdt;
CREATE TABLE muc_tieu_dap_ung_ctdt (
  muc_tieu_hoc_phan_id int(10) NOT NULL,
  chuan_dau_ra_ctdt_id int(11) NOT NULL,
  PRIMARY KEY (muc_tieu_hoc_phan_id,chuan_dau_ra_ctdt_id),
  KEY fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctd_idx (chuan_dau_ra_ctdt_id),
  KEY fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_pha_idx (muc_tieu_hoc_phan_id),
  CONSTRAINT fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctdt1 FOREIGN KEY (chuan_dau_ra_ctdt_id) REFERENCES chuan_dau_ra_ctdt (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_phan1 FOREIGN KEY (muc_tieu_hoc_phan_id) REFERENCES muc_tieu_hoc_phan (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS muc_tieu_hoc_phan;
CREATE TABLE muc_tieu_hoc_phan (
  id int(10) NOT NULL AUTO_INCREMENT,
  mota varchar(45) NOT NULL,
  trinh_do_nang_luc varchar(10) DEFAULT NULL,
  de_cuong_chi_tiet_id int(11) NOT NULL,
  ten varchar(45) DEFAULT NULL,
  PRIMARY KEY (id,de_cuong_chi_tiet_id),
  UNIQUE KEY id_UNIQUE11 (id),
  KEY fk_muc_tieu_hoc_phan_de_cuong_chi_tiet1_idx (de_cuong_chi_tiet_id),
  CONSTRAINT fk_muc_tieu_hoc_phan_de_cuong_chi_tiet1 FOREIGN KEY (de_cuong_chi_tiet_id) REFERENCES de_cuong_hoc_phan (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan;
CREATE TABLE muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan (
  muc_tieu_hoc_phan_id int(10) NOT NULL,
  chuan_dau_ra_hoc_phan_id int(10) NOT NULL,
  PRIMARY KEY (muc_tieu_hoc_phan_id,chuan_dau_ra_hoc_phan_id),
  KEY fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_chuan_dau_ra_idx (chuan_dau_ra_hoc_phan_id),
  KEY fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_muc_tieu_hoc_idx (muc_tieu_hoc_phan_id),
  CONSTRAINT fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_chuan_dau_ra_h1 FOREIGN KEY (chuan_dau_ra_hoc_phan_id) REFERENCES chuan_dau_ra_hoc_phan (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_muc_tieu_hoc_p1 FOREIGN KEY (muc_tieu_hoc_phan_id) REFERENCES muc_tieu_hoc_phan (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS nguon_hoc_lieu;
CREATE TABLE nguon_hoc_lieu (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  ten_hoc_lieu varchar(150) NOT NULL,
  de_cuong_chi_tiet_id int(11) NOT NULL,
  loai_hoc_lieu_id int(11) NOT NULL,
  PRIMARY KEY (id,de_cuong_chi_tiet_id),
  UNIQUE KEY id_UNIQUE12 (id),
  KEY fk_nguon_hoc_lieu_de_cuong_chi_tiet1_idx (de_cuong_chi_tiet_id),
  KEY fk_nguon_hoc_lieu_loai_hoc_lieu1_idx (loai_hoc_lieu_id),
  CONSTRAINT fk_nguon_hoc_lieu_de_cuong_chi_tiet1 FOREIGN KEY (de_cuong_chi_tiet_id) REFERENCES de_cuong_hoc_phan (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_nguon_hoc_lieu_loai_hoc_lieu1 FOREIGN KEY (loai_hoc_lieu_id) REFERENCES loai_hoc_lieu (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS nien_khoa;
CREATE TABLE nien_khoa (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ten varchar(45) DEFAULT NULL,
  ctdt_mac_dinh tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id int(11) NOT NULL,
  role varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tai_lieu;
CREATE TABLE tai_lieu (
  id int(11) NOT NULL,
  tieu_de varchar(45) DEFAULT NULL,
  link varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
