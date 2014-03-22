package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Jadwal;
import java.util.List;

public interface JadwalDao {
    public List<Jadwal> getAllJadwal(String kategoriTingkat);
    
    public List<Jadwal> getJadwalByHari(String namaTable,Integer hari);
    
    public void saveJadwal(Jadwal jadwal);
    
    public void saveKeteranganById(Integer id, String keterangan);
    
    public void saveJadwalHanyaMatakuliah(Integer idMatkul);
    
    public Jadwal getJadwalById(Integer id);
    
    public void deleteJadwal(Integer id);
    
    public void deleteSemuaJadwal(String kategoriTingkat);
    
    public void deleteKeterangan(Integer hari,String kategoriTingkat);
    
}
