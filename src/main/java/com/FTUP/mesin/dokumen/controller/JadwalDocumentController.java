package com.FTUP.mesin.dokumen.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.model.Jadwal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/jadwal")
public class JadwalDocumentController {
    
    @Autowired private JadwalDao jadwalDao;
    
    @RequestMapping("/pdf")
    public ModelAndView jadwalPdf(ModelAndView mav){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal("S1");
        
        JRDataSource jRDataSource =  new JRBeanCollectionDataSource(jadwals);
        
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("datasource", jRDataSource);        
        
        mav = new ModelAndView("jadwalPdfReport", map);
        
        return mav;
    }
    
}
