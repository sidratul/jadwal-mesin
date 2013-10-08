package com.FTUP.mesin.dokumen.controller;

import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.model.Jadwal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/jadwal")
public class JadwalDocumentController {
    
    @Autowired private JadwalDao jadwalDao;
    
    @RequestMapping("/pdf")
    public ModelAndView jadwalPdf(@RequestParam("tingkat") String kategoriTIngkat,
    ModelAndView mav,HttpServletRequest request){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal(kategoriTIngkat);
        
        JRDataSource jRDataSource =  new JRBeanCollectionDataSource(jadwals);
        
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("datasource", jRDataSource);
        map.put("context",request.getSession().getServletContext().getRealPath("/").toString());
        
        mav = new ModelAndView("jadwalPdfReport", map);
        
        return mav;
    }
    
}
