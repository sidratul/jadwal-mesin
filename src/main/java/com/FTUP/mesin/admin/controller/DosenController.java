package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dosen")
public class DosenController {
    @Autowired private DosenDao dosenDao;
    
    @RequestMapping("/tampil")
    public void tampilDosen(ModelMap modelMap){
        List<Dosen> dosens = dosenDao.getAllDosen();
        modelMap.addAttribute("listDosen",dosens);
    }
    
    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public void formInputDosens(@RequestParam(required = false,value = "id") Integer id,
    ModelMap modelMap){
        Dosen dosen = dosenDao.getDosenById(id);
        if(dosen==null){
            dosen = new Dosen();
        }
        modelMap.addAttribute("dosen",dosen);
    }
    
    @RequestMapping(value = "/input",method = RequestMethod.POST)
    public String prosesInutDosen(@ModelAttribute Dosen dosen,ModelMap modelMap){
        
//        System.out.println(dosen.getNidn());
//        System.out.println(dosen.getNamaDosen());
//        System.out.println(dosen.getAlamat());
//        System.out.println(dosen.getNoTelpon());
//        System.out.println(dosen.getEmail());
        dosenDao.saveDosen(dosen);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String hapusDosen(@RequestParam("id") Integer id,
    ModelMap modelMap){
        dosenDao.deleteDosen(id);
        return "redirect:tampil";
    }
}
