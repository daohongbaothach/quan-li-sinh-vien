package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.*;
// thá»© tá»± tÃ¬m: mÃ£ lá»›p tc -> nÄƒm -> nÄƒm + há»�c kÃ¬ -> há»�c kÃ¬. 
@Controller
@Transactional
@RequestMapping("nhapdiem/")
public class LopTinChiController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "LTC")
    public String update1(HttpServletRequest request, ModelMap model) {
		HttpSession ss = request.getSession();
		TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
		request.setAttribute("quyen1", qL);
		ss.setAttribute("ltc", this.getAll_LTC());
    	String timLTC = request.getParameter("timLTC");
    	String timN =   request.getParameter("timN");
    	String timHK =  request.getParameter("timHK");
    	
    	if(timLTC == null && timN==null && timHK==null) {
    		model.addAttribute("users",this.getltc_n()); // lan dau mo len in ra tat ca cac ltc
    		return "nhapdiem/LTC";
    	}
    	
    	if(timLTC.isBlank()) {
    		if(timN.isBlank()) {
    			if(timHK.isBlank()) {
    				model.addAttribute("users",this.getltc_n()); // tat ca deu rong in ra toan bo danh sach
            		return "nhapdiem/LTC";
    			}
    			else {
    				model.addAttribute("users",this.timTheoHK(timHK)); // tim theo hk
        			return "nhapdiem/LTC";
    			}
    		}
    		if(timHK.isBlank()) {
    			model.addAttribute("users",this.timTheoNK(timN)); // tim theo nam
        		return "nhapdiem/LTC";
			}
    		else {
    			model.addAttribute("users",this.timTheoNKHK(timN,timHK)); // tim theo nam va hoc ki
        		return "nhapdiem/LTC";
    		}
    	}
    		model.addAttribute("users",this.getltc(timLTC)); // neu ltc ko rong thi tim ltc
        	return "nhapdiem/LTC";
	}

	@RequestMapping(value = "LTC.htm",params = "btnUpdate")
    public String update(ModelMap model,@ModelAttribute("user") LopTinChiE user,HttpServletRequest request) {
    	
    	String[] maltc = request.getParameterValues("maltc");
    	String[] svtt = request.getParameterValues("svtt");
    	String[] svtd = request.getParameterValues("svtd");
    	String[] mamh = request.getParameterValues("mamh");
    	String[] hocki = request.getParameterValues("hocki");
    	String[] nam = request.getParameterValues("nam");
    	String[] heso1 = request.getParameterValues("heso1");
    	String[] heso2 = request.getParameterValues("heso2");
    	String[] trangthai = request.getParameterValues("trangthai");
    	//String[] trangthaigoc = request.getParameterValues("trangthaigoc");
    	
    	for (int i=0; i<maltc.length;i++) {
    		LopTinChiE ltc = new LopTinChiE();
    		ltc.setMaLTC(maltc[i]);
    		ltc.setSVTT(Integer.parseInt(svtt[i]));
    		ltc.setSVTD(Integer.parseInt(svtd[i]));
    		ltc.setMaMH(mamh[i]);
    		ltc.setHocKi(Integer.parseInt(hocki[i]));
    		ltc.setNam(Integer.parseInt(nam[i]));
    		ltc.setHeSo1(Float.parseFloat(heso1[i]));
    		ltc.setHeSo2(Float.parseFloat(heso2[i]));
    		ltc.setTrangThai(Boolean.parseBoolean(trangthai[i]));
    		updateLTC(ltc,model);
    	}	
    	model.addAttribute("users",this.getltc_n());
    	return "nhapdiem/LTC";
    }
	
	@RequestMapping(value = "LTC.htm",params = "btnUpdateFew")
	public String updateFew(ModelMap model,@ModelAttribute("user") LopTinChiE user,HttpServletRequest request) {
		String TT ="False";
		//update(model, user, request,TT);
		return "nhapdiem/LTC";
	}
	
	 public int updateLTC(LopTinChiE ltc, ModelMap model) {
		 Session session = factory.openSession();
	    	Transaction t = session.beginTransaction();
	    	try {
				session.update(ltc);;
				t.commit();
				model.addAttribute("message","cap nhat thanh cong");
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("message","cap nhat that bai");
			}finally {
				session.close();
			}
	    	return 1;
	 }
	 public List<LopTinChiE> getAll_LTC() {
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE";
	    	Query query=currentsession.createQuery(hql);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    } 
	 public List<LopTinChiE> getltc(String maLTC) {
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE where MaLTC =:maLTC";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("maLTC",maLTC);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    } 
	 public List<LopTinChiE> getltc_n() {
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE";
	    	Query query=currentsession.createQuery(hql);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    }

	 public List<LopTinChiE> timTheoNK(String nK) {
		 	int i = Integer.parseInt(nK);
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE where Nam =:nK";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("nK",i);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    } 
	 public List<LopTinChiE> timTheoHK(String hK) {
		 	int j = Integer.parseInt(hK);
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE where HocKi =:hK";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("hK",j);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    } 
	 public List<LopTinChiE> timTheoNKHK(String nK, String hK) {
		 	int i = Integer.parseInt(nK); // ep kieu string sang int
		 	int j = Integer.parseInt(hK);
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From LopTinChiE where Nam =:nK and HocKi=:hK";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("nK",i);
	    	query.setParameter("hK",j);
	    	List<LopTinChiE> list= query.list();
	    	return list;
	    } 
	
}
