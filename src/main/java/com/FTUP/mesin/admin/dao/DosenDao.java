package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;

public interface DosenDao {
    public List<Dosen> getAllDosen();
    
    public void saveDosen(Dosen dosen )throws DuplicateKeyException;
    
    public Dosen getDosenById(Integer id);
    
    public void deleteDosen(Integer id) throws DataIntegrityViolationException;
    
}
