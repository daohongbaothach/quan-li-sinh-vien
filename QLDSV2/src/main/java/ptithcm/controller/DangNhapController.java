package ptithcm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.*;

@Controller
@Transactional
//@RequestMapping("login/")
public class DangNhapController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("formlogin")
	public String showForm() {
		return "loginn";
	}
	@RequestMapping("loginn")
		public String dangNhap(HttpServletRequest request, ModelMap model) {
			HttpSession ss = request.getSession();
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			if(ss.getAttribute("quyen") != null || ss.getAttribute("quyen1") != null || ss.getAttribute("quyen2") != null ) {
				return "login/thongtindangnhap";
			}

			
			if(this.getTKSV(id, pw).isEmpty()) { 
				if(this.getTKGV(id, pw).isEmpty()) {
					if(this.getTKQL(id, pw).isEmpty()) {
						request.setAttribute("message", "Sai thong tin dang nhap");
						return "loginn";
					}
					ss.setAttribute("info", this.getTKQL(id,pw).get(0));
					ss.setAttribute("quyen1", this.getTKQL(id,pw).get(0));
					return "login/thongtindangnhap";
				}
				//request.setAttribute("info", list);
				//ss.setAttribute("user","admin");
				ss.setAttribute("info", this.getTKGV(id,pw).get(0));
				ss.setAttribute("quyen2", this.getTKGV(id,pw).get(0));
				//return "login/thongtin_gv";
				return "login/thongtindangnhap";
			}
			
			ss.setAttribute("quyen", this.getTKSV(id, pw).get(0));
			
			ss.setAttribute("info", this.getsv(id));
			ss.setAttribute("info_d", this.getDiem(id));
	    	ss.setAttribute("namhoc", this.getNam());	
			return "login/thongtindangnhap";
			}
		
	
	@RequestMapping("login/ttdn")
	public String tTDN(HttpServletRequest request) {
		String maltc = request.getParameter("maltc");
		request.setAttribute("message2",maltc);
		request.setAttribute("quyen", "2");
		return "login/thongtindangnhap";
	}
	@RequestMapping("login/thongtin_gv")
	public String thongTinGV(HttpServletRequest request) {
		HttpSession ss = request.getSession();
		ss.getAttribute("info");
		request.setAttribute("quyen", "giangvien");
		request.setAttribute("info", "info");
		return "login/thongtin_gv";
	}
	@RequestMapping("nhapdiem/nvnhap")
	public String gVNhapDiem(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws ServletException, IOException{
		HttpSession ss = request.getSession();
		TKGVE loginedInfo = (TKGVE) ss.getAttribute("quyen2");
		 request.setAttribute("quyen2", loginedInfo);
		 
		//request.getRequestDispatcher("/nhapdiem/nhap.htm").forward(request, response);

		//response.sendRedirect(request.getContextPath()+ "/nhapdiem/nhap.htm");
		return "nhapdiem/nhap";
	}
	@RequestMapping("nhapdiem/qlnhap")
	public String qLNhapDiem(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws ServletException, IOException{
		HttpSession ss = request.getSession();
		TKQLE loginedInfo = (TKQLE) ss.getAttribute("quyen1");
		 request.setAttribute("quyen1", loginedInfo);
		 
		//request.getRequestDispatcher("/nhapdiem/nhap.htm").forward(request, response);

		//response.sendRedirect(request.getContextPath()+ "/nhapdiem/nhap.htm");
		return "nhapdiem/nhap";
	}

	public List<LopTinChiE> getNam(){
		Session currentsession=factory.getCurrentSession();
		String hql="select Nam from LopTinChiE group by Nam";
    	Query query =currentsession.createQuery(hql);
    	List list= query.list();
		return list;
	}
	public SinhVienE getsv(String maSV ) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From SinhVienE where MaSV =:maSV";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maSV",maSV);
    	SinhVienE list= (SinhVienE) query.list().get(0); 
    	return list;
    }
	public List<TKSVE> getTKSV(String tK , String mK) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From TKSVE where TK =:tK and MK=:mK";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("tK",tK);
    	query.setParameter("mK",mK);
    	List<TKSVE> list= query.list(); 
    	return list;
    }
	public List<TKGVE> getTKGV(String tK , String mK) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From TKGVE where TK =:tK and MK=:mK";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("tK",tK);
    	query.setParameter("mK",mK);
    	List<TKGVE> list= query.list(); 
    	return list;
    }
	public List<DangKiLTCE> getDiem(String maSV ) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DangKiLTCE where MaSV =:maSV and HuyDK ='False'";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maSV",maSV);
    	List<DangKiLTCE> list= query.list(); 
    	return list;
    }
	public List<TKQLE> getTKQL(String tK , String mK) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From TKQLE where TK =:tK and MK=:mK";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("tK",tK);
    	query.setParameter("mK",mK);
    	List<TKQLE> list= query.list(); 
    	return list;
    }
	public GiangVienE getGV(String maGV ) {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From GiangVienE where MaGV =:maGV";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maGV",maGV);
    	GiangVienE list= (GiangVienE) query.list().get(0); 
    	return list;
    }
/*	public List<LopTinChiE> getNKHK(String maSV) {
		Session currentsession=factory.getCurrentSession();
    	String hql="From DangKiLTCE where MaSV =:maSV and HuyDK ='False'";
    	Query query=currentsession.createQuery(hql);
    	query.setParameter("maSV",maSV);
    	List<DangKiLTCE> list= query.list(); 
    	return list;
	}*/
	
}
