package ptithcm.controller;

import java.text.DateFormat;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
@Transactional
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value="taotk" )
	public String TTK(){
		return "taotk";
	}
    @RequestMapping(value="taotk", params = "btnAdd")
    public String taotk(HttpServletRequest request, ModelMap model) {
    	HttpSession ss = request.getSession();

		TKGVE gV = (TKGVE) ss.getAttribute("quyen2");
		TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
		request.setAttribute("quyen2", gV);
		request.setAttribute("quyen1", qL);
		DayLopTCE nhapdiem2 = (DayLopTCE) ss.getAttribute("nhapdiem2");
    	String[] tK = request.getParameterValues("tk");
    	String[] mK = request.getParameterValues("mk");
    	String[] quyen = request.getParameterValues("quyen");
    	model.addAttribute("message", quyen[0]);
    	if(quyen[0].equals("1")) {
    		
        		TKQLE sv = new TKQLE();
            	sv.setTK(tK[0]);
            	sv.setMK(mK[0]);
            	sv.setMaQuyen(Integer.parseInt(quyen[0]));
            	updateTKQL(sv,model);
        	
    	}
    	if(quyen[0].equals("2")) {
    		for (int i=0; i<tK.length;i++) {
    			if(this.kiemTraGV(tK[0]) == 0) {
    				model.addAttribute("message", "Mã giảng viên không hợp lệ");
    				return "taotk";
    			}
        		TKGVE sv = new TKGVE();
            	sv.setTK(tK[0]);
            	sv.setMK(mK[0]);
            	sv.setMaQuyen(Integer.parseInt(quyen[0]));
            	updateTKGV(sv,model);
        	}
    	}
    	if(quyen[0].equals("3")) {
    		for (int i=0; i<tK.length;i++) {
    			if(this.kiemTraSV(tK[0]) == 0) {
    				model.addAttribute("message", "Mã sinh viên không hợp lệ");
    				return "taotk";
    			}
        		TKSVE sv = new TKSVE();
            	sv.setTK(tK[0]);
            	sv.setMK(mK[0]);
            	sv.setMaQuyen(Integer.parseInt(quyen[0]));
            	updateTKSV(sv,model);
        	}
    	}

    	return "taotk";
    }
    public Integer updateTKSV(TKSVE sv,ModelMap model) {
    	
    	Session session = factory.openSession();
    	Transaction t = session.beginTransaction();
    	try {
			session.save(sv);;
			t.commit();
			model.addAttribute("message","update thanh cong");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message","update that bai");
		}finally {
			session.close();
		}
    	return 1;
    }
	 public Integer updateTKGV(TKGVE sv,ModelMap model) {
	    	
	    	Session session = factory.openSession();
	    	Transaction t = session.beginTransaction();
	    	try {
				session.save(sv);;
				t.commit();
				model.addAttribute("message","update thanh cong");
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("message","update that bai");
			}finally {
				session.close();
			}
	    	return 1;
	    }
	 public Integer updateTKQL(TKQLE sv,ModelMap model) {
	 	
	 	Session session = factory.openSession();
	 	Transaction t = session.beginTransaction();
	 	try {
				session.save(sv);;
				t.commit();
				model.addAttribute("message","update thanh cong");
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("message","update that bai");
			}finally {
				session.close();
			}
	 	return 1;
	 }
	 public int kiemTraSV(String maSV) {
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From SinhVienE where MaSV =:maSV";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("maSV",maSV);
	    	if( query.list().isEmpty()) {
	    		return 0;
	    	}
	    	return 1;
	    }
	 public int kiemTraGV(String maGV) {
	    	Session currentsession=factory.getCurrentSession();
	    	String hql="From GiangVienE where MaGV =:maGV";
	    	Query query=currentsession.createQuery(hql);
	    	query.setParameter("maGV",maGV);
	    	if( query.list().isEmpty()) {
	    		return 0;
	    	}
	    	return 1;
	    }
}
