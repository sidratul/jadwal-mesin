package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Jadwal;
import java.util.List;

public interface JadwalDao {
    public List<Jadwal> getAllJadwal();
    
    public void saveJadwal(Jadwal jadwal);
    
    public Jadwal getJadwalById(Integer id);
    
    public void deleteJadwal(Integer id);
}
