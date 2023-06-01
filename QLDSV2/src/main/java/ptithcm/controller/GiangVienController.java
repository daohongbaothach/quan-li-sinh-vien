package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.*;

@Controller
@Transactional
@RequestMapping("search/")
public class GiangVienController {
	/*@Autowired
	SessionFactory factory;
	@RequestMapping("form")
	public String showForm() {
		return "search/index";
	}
	@RequestMapping("index")
		public String loginn(HttpServletRequest request, ModelMap model) {
			String searchInput = request.getParameter("searchInput");
			Session session=factory.getCurrentSession();
	    	String hql="From SinhVienE where MaSV =:searchInput";
	    	Query query =session.createQuery(hql);
	    	query.setParameter("searchInput",searchInput);
	    	List<TKSVE> list= query.list();
			if(list.isEmpty()) {
				request.setAttribute("message", "Khong tim thay");
				return "search/index";
			}
	    	model.addAttribute("masv",list);
			return "search/index";
		}
	
	@RequestMapping("formsv")
	public String showFormSV() {
		return "search/sinhvien_malop";
	}
	@RequestMapping("sinhvien_malop")
		public String SSV(HttpServletRequest request, ModelMap model) {
			String searchInput = request.getParameter("searchInput");
			Session session=factory.getCurrentSession();
	    	String hql="From SinhVienE where MaLop =:searchInput";
	    	Query query =session.createQuery(hql);
	    	query.setParameter("searchInput",searchInput);
	    	List<TKSVE> list= query.list();
			if(list.isEmpty()) {
				request.setAttribute("message", "Khong tim thay");
				return "search/sinhvien_malop";
			}
	    	model.addAttribute("lop",list);
			return "search/sinhvien_malop";
		}
	
	
	@RequestMapping("formlop")
	public String showFormLop() {
		return "search/a";
	}
	@RequestMapping("a")
		public String SearchLop(HttpServletRequest request, ModelMap model) {
			String searchInput = request.getParameter("searchInput");
			Session session=factory.getCurrentSession();
	    	String hql="From LopE where MaLop =:searchInput";
	    	Query query =session.createQuery(hql);
	    	query.setParameter("searchInput",searchInput);
	    	List<TKSVE> list= query.list();
			if(list.isEmpty()) {
				request.setAttribute("message", "Khong tim thay");
				return "search/a";
			}
	    	model.addAttribute("lop",list);
			return "search/a";
		}
	*/
}
