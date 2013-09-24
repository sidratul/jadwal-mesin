package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Jadwal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("jadwalDao")
public class JadwalDaoImpl implements JadwalDao{
    
    @Autowired private MataKuliahDao mataKuliahDao;
    @Autowired private DosenDao dosenDao;
    
    
    private static final String SQL_GETALL_JADWAL="SELECT * FROM JADWAL ";
    private static final String SQL_DELETE_JADWAL="DELETE FROM JADWAL WHERE ID=?";
    private static final String SQL_DELETE_SEMUA_JADWAL="DELETE FROM JADWAL";
    private static final String SQL_JADWAL_BYID="SELECT * FROM JADWAL WHERE ID=?";
    private static final String SQL_UPDATE_JADWAL="UPDATE `JADWAL` SET "
            + "`ID_Matakuliah` = ?, `ID_Dosen` = ?, `Jam` = ?,`Hari` = ?, `Ruang`=?,`Keterangan`=? WHERE `ID` = ?;";
    private static final String SQL_INSERT_JADWAL="INSERT INTO `JADWAL` "
            + "(`ID_Matakuliah`,`ID_Dosen`,`Jam`,`Hari`,`Ruang`,`Keterangan`)VALUES (?,?,?,?,?,?);";
    private static final String SQL_INSERT_JADWAL_HANYAMATAKULIAH="INSERT INTO `JADWAL` "
            + "(`ID_Matakuliah`)VALUES (?);";
    
    
    private JdbcTemplate jdbcTemplate;

    private class JadwalParameterizedRowMapper implements ParameterizedRowMapper<Jadwal>{   
    
        public Jadwal mapRow(ResultSet rs, int i) throws SQLException {
            Jadwal jadwal = new Jadwal();
            jadwal.setId(rs.getInt("ID"));
            jadwal.setMataKuliah(mataKuliahDao.getMatkulById(rs.getInt("ID_Matakuliah")));
            jadwal.setDosen(dosenDao.getDosenById(rs.getInt("ID_Dosen")));
            jadwal.setWaktu(rs.getDate("Jam"));
            jadwal.setHari(rs.getInt("Hari"));
            jadwal.setRuang(rs.getString("Ruang"));
            jadwal.setKeterangan(rs.getString("Keterangan"));
            
            return jadwal;
        }
        
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Jadwal> getAllJadwal() {
        List<Jadwal> jadwals = jdbcTemplate.query(SQL_GETALL_JADWAL, new JadwalParameterizedRowMapper());
        return jadwals;
    }

    public void saveJadwal(Jadwal jadwal) {
        if(jadwal.getId()!=null){
            jdbcTemplate.update(SQL_UPDATE_JADWAL, new Object[]{
                jadwal.getMataKuliah().getId(),jadwal.getDosen().getId(),jadwal.getWaktu(),jadwal.getHari(),jadwal.getRuang(),jadwal.getKeterangan(),jadwal.getId()
            });
        }else{
            jdbcTemplate.update(SQL_UPDATE_JADWAL, new Object[]{
                jadwal.getMataKuliah().getId(),jadwal.getDosen().getId(),jadwal.getWaktu(),jadwal.getHari(),jadwal.getRuang(),jadwal.getKeterangan()
            });
        }
    }
    
    public void saveJadwalHanyaMatakuliah(Integer idMatkul){
        jdbcTemplate.update(SQL_INSERT_JADWAL_HANYAMATAKULIAH, idMatkul);
    }

    public Jadwal getJadwalById(Integer id) {
        if(id==null){
            return null;
        }else{
            Jadwal jadwal= jdbcTemplate.queryForObject(SQL_JADWAL_BYID,new JadwalParameterizedRowMapper(),id);
            return jadwal;
        }
    }

    public void deleteJadwal(Integer id) {
        jdbcTemplate.update(SQL_DELETE_JADWAL, id);
    }
        
    public void deleteSemuaJadwal() {
        jdbcTemplate.update(SQL_DELETE_SEMUA_JADWAL);
    }
}
