package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Jadwal;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal(semester);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
    
    @RequestMapping("/proses-tambah")
    public String prosesTambahMatkulToJadwal(@RequestParam("idMatkul") Integer idMatkul){
        MataKuliah mataKuliah = new MataKuliah();
        mataKuliah.setId(idMatkul);
        Jadwal jadwal = new Jadwal();
        jadwal.setMataKuliah(mataKuliah);
        jadwalDao.saveJadwal(jadwal);
        return "redirect:tambah";
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.GET)
    public void formEditJadwal(@RequestParam("id") Integer id,
    ModelMap modelMap){
        Jadwal jadwal = jadwalDao.getJadwalById(id);
        modelMap.addAttribute("jadwal", jadwal);
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.POST)
    public String prosesEditJadwal(@ModelAttribute Jadwal jadwal,
    ModelMap modelMap){
        jadwalDao.saveJadwal(jadwal);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String tutupJadwalMatkul(@ModelAttribute("id") Integer id,
    ModelMap modelMap){
        jadwalDao.deleteJadwal(id);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus-semua")
    public String hapusJadwal(ModelMap modelMap){
        jadwalDao.deleteSemuaJadwal();
        return "redirect:tampil";
    }
}
