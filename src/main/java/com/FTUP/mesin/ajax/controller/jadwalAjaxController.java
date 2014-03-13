package com.FTUP.mesin.ajax.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/jadwal")
public class jadwalAjaxController {
    @Autowired private JadwalDao jadwalDao;
    
    
    @RequestMapping("/tampil")
    public @ResponseBody void simpanKeteranganById(@RequestParam("id") Integer id,
    @RequestParam("keterangan") Integer keterangan){
        jadwalDao.saveKeteranganById(id, keterangan);
        return;
    }
}
