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

@Controller
@Transactional
@RequestMapping("nhapdiem/")
public class DiemController {
	@Autowired
	SessionFactory factory;
	
	
    @RequestMapping(value="nhap")
    public String nhap(HttpServletRequest request, ModelMap model) {
    	HttpSession ss = request.getSession();
    	String searchInput = request.getParameter("searchInput");
    	String searchInput2 = request.getParameter("searchInput2");
    	request.setAttribute("sI", searchInput);
		/*Session session=factory.getCurrentSession();
    	String hql="From DangKiLTCE where MaLTC =:searchInput";
    	Query query =session.createQuery(hql);
    	query.setParameter("searchInput",searchInput);
    	List<LopTinChiE> list= query.list();
		if(list.isEmpty()) {
			request.setAttribute("message", "Khong tim thay");
			return "nhapdiem/nhap";
		}*/
    	request.setAttribute("ltc",this.getAll_LTC());
    	
    	if(ss.getAttribute("quyen1") != null) {
			TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
			request.setAttribute("quyen1", qL);
		}
    	if(ss.getAttribute("quyen2") != null) {
    		TKGVE gV = (TKGVE) ss.getAttribute("quyen2");
    		request.setAttribute("quyen2", gV);
    		request.setAttribute("ltcgv",this.getLTCGV0(gV.getTK()));
    		if(gV.getMaQuyen() == 2) {
        		if(this.getLTCGV(searchInput2,gV.getTK()).isEmpty()) { // neu ko tim thay maloptc cua magv do thi return

        			return "nhapdiem/nhap";
        		}// neu tim thay thi cho nhap diem cua ltc do
        		request.setAttribute("nhapdiem2",this.getLTCGV(searchInput2, gV.getTK()).get(0));
        		
        		return "nhapdiem/nhap";
        	}
    	}
		

	//	model.addAttribute("quyenms", loginedInfo.getMaQuyen());
    	
    	request.setAttribute("nhapdiem",this.getltc(searchInput));
    	return "nhapdiem/nhap";
    }
    
    
  /*  @RequestMapping(value ="nhap/{MaLTC}.htm",params="linkEdit")
    public String  edit(ModelMap model,@ModelAttribute("user") DangKiLTCE user,@PathVariable("MaLTC") String MaLTC) {
    	model.addAttribute("user",this.getltc(MaLTC));
    	return "nhapdiem/nhap";
    }*/
    @RequestMapping(value ="nhap/{nam.maLTC}.htm",params="linkEdit")
    public String  nhapMaLTC(HttpServletRequest request, ModelMap model,@PathVariable("nam.maLTC") String LTC) {
    	HttpSession ss = request.getSession();
    	if(ss.getAttribute("quyen1") != null) {
			TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
			request.setAttribute("quyen1", qL);
		}
    	model.addAttribute("nhapdiem",this.getltc(LTC));
    	return "nhapdiem/nhap";
    }
    
    @RequestMapping(value = "nhap.htm",params = "btnUpdate")
    public String capNhat(ModelMap model,@ModelAttribute("user") DangKiLTCE user,HttpServletRequest request) {
    	
  /*  	String maltc = request.getParameter("maltc");
    	String masv = request.getParameter("masv");
    	String dcc = request.getParameter("dcc");
    	String dgk = request.getParameter("dgk");
    	String dthi = request.getParameter("dthi");
    	String huydk = request.getParameter("huydk");*/
    	HttpSession ss = request.getSession();
    	
		TKGVE gV = (TKGVE) ss.getAttribute("quyen2");
		TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
		request.setAttribute("quyen2", gV);
		request.setAttribute("quyen1", qL);
		DayLopTCE nhapdiem2 = (DayLopTCE) ss.getAttribute("nhapdiem2");
    	String[] maltc = request.getParameterValues("maltc");
    	String[] masv = request.getParameterValues("masv");
    	String[] dcc = request.getParameterValues("dcc");
    	String[] dgk = request.getParameterValues("dgk");
    	String[] dthi = request.getParameterValues("dthi");

    	for (int i=0; i<masv.length;i++) {
    		DangKiLTCE sv = new DangKiLTCE();
    		sv.setMaLTC(maltc[i]);
        	sv.setMaSV(masv[i]);
    		sv.setDCC(Float.parseFloat(dcc[i]));
    		sv.setDGK(Float.parseFloat(dgk[i]));
    		sv.setDThi(Float.parseFloat(dthi[i]));

        	updateSV(sv,model);
    	}

    	//sv =user;
    	
    		//	sv = getsv(maltc,masv);
    		//	model.addAttribute("message2",dcc);
		
    	
    	//model.addAttribute("nhapdiem",this.getltc(maltc[0]));
    	if(ss.getAttribute("quyen2") != null ) {
    		request.setAttribute("quyen2", gV);
    		request.setAttribute("ltcgv",this.getLTCGV0(gV.getTK()));
    		request.setAttribute("nhapdiem2", nhapdiem2);
    	}
    	if(ss.getAttribute("quyen1")!=null) {
    		request.setAttribute("nhapdiem",this.getltc(maltc[0]));
    		request.setAttribute("ltc",this.getAll_LTC());
    	}
    	
    /*	String sI = request.getParameter("sI");
    	if(ss.getAttribute("quyen2") != null) {
    		TKGVE tKGV = (TKGVE) ss.getAttribute("quyen2");
    		request.setAttribute("quyen2", tKGV);
    		if(gV.getMaQuyen() == 2) {
        		if(this.getLTCGV(sI,tKGV.getTK()).isEmpty()) { // neu ko tim thay maloptc cua magv do thi return
        			return "nhapdiem/nhap";
        		}// neu tim thay thi cho nhap diem cua ltc do
        		model.addAttribute("nhapdiem2",this.getLTCGV(sI, tKGV.getTK()).get(0));
        		return "nhapdiem/nhap";
        	}
    	}*/
    	return "nhapdiem/nhap";
    }
    
    public Integer updateSV(DangKiLTCE sv,ModelMap model) {
    	
    	Session session = factory.openSession();
    	Transaction t = session.beginTransaction();
    	try {
			session.update(sv);;
			t.commit();
			model.addAttribute("message","update thanh cong");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message","them moi that bai");
		}finally {
			session.close();
		}
    	return 1;
    }
    @RequestMapping(value = "update",params = "btnUpdate")
    public String capNhat2(HttpServletRequest request) {
    	DangKiLTCE dangKiLTCE = new DangKiLTCE();
    	String[] MaLTC = request.getParameterValues("maltc");
    	String[] MaSV = request.getParameterValues("masv");
    	String[] dcc = request.getParameterValues("dcc");
    	String[] dgk = request.getParameterValues("dgk");
    	for(int i = 0; i < MaLTC.length;i++) {



    	}
    	return "nhapdiem/nhap";
    }
    public List<LopTinChiE> getAll_LTC() {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From LopTinChiE";
    	Query query=currentsession.createQuery(hql);
    	List<LopTinChiE> list= query.list();
    	return list;
    } 
    public List<DangKiLTCE> getltc(String maLTC) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DangKiLTCE where MaLTC =:maLTC";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maLTC",maLTC);
    	List<DangKiLTCE> list= query.list();
    	return list;
    }
    public List<DayLopTCE> getLTCGV(String maLTC, String maGV) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DayLopTCE where MaLTC =:maLTC and MaGV=:maGV";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maLTC",maLTC);
    	query.setParameter("maGV",maGV);
    	List<DayLopTCE> list= query.list();
    	return list;
    }
    public List<DayLopTCE> getLTCGV0(String maGV) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DayLopTCE where MaGV=:maGV";
    	Query query=currentsession.createQuery(hql);

    	query.setParameter("maGV",maGV);
    	List<DayLopTCE> list= query.list();
    	return list;
    }
    public List<DangKiLTCE> getltc0() {
    	Session currentsession=factory.getCurrentSession();
    	String hql="FROM DangKiLTCE";
    	Query query=currentsession.createQuery(hql);
    	List<DangKiLTCE> list=query.list();
    	return list;
    }
    public DangKiLTCE getsv(String maLTC, String maSV ) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DangKiLTCE where MaSV =:maSV and MaLTC =:maLTC";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maSV",maSV);
    	query.setParameter("maLTC",maLTC);
    	DangKiLTCE list= (DangKiLTCE) query.list().get(0); 
    	return list;
    }
    @RequestMapping("nhapdiem/index")
    public String index() {
    	return "nhapdiem/index";
    }
}
