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
    ModelMap modelMap){
        pengumumanDao.savePengumuman(pengumuman);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String tampilPengumuman(@RequestParam("id") Integer id,
    ModelMap modelMap){
        pengumumanDao.deletePengumuman(id);
        return "redirect:tampil";
    }
}
