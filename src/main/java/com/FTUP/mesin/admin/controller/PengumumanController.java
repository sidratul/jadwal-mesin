package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.PengumumanDao;
import com.FTUP.mesin.admin.model.Pengumuman;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/pengumuman")
public class PengumumanController {
    @Autowired PengumumanDao pengumumanDao;
    
    @RequestMapping("/tampil")
    public void tampilPengumuman(ModelMap modelMap){
        List<Pengumuman> pengumumans = pengumumanDao.getAllPengumuman();
        modelMap.addAttribute("listPengumuman", pengumumans);
    }
    
    @RequestMapping(value = "/input" , method = RequestMethod.GET)
    public void tampilFormPengumuman(@RequestParam(value = "id",required = false) Integer id,
    ModelMap modelMap){
        Pengumuman pengumuman = pengumumanDao.getPengumumanById(id);
        if(pengumuman == null){
            pengumuman = new Pengumuman();
        }
        
        modelMap.addAttribute("pengumuman", pengumuman);
    }
    
    @RequestMapping(value = "/input" , method = RequestMethod.POST)
    public String prosesFormPengumuman(@ModelAttribute Pengumuman pengumuman,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        pengumumanDao.savePengumuman(pengumuman);
        if(pengumuman.getId() != null){
            redirectAttributes.addFlashAttribute("updatePengumuman", true);
        }else{
            redirectAttributes.addFlashAttribute("inputPengumuman", true);
        }
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String hapusPengumuman(@RequestParam("id") Integer id,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        pengumumanDao.deletePengumumanById(id);
        redirectAttributes.addFlashAttribute("hapusPengumuman", true);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus-semua")
    public String hapusSemuaPengumuman(ModelMap modelMap, RedirectAttributes redirectAttributes){
        pengumumanDao.deleteSemuaPengumuman();
        redirectAttributes.addFlashAttribute("hapusSemuaPengumuman", true);
        return "redirect:tampil";
    }
}
