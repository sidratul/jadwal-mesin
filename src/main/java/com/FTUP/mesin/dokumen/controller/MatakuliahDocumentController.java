/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FTUP.mesin.dokumen.controller;

import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.MataKuliah;
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
@RequestMapping("/matakuliah")
public class MatakuliahDocumentController {
    
    @Autowired private MataKuliahDao mataKuliahDao;
    
    
    @RequestMapping("/pdf")
    public ModelAndView matkulPdf(@RequestParam("tingkat") String kategoriTingkat,
    ModelAndView mav,HttpServletRequest request){
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getAllMatkul(kategoriTingkat);
        
        JRDataSource jRDataSource = new JRBeanCollectionDataSource(mataKuliahs);
        
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("datasource", jRDataSource);
        map.put("context",request.getSession().getServletContext().getRealPath("/").toString());
        
        mav = new ModelAndView("matkulPdfReport", map);
        
        return mav;
    }
    
}
