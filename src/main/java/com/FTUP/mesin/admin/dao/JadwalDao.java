package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Jadwal;
import java.util.List;

public interface JadwalDao {
    public List<Jadwal> getAllJadwal();
    
    public List<Jadwal> getJadwalByHari(Integer hari);
    
    public void saveJadwal(Jadwal jadwal);
    
    public void saveJadwalHanyaMatakuliah(Integer idMatkul);
    
    public Jadwal getJadwalById(Integer id);
    
    public void deleteJadwal(Integer id);
    
    public void deleteSemuaJadwal();
    
}
