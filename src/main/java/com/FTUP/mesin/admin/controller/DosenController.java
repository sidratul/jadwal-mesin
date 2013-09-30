package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String prosesInutDosen(@ModelAttribute Dosen dosen,
    ModelMap modelMap, RedirectAttributes redirectAttributes){        
        dosenDao.saveDosen(dosen);
        if(dosen.getId() !=null){
            redirectAttributes.addFlashAttribute("UpdateDosen", true);
        }else{
            redirectAttributes.addFlashAttribute("tambahDosen", true);
        }
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String hapusDosen(@RequestParam("id") Integer id,
    ModelMap modelMap,RedirectAttributes redirectAttributes){
        try {
            dosenDao.deleteDosen(id);
            redirectAttributes.addFlashAttribute("hapusDosen", true);
        } catch (DataIntegrityViolationException ex) {
            redirectAttributes.addFlashAttribute("hapusDosen", false);
        }
        return "redirect:tampil";
    }
}
