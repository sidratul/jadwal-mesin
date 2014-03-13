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
    private static final String SQL_JADWAL_BYHARI="SELECT j.* FROM MATAKULIAH m RIGHT JOIN JADWAL j "
            + "ON m.ID = j.ID_Matakuliah "
            + "WHERE j.ID_Matakuliah is NOT NULL AND m.Kategori_Tingkat=? AND Hari=? ORDER BY JAM ASC";
    private static final String SQL_GETALL_JADWAL="SELECT j.* FROM MATAKULIAH m RIGHT JOIN JADWAL j "
            + "ON m.ID = j.ID_Matakuliah "
            + "WHERE j.ID_Matakuliah is NOT NULL AND m.Kategori_Tingkat=? ORDER BY Hari ASC" ;
    private static final String SQL_INSERT_JADWAL_HANYAMATAKULIAH="INSERT INTO JADWAL (`ID_Matakuliah`)VALUES (?)";
    private static final String SQL_UPDATE_JADWAL="UPDATE JADWAL SET `ID_Matakuliah` = ?, `ID_Dosen` = ?,"
            + " `Jam` = ?,`Hari` = ?, `Ruang`=?,`Keterangan`=?, Kelas=? WHERE `ID` = ?";
    private static final String SQL_UPDATE_KETERANGAN="UPDATE JADWAL SET `Keterangan`=? WHERE `ID` = ?";
    private static final String SQL_INSERT_JADWAL="INSERT INTO JADWAL "
            + "(`ID_Matakuliah`,`ID_Dosen`,`Jam`,`Hari`,`Ruang`,`Keterangan`,Kelas)VALUES (?,?,?,?,?,?,?)";
    private static final String SQL_JADWAL_BYID="SELECT * FROM JADWAL WHERE ID=?";
    private static final String SQL_DELETE_JADWAL="DELETE FROM JADWAL WHERE ID=?";
    private static final String SQL_DELETE_SEMUA_JADWAL="DELETE j.* FROM "
            + "JADWAL j LEFT JOIN MATAKULIAH m ON m.ID = j.ID_Matakuliah "
            + "WHERE j.ID_Matakuliah is NOT NULL AND m.Kategori_Tingkat=?";
    
    private static final String SQL_DELETE_KETERANGAN="update JADWAL j, MATAKULIAH m set j.Keterangan='0' "
            + "where j.ID_Matakuliah=m.id and m.Kategori_TINGKAT=? and Hari=?";
    
    
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
            jadwal.setKelas(rs.getString("Kelas"));
            
            Date waktuSelesai;
            
            try{                
                jadwal.setJamSelesai(new Date(
                        jadwal.getJamMulai().getTime()+((MENIT * 50) * jadwal.getMataKuliah().getSks())
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
    
    public List<Jadwal> getAllJadwal(String kategoriTingkat) {
        List<Jadwal> jadwals = jdbcTemplate.query(SQL_GETALL_JADWAL, new JadwalParameterizedRowMapper(),kategoriTingkat);
        return jadwals;
    }
    
    public List<Jadwal> getJadwalByHari(String kategoriTingkat,Integer hari) {
        List<Jadwal> jadwals = jdbcTemplate.query(SQL_JADWAL_BYHARI,new JadwalParameterizedRowMapper(),kategoriTingkat,hari);
        return jadwals;
    }

    public void saveJadwal(Jadwal jadwal) {
        if(jadwal.getId()!=null){
            jdbcTemplate.update(SQL_UPDATE_JADWAL, new Object[]{
                jadwal.getMataKuliah().getId(),
                jadwal.getDosen().getId(),
                jadwal.getJamMulai(),
                jadwal.getHari(),
                jadwal.getRuang(),
                jadwal.getKeterangan(),
                jadwal.getKelas(),
                jadwal.getId()
            });
        }else{
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            String jam = dateFormat.format(jadwal.getJamMulai());
            jdbcTemplate.update(SQL_INSERT_JADWAL,new Object[]{
                jadwal.getMataKuliah().getId(),
                jadwal.getDosen().getId(),
                jam,
                jadwal.getHari(),
                jadwal.getRuang(),
                jadwal.getKeterangan(),
                jadwal.getKelas()
            });
        }
    }
    
    public void saveKeteranganById(Integer id, Integer keterangan){
        jdbcTemplate.update(SQL_UPDATE_KETERANGAN,keterangan,id);
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

    public void deleteJadwal(Integer id){
        jdbcTemplate.update(SQL_DELETE_JADWAL, id);
    }
        
    public void deleteSemuaJadwal(String kategoriTingkat){
        jdbcTemplate.update(SQL_DELETE_SEMUA_JADWAL,kategoriTingkat);
    }
    
    public void deleteKeterangan(Integer hari,String kategoriTingkat){
        jdbcTemplate.update(SQL_DELETE_KETERANGAN,kategoriTingkat,hari);
    }
}
