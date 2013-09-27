package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Jadwal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository("jadwalDao")
@Service
public class JadwalDaoImpl implements JadwalDao{
    
    @Autowired private MataKuliahDao mataKuliahDao;
    @Autowired private DosenDao dosenDao;
    
    private JdbcTemplate jdbcTemplate;

    private class JadwalParameterizedRowMapper implements ParameterizedRowMapper<Jadwal>{   
    
        public Jadwal mapRow(ResultSet rs, int i) throws SQLException{
            final long MENIT = 60l*1000l;
            Jadwal jadwal = new Jadwal();
            jadwal.setId(rs.getInt("ID"));
            jadwal.setMataKuliah(mataKuliahDao.getMatkulById(rs.getInt("ID_Matakuliah")));
            jadwal.setDosen(dosenDao.getDosenById(rs.getInt("ID_Dosen")));
            jadwal.setJamMulai(rs.getTime("Jam"));
            jadwal.setHari(rs.getInt("Hari"));
            jadwal.setRuang(rs.getString("Ruang"));
            jadwal.setKeterangan(rs.getString("Keterangan"));
            
            Date waktuSelesai;
            
            try{                
                jadwal.setJamSelesai(new Date(
                        jadwal.getJamMulai().getTime()+((MENIT * 45) * jadwal.getMataKuliah().getSks())
                    ));
            }catch(NullPointerException npe){
                jadwal.setJamSelesai(null);
            }
            
            
            return jadwal;
        }
        
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Jadwal> getAllJadwal(String namaTable) {
        String SQL_GETALL_JADWAL="SELECT * FROM "+namaTable ;
        List<Jadwal> jadwals = jdbcTemplate.query(SQL_GETALL_JADWAL, new JadwalParameterizedRowMapper());
        return jadwals;
    }
    
    public List<Jadwal> getJadwalByHari(String namaTable,Integer hari) {
        String SQL_JADWAL_BYHARI="SELECT * FROM "+namaTable+" WHERE Hari=?";
        List<Jadwal> jadwals = jdbcTemplate.query(SQL_JADWAL_BYHARI,new JadwalParameterizedRowMapper(),hari);
        return jadwals;
    }

    public void saveJadwal(String namaTable,Jadwal jadwal) {
        if(jadwal.getId()!=null){
            String SQL_UPDATE_JADWAL="UPDATE "+namaTable+" SET `ID_Matakuliah` = ?, `ID_Dosen` = ?, `Jam` = ?,`Hari` = ?, `Ruang`=?,`Keterangan`=? WHERE `ID` = ?";
            jdbcTemplate.update(SQL_UPDATE_JADWAL, new Object[]{
                jadwal.getMataKuliah().getId(),jadwal.getDosen().getId(),jadwal.getJamMulai(),jadwal.getHari(),jadwal.getRuang(),jadwal.getKeterangan(),jadwal.getId()
            });
        }else{
            String SQL_INSERT_JADWAL="INSERT INTO "+namaTable+" (`ID_Matakuliah`,`ID_Dosen`,`Jam`,`Hari`,`Ruang`,`Keterangan`)VALUES (?,?,?,?,?,?);";
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            String jam = dateFormat.format(jadwal.getJamMulai());
            jdbcTemplate.update(SQL_INSERT_JADWAL,new Object[]{
                jadwal.getMataKuliah().getId(),
                jadwal.getDosen().getId(),
                jam,
                jadwal.getHari(),
                jadwal.getRuang(),
                jadwal.getKeterangan()
            });
        }
    }
    
    public void saveJadwalHanyaMatakuliah(String namaTable,Integer idMatkul){
        String SQL_INSERT_JADWAL_HANYAMATAKULIAH="INSERT INTO "+namaTable+" (`ID_Matakuliah`)VALUES (?);";
        jdbcTemplate.update(SQL_INSERT_JADWAL_HANYAMATAKULIAH, idMatkul);
    }

    public Jadwal getJadwalById(String namaTable,Integer id) {
        String SQL_JADWAL_BYID="SELECT * FROM "+namaTable+" WHERE ID=?";
        if(id==null){
            return null;
        }else{
            Jadwal jadwal= jdbcTemplate.queryForObject(SQL_JADWAL_BYID,new JadwalParameterizedRowMapper(),id);
            return jadwal;
        }
    }

    public void deleteJadwal(String namaTable, Integer id){
        String SQL_DELETE_JADWAL="DELETE FROM "+namaTable+" WHERE ID=?";
        jdbcTemplate.update(SQL_DELETE_JADWAL, id);
    }
        
    public void deleteSemuaJadwal(String namaTable){
        String SQL_DELETE_SEMUA_JADWAL="DELETE FROM "+namaTable;
        jdbcTemplate.update(SQL_DELETE_SEMUA_JADWAL);
    }
}
