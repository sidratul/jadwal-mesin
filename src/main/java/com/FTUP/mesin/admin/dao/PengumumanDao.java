package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Pengumuman;
import java.util.List;

public interface PengumumanDao {
    public List<Pengumuman> getAllPengumuman();
    
    public void savePengumuman(Pengumuman pengumuman);
    
    public Pengumuman getPengumumanById(Integer id);
    
    public void deletePengumuman(Integer id);
}
