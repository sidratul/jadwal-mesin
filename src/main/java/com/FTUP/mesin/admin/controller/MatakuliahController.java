package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Dosen;
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
@RequestMapping("/matakuliah")
public class MatakuliahController {    
    @Autowired private MataKuliahDao mataKuliahDao;

    @RequestMapping("/tampil")
    public void tampilMatkul(ModelMap modelMap){
        List<MataKuliah> mataKuliahs = mataKuliahDao.getAllMatkul();
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
    
    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public void formInputMatkul(@RequestParam(value = "id",required = false) Integer id, 
    ModelMap modelMap){
        MataKuliah mataKuliah = mataKuliahDao.getMatkulById(id);
        if(mataKuliah==null){
            mataKuliah = new MataKuliah();
        }
        modelMap.addAttribute("matakuliah",mataKuliah);
    }
    
    @RequestMapping(value = "/input",method = RequestMethod.POST)
    public String prosesInputMatkul(@ModelAttribute MataKuliah mataKuliah,
    ModelMap modelMap){
        mataKuliahDao.saveMAtkul(mataKuliah);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String hapusMatkul(ModelMap modelMap){
        return "redirect:tampil";
    }
}
