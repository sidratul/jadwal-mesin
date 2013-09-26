/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FTUP.mesin.jadwal.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.model.Jadwal;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JadwalController {
    @Autowired JadwalDao jadwalDao;
    
    @RequestMapping("index")
    public void index(ModelMap modelMap){
        Calendar calendar = Calendar.getInstance();
        Integer hari = calendar.get(Calendar.DAY_OF_WEEK);
        List<Jadwal> jadwals = jadwalDao.getJadwalByHari(hari);
        
        modelMap.addAttribute("listJadwal",jadwals);
    }
}