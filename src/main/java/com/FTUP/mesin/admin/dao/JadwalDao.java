package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Jadwal;
import java.util.List;

public interface JadwalDao {
    public List<Jadwal> getAllJadwal(String namaTable);
    
    public List<Jadwal> getJadwalByHari(String namaTable,Integer hari);
    
    public void saveJadwal(String namaTable,Jadwal jadwal);
    
    public void saveJadwalHanyaMatakuliah(String namaTable,Integer idMatkul);
    
    public Jadwal getJadwalById(String namaTable,Integer id);
    
    public void deleteJadwal(String namaTable,Integer id);
    
    public void deleteSemuaJadwal(String namaTable);
    
}
