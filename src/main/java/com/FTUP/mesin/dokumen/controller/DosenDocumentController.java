package com.FTUP.mesin.dokumen.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dosen")
public class DosenDocumentController {
    
    @Autowired private DosenDao dosenDao;
    
    @RequestMapping("/pdf")
    public ModelAndView dosenPdf(ModelAndView mav, HttpServletRequest request){
        List<Dosen> dosens = dosenDao.getAllDosen();
        
        JRDataSource jRDataSource = new JRBeanCollectionDataSource(dosens);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("datasource", jRDataSource);
        map.put("context",request.getSession().getServletContext().getRealPath("/").toString());
        
        mav = new ModelAndView("dosenPdfReport", map);
        
        return mav;
    }
}
