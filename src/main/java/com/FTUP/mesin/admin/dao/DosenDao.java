package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;

public interface DosenDao {
    public List<Dosen> getAllDosen();
    
    public void saveDosen(Dosen dosen );
    
    public Dosen getDosenById(Integer id);
    
    public void deleteDosen(Integer id);
    
}
