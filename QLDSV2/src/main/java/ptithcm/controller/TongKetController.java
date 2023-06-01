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
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.*;

@Controller
@Transactional
//@RequestMapping("login/")
public class TongKetController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("tongket")
		public String tongKet(HttpServletRequest request, ModelMap model) {

			HttpSession ss = request.getSession();
			TKGVE loginedInfo = (TKGVE) ss.getAttribute("quyen");
			 request.setAttribute("quyen", "1");
			 PagedListHolder pagedListHolder =  new PagedListHolder(this.getLTCNam()) ;
			 int page = ServletRequestUtils.getIntParameter(request,"p",0);
			 pagedListHolder.setPage(page);
			 pagedListHolder.setMaxLinkedPages(4);
			 pagedListHolder.setPageSize(4);
	    	request.setAttribute("namhoc", this.getNam());	
	    	request.setAttribute("ltcnam", this.getLTCNam());	
	    	request.setAttribute("tdiem", this.getTDiem());	
	    	
	    	model.addAttribute("pagedListHolder", pagedListHolder);
	    	
	    	
			return "tongket";
			}
		
	@RequestMapping("dayltc")
	public String dayLTC() {
		return "dayltc";
	}
/*	@RequestMapping("login/ttdn")
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
	@RequestMapping("nhapdiem/nhap")
	public String rNhapDiem(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws ServletException, IOException{
		HttpSession ss = request.getSession();
		TKGVE loginedInfo = (TKGVE) ss.getAttribute("quyen");
		 request.setAttribute("quyen", loginedInfo);
		 
		//request.getRequestDispatcher("/nhapdiem/nhap.htm").forward(request, response);

		//response.sendRedirect(request.getContextPath()+ "/nhapdiem/nhap.htm");
		return "nhapdiem/nhap";
	}*/

	public List getNam(){
		Session currentsession=factory.getCurrentSession();
		String hql=" select Nam from LopTinChiE group by Nam";
    	Query query =currentsession.createQuery(hql);
    	List list= query.list();
		return list;
	}
	public List<LopTinChiE> getLTCNam(){
		Session currentsession=factory.getCurrentSession();
		String hql=" from LopTinChiE order by HocKi,Nam";
    	Query query =currentsession.createQuery(hql);
    	List<LopTinChiE> list= query.list();
		return list;
	}
	
	public List<DangKiLTCE> getTDiem() {
    	Session currentsession=factory.getCurrentSession();
    	String hql="From DangKiLTCE ";
    	Query query=currentsession.createQuery(hql);
    	List<DangKiLTCE> list= query.list(); 
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
}
