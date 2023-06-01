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
public class SinhVienController {
	@Autowired
	SessionFactory factory;
	
	
    @RequestMapping(value="themsv")
    public String nhap(HttpServletRequest request, ModelMap model) {
    	HttpSession ss = request.getSession();
    	String searchInput = request.getParameter("searchInput");
    	String searchInput2 = request.getParameter("searchInput2");
		
    	request.setAttribute("lop",this.getL());
    	
    	if(ss.getAttribute("quyen1") != null) {
			TKQLE qL = (TKQLE) ss.getAttribute("quyen1");
			request.setAttribute("quyen1", qL);
		}
    	
    	request.setAttribute("sinhvien",this.getSV(searchInput));
    	request.setAttribute("malop",searchInput);
    	return "themsv";
    }
    
    
  /*  @RequestMapping(value ="nhap/{MaLTC}.htm",params="linkEdit")
    public String  edit(ModelMap model,@ModelAttribute("user") DangKiLTCE user,@PathVariable("MaLTC") String MaLTC) {
    	model.addAttribute("user",this.getltc(MaLTC));
    	return "nhapdiem/nhap";
    }*/
    @RequestMapping(value ="themsv.htm",params="btnAdd")
    public String  themSV(HttpServletRequest request, ModelMap model) throws ParseException {
    	HttpSession ss = request.getSession();
    	DayLopTCE nhapdiem2 = (DayLopTCE) ss.getAttribute("nhapdiem2");
    	String[] maSV = request.getParameterValues("masv1");
    	String[] hoSV = request.getParameterValues("hosv1");
    	String[] tenSV = request.getParameterValues("tensv1");
    	String[] phai = request.getParameterValues("phai1");
    	String[] diaChi = request.getParameterValues("diachi1");
    	String[] ngaySinh = request.getParameterValues("ngaysinh1");
    	String[] maLop =  request.getParameterValues("malop1");
    	for (int i=0; i<maSV.length;i++) {
    		SinhVienE sv = new SinhVienE();
    		
    		//Date date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ngaySinh[i]);
    		

    		if(maSV[i].isBlank() || hoSV[i].isBlank() || tenSV[i].isBlank() || diaChi[i].isBlank() || ngaySinh[i].isBlank() ) {
    			model.addAttribute("message", " ");
    			request.setAttribute("lop",this.getL());
    			request.setAttribute("malop",maLop[0]);
    			request.setAttribute("sinhvien",this.getSV(maLop[0]));
    			return "themsv";
    		}
        	sv.setMaSV(maSV[i]);
        	sv.setHoSV(hoSV[i]);
        	sv.setTenSV(tenSV[i]);
        	sv.setPhai(Boolean.parseBoolean(phai[i]));
        	sv.setDiaChi(diaChi[i]);
        	Date date =(Date) new SimpleDateFormat("yyyy-MM-dd").parse(ngaySinh[i]);
    		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        	sv.setNgaySinh(sqlDate);
        	sv.setMaLop(maLop[i]);
        	saveSV(sv,model);
    	}
    	request.setAttribute("lop",this.getL());
    	request.setAttribute("malop",maLop[0]);
		request.setAttribute("sinhvien",this.getSV(maLop[0]));
    	return "themsv";
    }

    @RequestMapping(value = "themsv.htm",params = "btnUpdate")
    public String capNhat(ModelMap model,@ModelAttribute("user") DangKiLTCE user,HttpServletRequest request) throws ParseException {
    	
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
    	String[] maSV = request.getParameterValues("masv");
    	String[] hoSV = request.getParameterValues("hosv");
    	String[] tenSV = request.getParameterValues("tensv");
    	String[] phai = request.getParameterValues("phai");
    	String[] diaChi = request.getParameterValues("diachi");
    	String[] ngaySinh = request.getParameterValues("ngaysinh");
    	//String maLop = searchInput ;
    	String[] maLop =  request.getParameterValues("malop");
    	for (int i=0; i<maSV.length;i++) {
    		SinhVienE sv = new SinhVienE();
    		
    		//Date date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ngaySinh[i]);
    		


        	sv.setMaSV(maSV[i]);
        	sv.setHoSV(hoSV[i]);
        	sv.setTenSV(tenSV[i]);
        	sv.setPhai(Boolean.parseBoolean(phai[i]));
        	sv.setDiaChi(diaChi[i]);
        	Date date =(Date) new SimpleDateFormat("yyyy-MM-dd").parse(ngaySinh[i]);
    		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        	sv.setNgaySinh(sqlDate);
        	sv.setMaLop(maLop[i]);
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

    	
    		//String lop = (String) request.getAttribute("searchInput3");
    		//request.setAttribute("sinhvien", this.getSV(maLop));
    		request.setAttribute("lop",this.getL());
    		request.setAttribute("malop",maLop[0]);
    		request.setAttribute("sinhvien",this.getSV(maLop[0]));
  
    	
    	return "themsv";
    }
    
    public Integer updateSV(SinhVienE sv,ModelMap model) {
    	
    	Session session = factory.openSession();
    	Transaction t = session.beginTransaction();
    	try {
			session.update(sv);;
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
 public Integer saveSV(SinhVienE sv,ModelMap model) {
    	
    	Session session = factory.openSession();
    	Transaction t = session.beginTransaction();
    	try {
			session.save(sv);;
			t.commit();
			model.addAttribute("message","them thanh cong");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message","them that bai");
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
    	return "themsv";
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
    public List<LopE> getL() {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From LopE ";
    	Query query=currentsession.createQuery(hql);
    	List<LopE> list= query.list(); 
    	return list;
    }
    public List<SinhVienE> getSV(String maLop) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From SinhVienE where MaLop =:maLop";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maLop",maLop);
    	List<SinhVienE> list= query.list(); 
    	return list;
    }
    public SinhVienE get1SV(String maSV) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From SinhVienE where MaSV =:maSV";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maSV",maSV);
    	SinhVienE list= (SinhVienE) query.list().get(0); 
    	return list;
    }
}
