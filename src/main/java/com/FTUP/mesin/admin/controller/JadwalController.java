package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Jadwal;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/jadwal")
public class JadwalController {
    
    @Autowired JadwalDao jadwalDao;
    @Autowired MataKuliahDao mataKuliahDao;
    
    @RequestMapping("/tampil")
    public void tampilJadwal(ModelMap modelMap){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal();
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tambah")
    public void inputMatakulihToJadwal(@RequestParam(value = "semester",required = false) Integer semester,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemester(semester);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
}
